---
title: Create a lobby
author: joannaleecy
description: Learn how to create a lobby.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, lobby, matchmaking
ms.localizationpriority: medium
---

# Create a lobby

This article explains how to create a lobby. 

## How are lobbies created?

There are several ways a lobby can be created.

* **By your players**: Lobbies can be created by players who want get together a team of players to play. These are client-owned lobbies.
* **By your game servers**: Your title's game servers can create lobbies and wait for players to join. These are server-owned lobbies.
* **By matchmaking**: After a group of players form after matchmaking, a lobby is created as a holding place before the game starts. These are client-owned lobbies.

From a technical perspective, all lobbies are fall into two main categories based on ownership&mdash;server-owned and client-owned. To learn more, see [Owner requirements and privileges](owner-requirements-and-privileges.md).

The general usage of PlayFab Lobby is to temporarily hold a group of players together. For commonly used applications of Lobby, see the [Azure PlayFab Lobby overview](index.md).

## How lobbies are configured

Several important settings for a lobby are configured during creation: __maxMemberCount__, __accessPolicy__, __owner__, and __ownerMigrationPolicy__.

* __maxMemberCount__ defines how many players the lobby can hold
* __accessPolicy__ defines who may discover the lobby's connection string
* __owner__ defines the lobby's owner which has special permissions to update data on the lobby. This value is implicitly the client or server entity who is creating the lobby.
* __ownerMigrationPolicy__ defines policies for how ownership of the lobby should be transferred if the current owner leaves the lobby or has trouble maintaining a connection to the lobby.

Additionally, during creation, the lobby creator can also define custom lobby properties and search properties to append custom data to the lobby session. These custom properties can also be modified over the lifetime of the lobby by the lobby's owner.

For more information, see [Lobby properties](lobby-properties.md).

## Example using the Lobby and Matchmaking Client SDK

This example uses the first player in a list of grouped players to create a lobby. 

In this code snippet, Lobby properties are passed in as __lobbyConfiguration__. The first player (client) becomes the lobby owner. So it's a client-owned lobby. After the lobby is successfully created, it adds other players to the lobby.

```cpp
    const char* gameModePropertyKey = "GameMode";
    auto gameMode = GameMode::Foo;
    const char* gameModePropertyValue = EnumToString(gameMode);
    const char* playerColorPropertyKey = "PlayerColor";
    PlayerColor playerColor = MyGame::GetPlayerColor(m_localUsers[0]);
    const char* playerColorPropertyValue = EnumToString(playerColor);
    
    PFLobbyCreateConfiguration lobbyConfiguration{};
    lobbyConfiguration.maxMemberCount = 16;
    lobbyConfiguration.ownerMigrationPolicy = PFLobbyOwnerMigrationPolicy::Automatic;
    lobbyConfiguration.accessPolicy = PFLobbyAccessPolicy::Private;
    lobbyConfiguration.lobbyPropertyCount = 1;
    lobbyConfiguration.lobbyPropertyKeys = &gameModePropertyKey;
    lobbyConfiguration.lobbyPropertyValues = &gameModePropertyValue;
    
    PFLobbyJoinConfiguration creatorMemberConfiguration{};
    creatorMemberConfiguration.memberPropertyCount = 1;
    creatorMemberConfiguration.memberPropertyKeys = &playerColorPropertyKey;
    creatorMemberConfiguration.memberPropertyValues = &playerColorPropertyValue;

    // Create a lobby using our first player
    PFLobbyHandle lobby;
    HRESULT error = PFMultiplayerCreateAndJoinLobby(g_pfmHandle, &m_localUsers[0], &lobbyConfiguration, &creatorMemberConfiguration, nullptr, &lobby);
```

## See also

* [Lobby Client SDK reference](playfabmultiplayerreference-cpp\pflobby\pflobby_members.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Lobby properties](lobby-properties.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)

