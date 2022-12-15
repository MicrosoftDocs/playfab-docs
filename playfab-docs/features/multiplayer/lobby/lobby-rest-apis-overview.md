---
title: Lobby REST API overview
author: joannaleecy
description: Learn about Lobby REST API.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Lobby API overview
 

> [!IMPORTANT]
> This doc page is currently unlinked. It describes service APIs not yet intended to be called by customers.

This article provides an overview of the PlayFab Lobby API. Here, servers mean game server hosts for your title and clients are players.

## Lobby creation and management

This section lists the methods to help you create and manage lobbies. Certain methods can only be used by servers and/or clients.

### Both Servers and Clients

Lobby functionalities that can be called by both Servers and Clients.

| Method            | Description                 |
|-------------------|-----------------------------|
| CreateLobby       | Create a multiplayer lobby. The caller is the lobby creator. If creation is successful, a LobbyId will be created as an identifier for this new lobby.|
| GetLobby          | Get a lobby.                |
| UpdateLobby       | Update a lobby.             |
| RemoveMember      | Remove a member from a lobby. Remove another member from a lobby.  Owners and servers may remove any member from a lobby.  Members can't remove themselves but they can use __LeaveLobby__ instead. Members are also unsubscribed from the lobby.|

### Clients only

Lobby functionalities that can be called by clients only.

| Method            | Description                  |
|-------------------|------------------------------|
| JoinLobby         | Join a lobby.                |
| JoinArrangedLobby | Join an Arranged lobby. This is specifically used by players that are grouped from a matchmaking service to join a common lobby.|
| LeaveLobby        | Leave a lobby. Members will also be automatically unsubscribed from the lobby.|
| FindLobbies       | Find lobbies that match certain criteria. Returns a maximum of 500 entries for server calls, and 50 entries for client calls.|
| FindFriendLobbies | Find lobbies that match certain criteria and contain friends of the caller. Friends optionally include Steam, Facebook, and Xbox friends. Returns a maximum of 50 instances for client calls. This method can't be called by servers.|

### Server only

Lobby functionalities that can be called by servers only.

| Method            | Description                   |
|-------------------|-------------------------------|
| DeleteLobby       | Delete a lobby.               |


## Notification management

Set up real-time push notifications for lobby owners and members of the lobby.

| Method                       | Description                   |
|------------------------------|-------------------------------|
| SubscribeToLobbyResource     | Subscribe to lobby resource notifications. Lobby subscriptions have two types; LobbyChange and LobbyInvite. |
| UnsubscribeFromLobbyResource | Unsubscribe from lobby notifications. Only players may call this method.|
| InviteToLobby                | Send a notification to invite a player to a lobby. Invite a player to a lobby the caller is already a member of. Only players may call this.|

## See also

* [Lobby properties](lobby-properties.md)
* [Owner requirements and privileges](owner-requirements-and-privileges.md)
* [Create a lobby](create-a-lobby.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)
* [Create searchable lobbies](define-search-keywords.md)
