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

The entity programming model is the foundation for PlayFab's next generation of data and game services. This new foundation is designed to:

## Provide consistency across the programming model

The new entity programming models are designed to be utilized across all entity types (for example, title, player, character, or group) in any way that your game wants to interact with PlayFab - from the client, from your PlayFab hosted CloudScript, or from your custom game server. Gone are the aggravations of certain functionality only being available for a subset of your game.

## Significantly improve performance

Changing the way we store data, as well as unifying the access policies we use, increases performance for player and title CRUD operations. By consolidating all Data API interactions into a single place, all CRUD operations work the same way across the entire service. We unify data across a smaller set of tables, and use a common access policy system more efficiently to access the necessary data.

## Consistency of access control

The new unified access control policy allows you to have more fine grained control. This includes access control over individual data objects *and* access to which APIs and functionality should be exposed to your game client.

## API Interactions

The entity programming model APIs are grouped logically by the area of functionality that they expose, unlike the classic APIs, which were based on whether the functionality was being accessed by clients or game servers.

This allows you to get access to functionality in a more intuitive way. The full breadth of Entity functionality can be seen at:

- [Authentication](xref:titleid.playfabapi.com.authentication.authentication)
- [Profiles](xref:titleid.playfabapi.com.profiles.accountmanagement)
- [Groups](xref:titleid.playfabapi.com.groups.groups)
- [Data - File](xref:titleid.playfabapi.com.data.file)
- [Data - Object](xref:titleid.playfabapi.com.data.object)
- [Events](../../../api-references/events/index.md)
- [CloudScript](xref:titleid.playfabapi.com.cloudscript.server-sidecloudscript)
- [Multiplayer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver)

## Supported Entity types

The following list describes the available Entity types, which can be used to construct an `EntityKey`. Entity Keys are used to identify entities in most newer API methods.

These values are meant to be used in the `EntityKey.Type` field.

> [!NOTE]
> These are *case sensitive*. Other/custom values *will not* currently work.

### Namespace

Namespace is the singular Entity that refers to *all* global information for every Title within a Studio. This information should be static. Changes to this Entity will *not* be reflected in real time.

The `ID` field should be set to your `GamePublisherId`, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **PublisherId**.

### Title

Title is the singular Entity that refers to all global information for that Title. This information should be static. Changes to this Entity will *not* be reflected in real time.

The `ID` field should be set to your game's `TitleId`, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **TitleId**.

### master_player_account

The `master_player_account` is a Player Entity that is shared among all Titles within a Studio.

The ID field should be set to `PlayFabId` from the Classic API, returned by any `LoginResult.PlayFabId`.

### title_player_account

`title_player_account`, for most developers, represents the Player in the most traditional way.

The `ID` field should be set to `LoginResult.EntityToken.Id` in the Client API, or `GetEntityTokenResponse.Entity.Id` in the Authentication API.

### Character

Character is a sub-entity of `title_player_account`, and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

The `ID` field should be set to any `characterId` from `result.Characters[i].CharacterId`.

### Group

Group is an Entity that contains other Entities. It is currently limited to Players and Characters.

The `ID` field should be set to the `result.Group.Id` if you are creating a group, or the `result.Groups[i].Group.Id` when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).
