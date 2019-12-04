---
title: Entities migration guide
author: williacj 
description: A migration guide for moving from the current account and data systems to PlayFab entities.
ms.author: cjwill
ms.date: 12/03/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, data, entities, accounts
ms.localizationpriority: medium
---

# Entities migration guide

The entity API introduces new access patterns that are designed to alleviate the pain points of the current account and data systems.

With the existing APIs, saving a data value has separate API calls for:

- **Title** access - (client/[GetTitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata), admin/[GetTitleData](xref:titleid.playfabapi.com.admin.title-widedatamanagement.gettitledata), server/[GetTitleData](xref:titleid.playfabapi.com.server.title-widedatamanagement.gettitledata)).
- **Player** access - (client/[GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata), client/[UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata), client/[UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata)).
- **Character** access - (client/[GetCharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata), client/[UpdateCharacterData](xref:titleid.playfabapi.com.client.characterdata.updatecharacterdata)).

In the new API scheme, a single call supports saving a data value for a title, player, character, and every other future entity type, combined with powerful access rules that replicate and expand the current system behavior of custom data in a better interface.

In some regards, these changes are not backwards compatible. However, using them will not change the behavior of the existing APIs.

## Terminology

Entities are any PlayFab concept that can contain data. Currently we have a number of built-in entity types:

- **Title**
- **master_player_account**
- **title_player_account**
- **Character**

This system will be expanded, so you will see future entity types added to cover guilds or groups, game servers, and more.

Because this is a new API, we are refining some of the terms used in other API methods:

- **Title** - This concept is unchanged. Your title may contain global information available to all players. This is similar to [TitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata). It is identified by the title ID (`TitleId`) of the game/application.
- **master_player_account** - This entity Type allows you to share information about a player across multiple games within a studio. This is similar to [UserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata). It is identified by the PlayFab ID (`PlayFabId`) of the player, which is returned as part of any login or any call to retrieve account information for the player account (for example, the PlayFab Client API [GetAccountInfo](xref:titleid.playfabapi.com.client.accountmanagement.getaccountinfo)).
- **title_player_account** - This concept is based on user/player in the existing API methods. Each player may contain some information for the current title. This is similar to the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method. This is identified by the entity ID (`EntityKey.Id`) you get back in the [EntityKey](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken#entitykey) object on any login where you specify `LoginTitlePlayerAccountEntity` as `True`.
- **character** - This concept is unchanged. Your player may own characters, which can each contain some information. This is similar to [CharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata). It is identified by the character ID (`CharacterId`) of the character.

See the [Available built-in Entity types](../../data/entities/available-built-in-entity-types.md) tutorial, for a list of all built-in entity types.

> [!NOTE]
> Formerly, `PlayFabId` covered both `master_player` and `title_player` concepts. Separating these concepts simplifies and clarifies the functionality. A player can interact with multiple titles that are all in the same studio, so while they can have unique information as a different player in each title, the owner of the studio also needs to identify that player as a single entity with shared data across titles. This enables things like cross-promotion of games and giving players cross-game rewards.

## See also

[Introducing Entities, Objects and Files](https://blog.playfab.com/blog/introducing-entities-objects-and-files) on the PlayFab blog.
