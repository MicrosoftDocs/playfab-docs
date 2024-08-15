---
author: raymondcha
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyJoinAsServerCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyJoinAsServerCompletedHandler
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyJoinAsServerCompletedHandler delegate

Handler for when the operation started by a previous call to [`JoinLobbyAsServer`](./PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md) completed.

```csharp
public delegate void OnServerLobbyJoinAsServerCompletedHandler(Lobby lobby, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| result | Indicates that the JoinLobbyAsServer operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

