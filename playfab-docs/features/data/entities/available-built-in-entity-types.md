---
title: Available Built-In Entity Types
author: v-thopra
description: Lists all of the available built in Entity types.
ms.author: v-thopra
ms.date: 08/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities
ms.localizationpriority: medium
---

# Available built-in Entity types

The following list describes the available Entity types, which can be used to construct an EntityKey. Entity Keys are used to identify Entities in most newer API methods.

These values are meant to be used in the EntityKey.Type field. These are case sensitive. Other/custom values will not currently work.

## namespace

"namespace" is the singular entity that refers to all global information for all titles within a studio. This information should be static. Changes to this entity will not be reflected in real time.

The Id field should be set to your game's PublisherId, found in Game Manager -> Settings -> API Features -> Publisher ID

## title

"title" is the singular entity that refers to all global information for a title. This information should be static. Changes to this entity will not be reflected in real time.

The Id field should be set to your game's TitleId, found in Game Manager -> Settings -> API Features -> Title ID

## master_player_account

"master_player_account" is a player entity that is shared among all titles within a studio.

The Id field should be set to PlayFabId from the Classic API, returned by any **Login Result.PlayFabId**.

## title_player_account

"title_player_account", for most developers, represents the "player" in the most traditional way.

The Id field should be set to **LoginResult.EntityToken**.Id in the Client API, or **GetEntityTokenResponse.Entity**.Id in the Authentication API.

## character

"character" is a sub-entity of title_player_account, and is a direct mirror of [Characters in the Classic APIs](xref:titleid.playfabapi.com.client.characters.getalluserscharacters).

The Id field should be set to any characterId from **result.Characters[i].CharacterId**.

## group

"group" is an entity that contains other entities. Currently limited to title-players and characters.

The Id field should be set to the **result.Group**.Id if you are creating a group, or the **result.Groups[i].Group**.Id when [listing your memberships](xref:titleid.playfabapi.com.groups.groups.listmembership).

## service

Reserved for internal use