---
title: Entity Programming Model
author: DanBehrendt
description: Landing page for Entities.
ms.author: joanlee
ms.date: 03/12/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, entities
ms.localizationpriority: medium
---

# Entity Programming Model

Entities are the most basic addressable "things" that PlayFab APIs operate on. Each entity has a Type and an Id that together uniquely identify it. Some types of entities are "standard" or "built-in" in that PlayFab knows something about their meaning and/or automatically creates them, for example `namespace`, `title`, `group`, `master_player_account`, and `title_player_account`. Others might have no inherent meaning to PlayFab but have meaning in your game.

Every entity has a profile that contains various resources owned by that entity. For example, objects, files, language settings, policies, and others to come. An entity profile is retrieved directly with the `GetProfile` API, and many other APIs operate on specific resources inside of the profile, such as `SetObjects`.

Finally, there are parent/child relationships between entities which factor into the permissions governing how an entity's resources might be accessed by other entities. The "ancestors" of a given entity can be found in the `Lineage` property of its profile.

## Comparison with Classic API

With that out of the way, let's look at the differences between the "classic" and "entity" APIs. If you're using the classic APIs, you're already working with the same entities that you can use with the entity APIs, but they're not always explicit. For example, in the Client API, `UpdateUserData` operates on a `title_player_account` entity, `GetUserPublisherData` operates on a `master_player_account`, `GetCharacterStatistics` operates on a `character` (that is a child of the `title_player_account`), `GetTitleData` operates on a title and `GetPublisherData` operates on a `namespace`.

In general, each classic API operates on one specific type of entity, but the entity type is often implicit and doesn't necessary follow from the API name. Moreover, the equivalent APIs for two types of entities might subtly vary with respect to their parameters, limits, and behavior (e.g. `UpdatePlayerStatistics` vs. `UpdateCharacterStatistics`). If you're feeling confused by this, you aren't alone. We wanted to simplify the PlayFab APIs without ever breaking compatibility with the existing set, which takes us to...

"Entity APIs" are what we've been calling the newer PlayFab APIs, which adhere to the following design goals (with some exceptions).

- Work with arbitrary types of entities.
- Have explicit parameters for the entity Type and Id.
- Perform a specific operation on a specific resource in the entity profile.
- Can be called in multiple security contexts, such as from game clients, game servers, Cloud Script, back-end servers, etc., with the permissions defined by policies and selected according to which entity is calling the API.

We believe that following these principles will result in fewer APIs that do more, are more efficient to maintain and operate, and are easier for developers to learn. Basically, this is the way we would design all PlayFab APIs if we were to start over, knowing everything we've learned over the past five years about how developers are using PlayFab. Of course, one of our most important principles at PlayFab is to never break live titles, if at all possible, which means we must maintain backward compatibility with all released APIs.

## Considerations for Classic API users

To accomplish our design goals while maintaining compatibility, we have been introducing these entity APIs as a separate set usually, existing side-by-side with the classic APIs. While the entity APIs can work with the same entities as the classic APIs, in most cases they operate on a separate set of resources / data owned by these entities. For example, the `SetObjects` entity API and the `UpdateUserData` classic API can both store data under a `title_player_account` entity, but the data that the two APIs "see" are separate. Here are some of the practical implications:

#### The bad

- If your title is already using classic APIs for data, inventories, etc. with players (also known as `title_player_account`s), that existing data won't automatically show up in the equivalent entity APIs.
- It takes some time before the entity APIs have feature parity with the classic APIs. The data is stored separately in most cases, and there are many back-end changes required to support them. There might be some classic functionality that never makes it to the entity API.

#### The good

- You don't have to do anything. If your game is already working well on PlayFab classic APIs, it continues to work.
- You can start using entity APIs while continuing to use classic APIs on the same set of entities. In some situations there are clear benefits to doing this, at little cost, e.g. adding a new feature to your game that saves larger amounts of data in a file, in addition to existing settings stored in classic "player data".

## Functionality Overview

The entity programming model is the foundation for PlayFab's next generation of data and game services. 

- [Authentication](xref:titleid.playfabapi.com.authentication.authentication)
- [Profiles](xref:titleid.playfabapi.com.profiles.accountmanagement)
- [Groups](xref:titleid.playfabapi.com.groups.groups)
- [Data - File](xref:titleid.playfabapi.com.data.file)
- [Data - Object](xref:titleid.playfabapi.com.data.object)
- [Events](../../api-references/events/index.md)
- [CloudScript](xref:titleid.playfabapi.com.cloudscript.server-sidecloudscript)
- [Multiplayer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)

### Supported Entity types

The following list describes the available Entity types, which can be used to construct an `EntityKey`. Entity Keys are used to identify entities in most newer API methods.

These values are meant to be used in the `EntityKey.Type` field.

> [!NOTE]
> These are *case sensitive*. Other/custom values *will not* currently work.

#### namespace

The `namespace` is the singular Entity that refers to *all* global information for every Title within a Studio. This information should be static. Changes to this Entity *aren't* reflected in real time.

Set the `ID` field to your `GamePublisherId`. To retrieve your `GamePublisherId`:

- Sign in to [Game Manager](https://developer.playfab.com).
- From the **My Studios and Titles** page, select the appropriate Title.
- Select the gear icon in the left corner of the Title page and then select **Title Settings**.
- Select the **API Features** tab.

The **Publisher ID** on the **API Features** page is your `GamePublisherId`.

#### title

The `title` is the singular Entity that refers to all global information for that Title. This information should be static. Changes to this Entity *aren't* reflected in real time.

Set the `ID` field to your game's `TitleId`. To retrieve your `TitleId`:

- Sign in to [Game Manager](https://developer.playfab.com).
- On the **My Studios and Titles** page locate your Title.

The Title ID is located just below the name of your Title.

#### master_player_account

The `master_player_account` is a Player Entity that is shared among all Titles within a Studio.

Set the ID field to `PlayFabId` from the Classic API, returned by any `LoginResult.PlayFabId`.

#### title_player_account

`title_player_account`, for most developers, represents the Player in the most traditional way.

Set the `ID` field to `LoginResult.EntityToken.Id` in the Client API, or `GetEntityTokenResponse.Entity.Id` in the Authentication API.

#### character

The `character` is a sub-entity of `title_player_account` and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

Set the `ID` field to any `characterId` from `result.Characters[i].CharacterId`.

#### group

The `group` is an Entity that contains other Entities. It's currently limited to Players and Characters.

Set the `ID` field to the `result.Group.Id` if you're creating a group, or the `result.Groups[i].Group.Id` when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).

#### game_server 

The `game_server` entity is a unique entity used by game servers primarily for use in the Matchmaking and Lobby features. Future scenarios may be added to support other PlayFab features. 

This entity gives game servers their own identity which is useful to uniquely identify them for subscribing to real-time updates for Matchmaking and Lobby, as well as supporting specific features like Lobby owner migration.

To authenticate as a `game_server` entity, call the API [AuthenticateGameServerWithCustomId](xref:titleid.playfabapi.com.authentication.authentication.authenticategameserverwithcustomid) as a title entity and retrieve the `game_server` entity key and token pair. Use this entity key when using the PlayFab Multiplayer SDK with [PFMultiplayerSetEntityToken](../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md). 