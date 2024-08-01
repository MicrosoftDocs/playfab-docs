---
author: raymondcha
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateAsServerCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateAsServerCompletedHandler
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateAsServerCompletedHandler delegate

Handler for when the operation started by a previous call to [`PostUpdateAsServer`](./Lobby/PostUpdateAsServer.md) completed.

```csharp
public delegate void OnServerLobbyPostUpdateAsServerCompletedHandler(Lobby lobby, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| result | Indicates that the PostUpdateAsServer operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

