---
author: raymondcha
title: Lobby.PostUpdateAsServer
description: Lobby.PostUpdateAsServer
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# Lobby.PostUpdateAsServer method

Post an update to a client-owned lobby as a joined server.

```csharp
public void PostUpdateAsServer(LobbyServerDataUpdate lobbyServerUpdate)
```

| parameter | description |
| --- | --- |
| lobbyServerUpdate | An update to apply to the portion of the lobby data owned by the joined server. |

## Remarks

This is an asynchronous operation. Upon successful completion, the title is provided a [PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerPostUpdateAsServerCompleted](../PlayFabMultiplayer.PlayFabMultiplayerServer.md) with the `OnServerPostUpdateAsServerCompleted result` field set to [Success](../LobbyError/Success.md). Upon a failed completion, the title is provided a [PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerPostUpdateAsServerCompleted](../PlayFabMultiplayer.PlayFabMultiplayerServer.md) with the `OnServerPostUpdateAsServerCompleted result` field set to a failed error code. If applying the update would change the state of the lobby, the title is provided a [OnLobbyUpdated](../PlayFabMultiplayer/OnLobbyUpdated.md) sometime afterwards.

This operation completing successfully only indicates that the Lobby service accepted the update. The title's local view of the lobby state doesn't reflect this update until a [OnLobbyUpdated](../PlayFabMultiplayer/OnLobbyUpdated.md) is provided to the title with the updated state.

This operation is restricted to client-owned lobbies that are using connections.

While this method is present in the unified, cross-platform header, it only implemented for Windows and, Xbox. The method returns errors on other platforms.

## See Also

* class [LobbyServerDataUpdate](../LobbyServerDataUpdate.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

