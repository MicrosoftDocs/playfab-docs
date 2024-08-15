---
author: raymondcha
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyLeaveAsServerCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyLeaveAsServerCompletedHandler
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyLeaveAsServerCompletedHandler delegate

Handler for when the operation started by a previous call to [`LeaveAsServer`](./Lobby/LeaveAsServer.md) completed.

```csharp
public delegate void OnServerLobbyLeaveAsServerCompletedHandler(Lobby lobby);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

