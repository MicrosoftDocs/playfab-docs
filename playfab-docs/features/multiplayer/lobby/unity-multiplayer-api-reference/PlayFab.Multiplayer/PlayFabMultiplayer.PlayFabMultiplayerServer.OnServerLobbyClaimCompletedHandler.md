---
author: nassosterz-ms
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler delegate

Handler for when the operation started by a previous call to [`ClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md) completed.

```csharp
public delegate void OnServerLobbyClaimCompletedHandler(Lobby lobby, string lobbyId, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby that was claimed. |
| lobbyId | The ID of the Lobby to claim. |
| result | Indicates that the ClaimServerLobby operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

