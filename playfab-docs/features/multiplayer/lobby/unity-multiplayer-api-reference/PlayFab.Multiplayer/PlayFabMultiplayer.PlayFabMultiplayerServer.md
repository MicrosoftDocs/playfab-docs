---
author: nassosterz-ms
title: PlayFabMultiplayerServer class
description: PlayFabMultiplayerServer members
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 08/02/2023
---

# PlayFabMultiplayer.PlayFabMultiplayerServer class

Class for all server lobby functionalities.

```csharp
public class PlayFabMultiplayerServer
```

## Public Members

| name | description |
| --- | --- |
| [PlayFabMultiplayerServer](PlayFabMultiplayer.PlayFabMultiplayerServer/PlayFabMultiplayerServer.md)() | The default constructor. |
| static event [OnServerLobbyClaimCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyClaimCompleted.md) | Event triggered when a previous call to [`ClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md) completed. |
| static event [OnServerLobbyCreateAndClaimCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyCreateAndClaimCompleted.md) | Event triggered when a previous call to [`CreateAndClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed. |
| static event [OnServerLobbyDeleteCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyDeleteCompleted.md) | Event triggered when a previous call to [`ServerDeleteLobby`](./Lobby/ServerDeleteLobby.md) completed. |
| static event [OnServerLobbyPostUpdateCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyPostUpdateCompleted.md) | Event triggered when a previous call to [`ServerPostUpdate`](./Lobby/ServerPostUpdate.md) completed. |
| static [ClaimServerLobby](PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md)(…) | Claim ownership of a pre-existing server lobby. (2 methods) |
| static [CreateAndClaimServerLobby](PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md)(…) | Create a new lobby as a game_server entity. (2 methods) |
| static [CreateServerBackfillTicket](PlayFabMultiplayer.PlayFabMultiplayerServer/CreateServerBackfillTicket.md)(…) | Creates a server backfill ticket. |
| delegate [OnServerLobbyClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [`ClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md) completed. |
| delegate [OnServerLobbyCreateAndClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [`CreateAndClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed. |
| delegate [OnServerLobbyDeleteCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler.md) | Handler for when the operation started by a previous call to [`ServerDeleteLobby`](./Lobby/ServerDeleteLobby.md) completed. |
| delegate [OnServerLobbyPostUpdateCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler.md) | Handler for when the operation started by a previous call to [`ServerPostUpdate`](./Lobby/ServerPostUpdate.md) completed. |

## See Also

* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

