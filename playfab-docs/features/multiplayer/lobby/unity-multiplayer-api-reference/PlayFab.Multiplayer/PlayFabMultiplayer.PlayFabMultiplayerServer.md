---
author: nassosterz-ms
title: PlayFabMultiplayerServer class
description: PlayFabMultiplayerServer members
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
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
| static event [OnJoinLobbyAsServerCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnJoinLobbyAsServerCompleted.md) | Event triggered when a previous call to [`JoinLobbyAsServer`](./PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md) completed. |
| static event [OnServerLobbyClaimCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyClaimCompleted.md) | Event triggered when a previous call to [`ClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md) completed. |
| static event [OnServerLobbyCreateAndClaimCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyCreateAndClaimCompleted.md) | Event triggered when a previous call to [`CreateAndClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed. |
| static event [OnServerLobbyDeleteCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyDeleteCompleted.md) | Event triggered when a previous call to [`ServerDeleteLobby`](./Lobby/ServerDeleteLobby.md) completed. |
| static event [OnServerLobbyLeaveAsServerCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyLeaveAsServerCompleted.md) | Event triggered when a previous call to [`LeaveAsServer`](./Lobby/LeaveAsServer.md) completed. |
| static event [OnServerLobbyPostUpdateAsServerCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyPostUpdateAsServerCompleted.md) | Event triggered when a previous call to [`PostUpdateAsServer`](./Lobby/PostUpdateAsServer.md) completed. |
| static event [OnServerLobbyPostUpdateCompleted](PlayFabMultiplayer.PlayFabMultiplayerServer/OnServerLobbyPostUpdateCompleted.md) | Event triggered when a previous call to [`ServerPostUpdate`](./Lobby/ServerPostUpdate.md) completed. |
| static [ClaimServerLobby](PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md)(…) | Claim ownership of a pre-existing server lobby. (2 methods) |
| static [CreateAndClaimServerLobby](PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md)(…) | Create a new lobby as a game_server entity. (2 methods) |
| static [CreateServerBackfillTicket](PlayFabMultiplayer.PlayFabMultiplayerServer/CreateServerBackfillTicket.md)(…) | Creates a server backfill ticket. |
| static [JoinLobbyAsServer](PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md)(…) | Join a client-owned lobby as a server. (2 methods) |
| delegate [OnServerLobbyClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [`ClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/ClaimServerLobby.md) completed. |
| delegate [OnServerLobbyCreateAndClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [`CreateAndClaimServerLobby`](./PlayFabMultiplayer.PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed. |
| delegate [OnServerLobbyDeleteCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler.md) | Handler for when the operation started by a previous call to [`ServerDeleteLobby`](./Lobby/ServerDeleteLobby.md) completed. |
| delegate [OnServerLobbyJoinAsServerCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyJoinAsServerCompletedHandler.md) | Handler for when the operation started by a previous call to [`JoinLobbyAsServer`](./PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md) completed. |
| delegate [OnServerLobbyLeaveAsServerCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyLeaveAsServerCompletedHandler.md) | Handler for when the operation started by a previous call to [`LeaveAsServer`](./Lobby/LeaveAsServer.md) completed. |
| delegate [OnServerLobbyPostUpdateAsServerCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateAsServerCompletedHandler.md) | Handler for when the operation started by a previous call to [`PostUpdateAsServer`](./Lobby/PostUpdateAsServer.md) completed. |
| delegate [OnServerLobbyPostUpdateCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler.md) | Handler for when the operation started by a previous call to [`ServerPostUpdate`](./Lobby/ServerPostUpdate.md) completed. |

## See Also

* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

