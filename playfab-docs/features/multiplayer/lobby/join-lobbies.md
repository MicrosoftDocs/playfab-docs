---
title: Join lobbies
author: joannaleecy
description: Learn about joining lobbies.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, join
ms.localizationpriority: medium
---

# Joining lobbies and connection strings
 

Players join lobbies by providing the lobby service with a lobby's "connection string", an opaque identifier which grants membership to the lobby.

Players can discover connection strings and join lobbies in the following ways.

1. By using in-game invites&mdash;A member of a lobby may invite another player to that lobby directly via the lobby service. This will share the lobby's connection string with the invited player. These invites work cross-platform but only work in-game. For more information, see [Lobby invites](lobby-invites.md)
1. By using platform-provided invites&mdash;Members of the lobby can directly share the lobby's connection string with other players over platform-specific invite mechanisms. These invites will not work cross-platform but can be received without the recipient already running the game. 
1. By searching for available lobbies with [FindLobbies](find-lobbies.md) and joining an available lobby
1. By sharing the lobby's connection string via any out-of-band, custom discovery mechanism

> NOTE: Only players (i.e. title_player_account PlayFab entities) can join lobbies as members. Game servers (i.e. game_server PlayFab entities) cannot join lobbies as members. For more information on the how game servers interact with lobbies, see [Game Servers and Lobbies](lobby-server-overview.md).

## Connection strings and Lobby IDs

Aside from connection strings, lobbies have another identifer known as __LobbyId__. __LobbyId__ is the unique identifier for a lobby. Titles may use __LobbyId__ to distinguish between multiple lobbies that a player is in, but LobbyIds cannot be used to join the lobbies or directly query them for any information which requires membership. Therefore, your title doesn't have to keep __LobbyId__ a secret. Connection strings, on the other hand, grant access to lobbies so care should be taken to keep from exposing them to unwanted, outside parties.

## Example joining a lobby using the Lobby and Matchmaking SDK

Here's a brief snippet which demonstrates passing a connection string to the __PFMultiplayerJoinLobby__ API provided by the SDK.

In this snippet, the connection string could be provided by any of the discovery mechanisms mentioned above: in-game invites, platform-specific invites, or filtered lobby searches.
```cpp
// Initialize the member properties for the newly joining member
const char* playerColorPropertyKey = "PlayerColor";
const char* playerColorPropertyValue = MyGame::GetPlayerColorString(localUser);

PFLobbyJoinConfiguration joinConfig;
joinConfig.memberPropertyCount = 1;
joinConfig.memberPropertyKeys = &playerColorPropertyKey;
joinConfig.memberPropertyValues = &playerColorPropertyValue;

// Join the lobby using the connection string
HRESULT hr = PFMultiplayerJoinLobby(
    g_pfmHandle,
    &localUser,
    connectionString,
    &joinConfig,
    nullptr,
    nullptr);
```

## See also

* [Find lobbies](find-lobbies.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Lobby and matchmaking](lobby-and-matchmaking.md)
* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)

