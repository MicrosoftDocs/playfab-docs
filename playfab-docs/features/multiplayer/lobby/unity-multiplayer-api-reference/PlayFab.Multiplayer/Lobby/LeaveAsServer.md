---
author: raymondcha
title: Lobby.LeaveAsServer
description: Lobby.LeaveAsServer
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# Lobby.LeaveAsServer method

Requests that the server leave the client-owned lobby it's currently in.

```csharp
public void LeaveAsServer()
```

## Remarks

This method queues an asynchronous operation to exit the client-owned lobby. On completion, a [PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyLeaveAsServerCompleted](../../PlayFab.Multiplayer/PlayFabMultiplayer.PlayFabMultiplayerServer.md) is provided indicating that the operation completed.

This operation is restricted to client-owned lobbies that are using connections.

Any server-owned data previously added to the lobby is NOT automatically deleted when the server leaves the lobby. If there's a desire to also delete the serverData, it should be explicitly done by calling [PlayFabMultiplayer.PostUpdateAsServer](PostUpdateAsServer.md) before leaving the lobby.

## See Also

* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

