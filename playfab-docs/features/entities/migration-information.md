---
title: Entities migration information
author: williacj 
description: Information useful for moving from the current account and data systems to PlayFab entities.
ms.author: cjwill
ms.date: 12/03/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, entities, accounts
ms.localizationpriority: medium
---

# Entities migration information

The entity API introduces new access patterns that are designed to alleviate the pain points of the current account and data systems.

The information presented here's useful if you have previously used the following methods to implement data management for your Title, Player, or Character information.

**Title** access:

- client/[GetTitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata)
- admin/[GetTitleData](xref:titleid.playfabapi.com.admin.title-widedatamanagement.gettitledata)
- server/[GetTitleData](xref:titleid.playfabapi.com.server.title-widedatamanagement.gettitledata)

**Player** access:

- client/[GetUserReadOnlyData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserreadonlydata)
- client/[UpdateUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserdata)
- client/[UpdateUserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.updateuserpublisherdata)

**Character** access:

- client/[GetCharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata)
- client/[UpdateCharacterData](xref:titleid.playfabapi.com.client.characterdata.updatecharacterdata)

Using the entities API, you can call a single method to save the data values for title, player, and character entity types. The API provides access rules that replicate and expand the current system behavior of custom data in a better interface.

In some regards, these changes aren't backwards compatible. However, you can add calls to the entity API without changing the behavior of the existing APIs.

## Terminology

The following table describes refinements in terminology related to the entity APIs.

| Term  | Description  |
|---|---|
| **title**  | This concept is unchanged. Your title may contain global information available to all players. This is similar to [TitleData](xref:titleid.playfabapi.com.client.title-widedatamanagement.gettitledata). It's identified by the title ID (`TitleId`) of the game/application.  |
| **master_player_account**  | This entity Type allows you to share information about a player across multiple games within a studio. This is similar to [UserPublisherData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserpublisherdata). It's identified by the player ID (`PlayFabId`) of the player, which is returned as part of any login or any call to retrieve account information for the player account (for example, the PlayFab Client API [GetAccountInfo](xref:titleid.playfabapi.com.client.accountmanagement.getaccountinfo)).  |
| **title_player_account**  | This concept is based on user/player in the existing API methods. Each player can contain some information for the current title. This is similar to the [GetUserData](xref:titleid.playfabapi.com.client.playerdatamanagement.getuserdata) method. This is identified by the entity ID (`EntityKey.Id`) you get back in the [EntityKey](xref:titleid.playfabapi.com.authentication.authentication.getentitytoken#entitykey) object on any login where you specify `LoginTitlePlayerAccountEntity` as `True`.  |
| **character**  |  This concept is unchanged. Your player may own characters, which can each contain some information. This is similar to [CharacterData](xref:titleid.playfabapi.com.client.characterdata.getcharacterdata). It's identified by the character ID (`CharacterId`) of the character. |
| **PlayFabId** | Formerly this term covered both `master_player_account` and `title_player_account` concepts. Separating these concepts simplifies and clarifies the functionality. A player can interact with multiple titles that are all in the same studio, so while they can have unique information as a different `title_player_account` in each title, the owner of the studio also needs to identify that player as a single `master_player_account` entity with shared data across titles. This enables things like cross-promotion of games and giving players cross-game rewards.|

## See also

- [Introducing Entities, Objects and Files](https://blog.playfab.com/blog/introducing-entities-objects-and-files) on the PlayFab blog.
- [Entities quickstart](quickstart.md)
