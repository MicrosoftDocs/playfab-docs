---
author: raymondcha
title: PlayFabMultiplayer.PlayFabMultiplayerServer.JoinLobbyAsServer method
description: This document describes the PlayFabMultiplayer.PlayFabMultiplayerServer.JoinLobbyAsServer.
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.JoinLobbyAsServer
## PlayFabMultiplayer.PlayFabMultiplayerServer.JoinLobbyAsServer method (1 of 2)

Join a client-owned lobby as a server.

```csharp
public static Lobby JoinLobbyAsServer(PFEntityKey server, string connectionString, 
    LobbyServerJoinConfiguration configuration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the server joining the lobby. Its entity type must be "game_server." |
| connectionString | The connection string used by the server to join the lobby. |
| configuration | The initial server-owned data to be stored when joining the lobby. |

### Return Value (1 of 2)

Output lobby object, which can be used to queue operations for immediate execution of this operation completes.

### Remarks (1 of 2)

JoinLobbyAsServer() is an asynchronous operation. Completion of this method's execution isn't necessarily completion of the operation.

Upon successful completion, the title is provided a [LobbyUpdatedStateChange](../../../../lobby/playfabmultiplayerreference-cpp/pflobby/structs/pflobbyupdatedstatechange.md) with the `LobbyUpdatedStateChange.serverUpdate` member appropriately populated, and a [OnJoinLobbyAsServerCompleted](./OnJoinLobbyAsServerCompleted.md) with the `OnJoinLobbyAsServerCompleted.result` field set to [Success](../LobbyError/Success.md).

Upon a failed completion, the title is provided a [OnJoinLobbyAsServerCompleted](./OnJoinLobbyAsServerCompleted.md) with the `OnJoinLobbyAsServerCompleted.result` field set to a failed error code.

JoinLobbyAsServer() operation is restricted to client-owned lobbies that are using connections.

---

## PlayFabMultiplayer.PlayFabMultiplayerServer.JoinLobbyAsServer method (2 of 2)

Join a client-owned lobby as a server.

```csharp
public static Lobby JoinLobbyAsServer(PlayFabAuthenticationContext server, string connectionString, 
    LobbyServerJoinConfiguration configuration)
```

| parameter | description |
| --- | --- |
| server | The PlayFab Entity Key of the server joining the lobby. Its entity type must be "game_server." |
| connectionString | The connection string used by the server to join the lobby. |
| configuration | The initial server-owned data to be stored when joining the lobby. |

### Return Value (2 of 2)

Output lobby object, which can be used to queue operations for immediate execution of this operation completes.

### Remarks (2 of 2)

JoinLobbyAsServer() is an asynchronous operation. Completion of this method's execution isn't necessarily completion of the operation.

Upon successful completion, the title is provided a [LobbyUpdatedStateChange](../../../../lobby/playfabmultiplayerreference-cpp/pflobby/structs/pflobbyupdatedstatechange.md) with the `LobbyUpdatedStateChange.serverUpdate` member appropriately populated, and a [OnJoinLobbyAsServerCompleted](./OnJoinLobbyAsServerCompleted.md) with the `OnJoinLobbyAsServerCompleted.result` field set to [Success](../LobbyError/Success.md).

Upon a failed completion, the title is provided a [OnJoinLobbyAsServerCompleted](./OnJoinLobbyAsServerCompleted.md) with the `OnJoinLobbyAsServerCompleted.result` field set to a failed error code.

This operation is restricted to client-owned lobbies that are using connections.

## See Also

* class [Lobby](../Lobby.md)
* class [LobbyServerJoinConfiguration](../LobbyServerJoinConfiguration.md)
* class [PlayFabMultiplayerServer](../PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
