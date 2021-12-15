---
title: Entity Programming Model
author: v-thopra
description: Landing page for Entities.
ms.author: v-thopra
ms.date: 06/12/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities
ms.localizationpriority: medium
---


# Entity Programming Model

## Introduction
First off, what are entities? They are the most basic addressable "things" that PlayFab APIs operate on. Each entity has a Type and an Id which together uniquely identify it. Some types of entities are "standard" or "built-in", in that PlayFab knows something about their meaning and/or automatically creates them, for example `namespace`, `title`, `group`, `master_player_account`, and `title_player_account`. Others may have have no inherent meaning to PlayFab but have meaning in your game.

Every entity has a profile which contains various resources owned by that entity. For example, objects, files, language settings, policies, and others to come. An entity profile can be retrieved directly with the `GetProfile` API, and many other APIs operate on specific resources inside of the profile, such as `SetObjects`.

Finally, there are parent/child relationships between entities which factor into the permissions governing how an entity's resources may be accessed by other entities. The "ancestors" of a given entity can be found in the `Lineage` property of its profile.

## Comparison with Classic API
With that out of the way, let's look at the differences between the "classic" and "entity" APIs. If you are using the classic APIs, you are already working with the same entities that you can use with the entity APIs, but they're not always explicit. For example, in the Client API, `UpdateUserData` operates on a `title_player_account` entity, `GetUserPublisherData` operates on a `master_player_account`, `GetCharacterStatistics` operates on a `character` (that is a child of the `title_player_account`), `GetTitleData` operates on a title and `GetPublisherData` operates on a `namespace`.

In general, each classic API operates on one specific type of entity, but the entity type is often implicit and doesn't necessary follow from the API name. Moreover, the equivalent APIs for two types of entities may subtly vary with respect to their parameters, limits, and behavior (e.g. `UpdatePlayerStatistics` vs. `UpdateCharacterStatistics`). If you're feeling confused by this, you aren't alone. We wanted to simplify the PlayFab APIs without ever breaking compatibility with the existing set, which takes us to...

"Entity APIs" are what we've been calling the newer PlayFab APIs which adhere to the following design goals (with some exceptions).

- Work with arbitrary types of entities.
- Have explicit parameters for the entity Type and Id.
- Perform a specific operation on a specific resource in the entity profile.
- Can be called in multiple security contexts, such as from game clients, game servers, Cloud Script, back-end servers, etc., with the permissions defined by policies and selected according to which entity is calling the API.

We believe that following these principles will result in fewer APIs that do more, are more efficient to maintain and operate, and are easier for developers to learn. Basically, this is the way we would design all PlayFab APIs if we were to start over, knowing everything we've learned over the past five years about how developers are using PlayFab. Of course, one of our most important principles at PlayFab is to never break live titles, if at all possible, which means we must maintain backward compatibility with all released APIs.

## Considerations For Classic API Users
To accomplish our design goals while maintaining compatibility, we have been introducing these entity APIs as a separate set for the most part, existing side-by-side with the classic APIs. While the entity APIs can work with the same entities as the classic APIs, in most cases they operate on a separate set of resources / data owned by these entities. For example, the `SetObjects` entity API and the `UpdateUserData` classic API can both store data under a `title_player_account` entity, but the data that the two APIs "see" is completely separate. Here are some of the practical implications:

#### The bad
- If your title is already using classic APIs for data, inventories, etc. with players (a.k.a. `title_player_account`s), that existing data will not automatically show up in the equivalent entity APIs.
- It will take some time before the entity APIs have feature parity with the classic APIs. The data is stored separately in most cases, and there are a lot of back-end changes required to support them. There may be some classic functionality that never makes it to the entity API.

#### The good
- You don't have to do anything. If your game is already working well on PlayFab classic APIs, it will continue to work.
- You can start using entity APIs while continuing to use classic APIs on the same set of entities. In some situations there are clear benefits to doing this, at little cost, e.g. adding a new feature to your game that saves larger amounts of data in a file, in addition to existing settings stored in classic "player data".

## Functionality Overview

The entity programming model is the foundation for PlayFab's next generation of data and game services. 

- [Authentication](xref:titleid.playfabapi.com.authentication.authentication)
- [Profiles](xref:titleid.playfabapi.com.profiles.accountmanagement)
- [Groups](xref:titleid.playfabapi.com.groups.groups)
- [Data - File](xref:titleid.playfabapi.com.data.file)
- [Data - Object](xref:titleid.playfabapi.com.data.object)
- [Events](../../../api-references/events/index.md)
- [CloudScript](xref:titleid.playfabapi.com.cloudscript.server-sidecloudscript)
- [Multiplayer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)

### Supported Entity types

The following list describes the available Entity types, which can be used to construct an `EntityKey`. Entity Keys are used to identify entities in most newer API methods.

These values are meant to be used in the `EntityKey.Type` field.

> [!NOTE]
> These are *case sensitive*. Other/custom values *will not* currently work.

#### Namespace

Namespace is the singular Entity that refers to *all* global information for every Title within a Studio. This information should be static. Changes to this Entity will *not* be reflected in real time.

The `ID` field should be set to your `GamePublisherId`, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **PublisherId**.

#### Title

Title is the singular Entity that refers to all global information for that Title. This information should be static. Changes to this Entity will *not* be reflected in real time.

The `ID` field should be set to your game's `TitleId`, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **TitleId**.

#### master_player_account

The `master_player_account` is a Player Entity that is shared among all Titles within a Studio.

The ID field should be set to `PlayFabId` from the Classic API, returned by any `LoginResult.PlayFabId`.

#### title_player_account

`title_player_account`, for most developers, represents the Player in the most traditional way.

The `ID` field should be set to `LoginResult.EntityToken.Id` in the Client API, or `GetEntityTokenResponse.Entity.Id` in the Authentication API.

#### Character

Character is a sub-entity of `title_player_account`, and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

The `ID` field should be set to any `characterId` from `result.Characters[i].CharacterId`.

#### Group

Group is an Entity that contains other Entities. It is currently limited to Players and Characters.

The `ID` field should be set to the `result.Group.Id` if you are creating a group, or the `result.Groups[i].Group.Id` when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).
