---
title: Available Built-In Entity Types
author: v-thopra
description: Lists all of the available built in Entity types.
ms.author: v-thopra
ms.date: 11/08/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities
ms.localizationpriority: medium
---

# Available built-in entity types

The following list describes the available entity types, which can be used to construct an **EntityKey**.

Entity keys are used to identify entities in most newer API methods.

These values are meant to be used in the **EntityKey.Type** field.

> [!NOTE]
> These are *case sensitive*. Other/custom values *will not* currently work.

## Namespace

Namespace is the singular entity that refers to *all* global information for every title within a studio. This information should be static.

> [!NOTE]
> Changes to this entity will *not* be reflected in real time.

The **ID** field should be set to your **Game PublisherId**, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **Publisher ID**.

## Title

Title is the singular entity that refers to all global information for that title. This information should be static.

> [!NOTE]
> Changes to this entity will *not* be reflected in real time.

The **ID** field should be set to your game's **TitleId**, found in **Game Manager**:

- Go to **Settings**.
- Select **API Features**.
- Then select the **Title ID**.

## master_player_account

The **master_player_account** is a player entity that is shared among all titles within a studio.

The **ID** field should be set to **PlayFabId** from the classic API, returned by any **Login Result.PlayFabId**.

## title_player_account

**title_player_account**, for most developers, represents the player in the most traditional way.

The **ID** field should be set to **LoginResult.EntityToken.Id** in the client API, or **GetEntityTokenResponse.Entity.Id** in the authentication API.

## Character

Character is a sub-entity of **title_player_account**, and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

The **ID** field should be set to any **characterId** from **result.Characters[i].CharacterId**.

## Group

Group is an entity that contains other entities. It is currently limited to players and characters.

The **ID** field should be set to the **result.Group.Id** if you are creating a group, or the **result.Groups[i].Group.Id** when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).

## Service

Service is reserved for internal use only.