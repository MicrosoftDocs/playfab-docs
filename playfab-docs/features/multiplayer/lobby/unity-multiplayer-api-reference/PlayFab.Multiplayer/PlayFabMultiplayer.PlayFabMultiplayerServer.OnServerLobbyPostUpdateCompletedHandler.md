---
author: nassosterz-ms
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler delegate

Handler for when the operation started by a previous call to [`ServerPostUpdate`](./Lobby/ServerPostUpdate.md) completed.

```csharp
public delegate void OnServerLobbyPostUpdateCompletedHandler(Lobby lobby, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |
| result | Indicates that the update operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

