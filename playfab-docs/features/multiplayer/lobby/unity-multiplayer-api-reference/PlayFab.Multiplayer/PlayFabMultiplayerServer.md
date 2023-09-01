---
author: nassosterz-ms
title: PlayFabMultiplayerServer class
description: PlayFabMultiplayerServer members
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 08/02/2023
---

# Class PlayFabMultiplayerServer

```csharp
public class PlayFabMultiplayerServer
```

## Events

| name | description |
| --- | --- |
| static event [OnServerLobbyCreateAndClaimCompleted](PlayFabMultiplayerServer/OnServerLobbyCreateAndClaimCompleted.md) | Event triggered when a previous call to [CreateAndClaimServerLobby](PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed. |
| static event [OnServerLobbyClaimCompleted](PlayFabMultiplayerServer/OnServerLobbyClaimCompleted.md) | Event triggered when a previous call to [ClaimServerLobby](PlayFabMultiplayerServer/ClaimServerLobby.md) completed. |
| static event [OnServerLobbyPostUpdateCompleted](PlayFabMultiplayerServer/OnServerLobbyPostUpdateCompleted.md) | Event triggered when a previous call to [ServerPostUpdate](Lobby/ServerPostUpdate.md) completed. |
| static event [OnServerLobbyDeleteCompleted](PlayFabMultiplayerServer/OnServerLobbyDeleteCompleted.md) | Event triggered when a previous call to [ServerDeleteLobby](Lobby/ServerDeleteLobby.md) completed. |

## Delegates

| name | description |
| --- | --- |
| delegate [OnServerLobbyCreateAndClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyCreateAndClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [CreateAndClaimServerLobby](PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) completed |
| delegate [OnServerLobbyClaimCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyClaimCompletedHandler.md) | Handler for when the operation started by a previous call to [ClaimServerLobby](PlayFabMultiplayerServer/ClaimServerLobby.md) completed |
| delegate [OnServerLobbyPostUpdateCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyPostUpdateCompletedHandler.md) | Handler for when the operation started by a previous call to to [ServerPostUpdate](Lobby/ServerPostUpdate.md) completed. |
| delegate [OnServerLobbyDeleteCompletedHandler](PlayFabMultiplayer.PlayFabMultiplayerServer.OnServerLobbyDeleteCompletedHandler.md) | Handler for when the operation started by a previous call to to [ServerDeleteLobby](Lobby/ServerDeleteLobby.md) completed. |

## Methods

| name | description |
| --- | --- |
| static [CreateAndClaimServerLobby](PlayFabMultiplayerServer/CreateAndClaimServerLobby.md) | Create a new lobby as a game_server entity. (2 methods) |
| static [ClaimServerLobby](PlayFabMultiplayerServer/ClaimServerLobby.md) | Claim ownership of a pre-existing server lobby. (2 methods) |
| static [CreateServerBackfillTicket](PlayFabMultiplayerServer/CreateServerBackfillTicket.md) |  Creates a server backfill ticket. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
