---
title: Available Built-In Entity Types
author: joannaleecy
description: Lists all of the available built-in Entity types.
ms.author: joanlee
ms.date: 11/08/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, entities
ms.localizationpriority: medium
---

# Available built-in entity types

This topic describes the available entity types that you can use to construct an [EntityKey](../../api-references/events/data-types/entitykey.md).

Entity keys identify entities in most of the newer API methods.

You use the value of the `EntityKey.Type` field to determine the type of value to set in the `ID` field.

> [!NOTE]
> Entity keys are *case sensitive*.

## namespace

The `namespace` entity refers to *all* global information for all titles within your studio.

> [!NOTE]
> Changes to this entity are *not* reflected in real time.

Set the `ID` field to your game's **Publisher ID**. To retrieve your **Publisher ID**:

- Sign in to [Game Manager](https://developer.playfab.com/).
- In the upper left-hand corner of **Game Manager**, select the gear icon.
- Select **Title Settings**.
- Select **API Features**.
- The **Publisher ID** is displayed in the **API ACCESS** section.

## title

The `title` entity refers to all global information for that title.

> [!NOTE]
> Changes to this entity are *not* reflected in real time.

Set the `ID` field to your game's **Title ID**. To retrieve the **Title ID**:

- Sign in to [Game Manager](https://developer.playfab.com/).
- In the upper left-hand corner of **Game Manager**, select the gear icon.
- Select **Title Settings**.
- Select **API Features**.
- The **Title ID** is displayed in the **API ACCESS** section.

## master_player_account

The `master_player_account` is a player entity that is shared by all titles within your studio.

Set the `ID` field to the `LoginResult.PlayFabId` from the classic API. To retrieve the `LoginResult`, call one of the login methods in [Client Authentication](xref:titleid.playfabapi.com.client.authentication).

## title_player_account

For most developers, `title_player_account` represents the player in the most traditional way.

Set the `ID` field to `LoginResult.EntityToken.Entity.Id` in the client API, or `GetEntityTokenResponse.Entity.Id` in the authentication API.

To retrieve the `LoginResult`, call one of the login methods in [Client Authentication](xref:titleid.playfabapi.com.client.authentication).
To retrieve the `GetEntityTokenResponse`, call [Get Entity Token](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken).

## character

The `character` entity is a sub-entity of `title_player_account`, and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

Set the `ID` field to any `characterId` from `result.Characters[i].CharacterId`.

## group

The `group` entity is a container  for other entities. It's currently limited to players and characters.

Set the `ID` field to the `result.Group.Id` if you're creating a group, or the `result.Groups[i].Group.Id` when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).

## game_server 

The `game_server` entity is a unique entity used by game servers primarily for use in the Matchmaking and Lobby features. Future scenarios may be added to support other PlayFab features. 

This entity gives game servers their own identity which is useful to uniquely identify them for subscribing to real-time updates for Matchmaking and Lobby, as well as supporting specific features like Lobby owner migration.

To authenticate as a `game_server` entity, call the API [AuthenticateGameServerWithCustomId](xref:titleid.playfabapi.com.authentication.authentication.authenticategameserverwithcustomid) as a title entity and retrieve the `game_server` entity key and token pair. Use this entity key when using the PlayFab Multiplayer SDK with [PFMultiplayerSetEntityToken](../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md). 

