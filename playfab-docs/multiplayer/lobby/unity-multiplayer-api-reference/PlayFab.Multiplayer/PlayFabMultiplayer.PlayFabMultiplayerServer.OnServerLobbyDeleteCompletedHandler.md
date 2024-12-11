---
author: nassosterz-ms
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler delegate

Handler for when the operation started by a previous call to [`ServerDeleteLobby`](./Lobby/ServerDeleteLobby.md) completed.

```csharp
public delegate void OnServerLobbyDeleteCompletedHandler(Lobby lobby);
```

| parameter | description |
| --- | --- |
| lobby | The lobby involved with the operation. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

