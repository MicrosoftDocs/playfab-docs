---
title: Lobby ownership
author: joannaleecy
description: Learn about lobby ownership and related privileges
ms.author: jenelleb
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

The PlayFab entities that PlayFab Lobby currently supports are `title_player_account` for players and `game_server` for game servers. For more information on these entity types, see [Available built-in entity types](../../live-service-management/game-configuration/entities/available-built-in-entity-types.md).

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

## Client-owned lobby access from a game_server

When using a client-owned lobby, you might have the need to securely put data into the lobby from a server. APIs have been added or modified to allow this scenario, so that you can use a 'game_server' entity to join and update the lobby for this purpose. 'ServerData' is similar to 'LobbyData' but it can only be added by a 'game_server' entity. This allows you store important information for other clients to read, such as server connection data, where you can trust the source of the data and even the client lobby owner can't modify it. 

| REST API                                                                                      |  C++ SDK                                                                                                             | Description                         |
|-----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------|-------------------------------------|
| [JoinLobbyAsServer](../../../../rest/api/playfab/multiplayer/lobby/join-lobby-as-server)      | [PFMultiplayerJoinLobbyAsServer](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerjoinlobbyasserver)   | Join a client-owned lobby from a 'game_server'. A lobby owner cannot remove a connected 'game_server', and only one 'game_server' can be joined at a time |
| [UpdateLobbyAsServer](../../../../rest/api/playfab/multiplayer/lobby/update-lobby-as-server)  | [PFLobbyServerPostUpdateAsServer](playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverpostupdateasserver) | Update a lobby's ServerData object from a connected 'game_server' |
| [LeaveLobbyAsServer](../../../../rest/api/playfab/multiplayer/lobby/leave-lobby-as-server)    | [PFLobbyServerLeaveServer](playfabmultiplayerreference-cpp/pflobby/functions/pflobbyserverleaveasserver)             | Leave a client owned lobby from a 'game_server' gracefully, ServerData contents remain |
| [GetLobby](../../../../rest/api/playfab/multiplayer/lobby/get-lobby)                          | Not necessary, happens on Join                                                                                       | Get a lobby when a 'game_server' is joined to it |
| [FindLobbies](../../../../rest/api/playfab/multiplayer/lobby/find-lobbies)                    | [PFMultiplayerFindLobbies](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerfindlobbies)               | Find lobbies that the 'game_server' is associated with |
 

## See also

* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)
* [Lobby ownership changes](ownership-changes.md)
