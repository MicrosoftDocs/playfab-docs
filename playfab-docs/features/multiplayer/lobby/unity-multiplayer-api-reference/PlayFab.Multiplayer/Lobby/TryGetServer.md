---
author: raymondcha
title: Lobby.TryGetServer
description: Lobby.TryGetServer
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# Lobby.TryGetServer method

Tries to get the current server of the lobby. Returns false and sets server to null if there's no server on this Lobby.

```csharp
public bool TryGetServer(out PFEntityKey server)
```

| parameter | description |
| --- | --- |
| server | The output lobby server entity. |

## Return Value

True if a server is found or false otherwise

## Remarks

If this lobby object was joined by calling [PlayFabMultiplayerServer.JoinLobbyAsServer](../PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md), this method returns false and the server is null until `PlayFabMultiplayerServer.ProcessServerLobbyStateChanges` provides a [PlayFabMultiplayerServer.OnJoinLobbyAsServerCompleted](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnJoinLobbyAsServerCompleted.md) with the `OnJoinLobbyAsServerCompleted result` field set to true. If joining the lobby as server succeeds, it guarantees to be populated this field by the time. `PlayFabMultiplayerServer.ProcessServerLobbyStateChanges` provides a [PlayFabMultiplayerServer.OnJoinLobbyAsServerCompleted](../PlayFabMultiplayer.PlayFabMultiplayerServer/OnJoinLobbyAsServerCompleted.md).

## See Also

* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

