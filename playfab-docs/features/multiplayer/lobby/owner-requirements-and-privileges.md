---
title: Lobby ownership
author: joannaleecy
description: Learn about lobby ownership and related privileges
ms.author: joanlee
ms.date: 02/28/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Lobby ownership
 

This article explains Lobby ownership and the privileges it enables.

## Lobby owners vs members

PlayFab entities interact with lobbies as either owners or members.

The PlayFab entities that PlayFab Lobby currently supports are `title_player_account` for players and `game_server` for game servers. For more information on these entity types, see [Available built-in entity types](/gaming/playfab/features/data/entities/available-built-in-entity-types).

Lobby members are players who have joined a lobby. Each member has an isolated property bag of member data.

Lobby owners are players or game servers who can modify the global lobby properties and other [special privileges](#owner-privileges). Lobbies owned by players are referred to as client-owned lobbies. Lobbies owned by game servers are referred to as server-owned lobbies.

Players may be both the owner and a member of a lobby simultaneously.

A game server can be the owner of a lobby but can't be a member.

## Establishing and changing ownership

Ownership of a lobby is initially granted when the lobby is first created. If a player creates a lobby, that player owns the lobby. If a game server creates a lobby, that game server owns the lobby. For more information on creating lobbies, see [Create a lobby](create-a-lobby.md).

Only one entity may own the lobby at a time, but ownership of the lobby may change throughout the lifetime of the lobby. For more information on ownership changes, see [Lobby ownership changes](ownership-changes.md).

## Owner Privileges

The owner of a lobby has privileges that non-owning members of the lobby don't have.

1. The owner can set pre-defined global lobby properties (for example, the lobby's access policy) and custom global lobby properties. For more information on these properties, see [Lobby properties](lobby-properties.md).
2. The owner can remove members from the lobby.
3. The owner may assign another owner in their place.
    * In server-owned lobbies, the owner can only assign another server as the new owner.
    * In client-owned lobbies, the owner can only assign another member as the new owner.

## See also

* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)
* [Lobby ownership changes](ownership-changes.md)
