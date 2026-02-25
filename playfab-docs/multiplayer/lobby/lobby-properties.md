---
title: PlayFab Lobby custom properties
author: joannaleecy
description: Learn about custom properties in Lobby.
ms.author: jenelleb
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Lobby properties
 

This article describes custom properties stored on the lobby. Use this functionality to store metadata about the game sessions that your lobby's represent.

## Predefined properties

Each lobby has a set of predefined properties commonly needed for most game scenarios.

| Property     | Definition        |
|--------------|-------------------|
| lobbyId      | This is the unique identifier for a lobby. It can be used to distinguish between multiple lobbies that a player might be a part of. |
| connectionString  | The identifier used to join the lobby. It's provided by the Lobby service. When an invite is sent to other players, the __connectionString__ is sent as the invitation. |
| maxMemberCount   | The maximum number of players allowed in the lobby. This property can only be changed by owner. |
| owner  | The entity that owns the lobby. Some lobbies might be temporarily ownerless in some circumstances. To learn more, see [Ownership changes](ownership-changes.md). |
| ownerMigrationPolicy | Policy determines how a new owner is chosen. To learn more, see [Ownership changes](ownership-changes.md). |
| accessPolicy | Policy indicates who can discover the lobby's connection string. This property can only be changed by the owner. |
| membershipLock  | This value indicates whether new members can join the lobby or not. When __Locked__, new members can't join. When __Unlocked__ new members can join. This property can only be changed by the owner. |
| RestrictInvitesToLobbyOwner  | A setting that controls whether only the lobby owner can send invites to join the lobby. When true, only the lobby owner can send invites. When false or not specified, any member can send invites. Defaults to false if not specified. Restricted to client owned lobbies.|

## Custom Properties

There are three types of custom properties that titles can define. 

1. Custom lobby properties
    * These properties apply to the whole lobby.
    * Only members of the lobby can see these properties.
    * Only the owner of the lobby can change these properties.
2. Custom member properties
    * There's a unique map of member properties for each member in the lobby
    * Only members of the lobby can see these properties.
    * All members of the lobby can see every other members' properties.
    * Each member may modify their own member properties but can't modify another member's properties.
    * Once a member leaves the lobby, their member properties are deleted from the lobby.
3. Custom search properties.
    * These are special properties which can be used by all players in your title to search for lobbies matching a specific criteria.
    * These properties apply to the whole lobby.
    * Only the owner of the lobby can change these properties.
    * There are restrictions on what keys you can use for these properties.
    * To learn more, see [Create searchable lobbies](define-search-keywords.md).

All properties are maps of key-value pairs.

## See also

* [Create a lobby](create-a-lobby.md)
* [Owner requirements and privileges](owner-requirements-and-privileges.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)
* [Find lobbies](find-lobbies.md)
* [Create searchable lobbies](define-search-keywords.md)
