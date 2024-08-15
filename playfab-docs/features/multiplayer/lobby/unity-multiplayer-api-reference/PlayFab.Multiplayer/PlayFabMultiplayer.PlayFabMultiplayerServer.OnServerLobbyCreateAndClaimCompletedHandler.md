---
author: nassosterz-ms
title: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler
description: PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler delegate

Handler for when the operation started by a previous call to [`CreateAndClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed.

```csharp
public delegate void OnServerLobbyCreateAndClaimCompletedHandler(Lobby lobby, int result);
```

| parameter | description |
| --- | --- |
| lobby | The lobby that was created and claimed. |
| result | Indicates that the CreateAndClaimServerLobby operation Succeeded or provides the reason that it failed. |

## See Also

* class [Lobby](./Lobby.md)
* class [PlayFabMultiplayerServer](./PlayFabMultiplayer.PlayFabMultiplayerServer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

