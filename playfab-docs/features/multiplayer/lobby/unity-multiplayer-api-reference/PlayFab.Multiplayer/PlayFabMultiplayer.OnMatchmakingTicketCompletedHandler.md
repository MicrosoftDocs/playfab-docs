---
author: vicodex
title: PlayFabMultiplayer.OnMatchmakingTicketCompletedHandler
description: PlayFabMultiplayer.OnMatchmakingTicketCompletedHandler
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayer.OnMatchmakingTicketCompletedHandler delegate

Handler for when a matchmaking ticket status has changed.

```csharp
public delegate void OnMatchmakingTicketCompletedHandler(MatchmakingTicket ticket, int result);
```

| parameter | description |
| --- | --- |
| ticket | The matchmaking ticket whose status changed. |
| result | Indicates whether the ticket found a match or provides the high-level reason that it failed. |

## See Also

* class [MatchmakingTicket](./MatchmakingTicket.md)
* class [PlayFabMultiplayer](./PlayFabMultiplayer.md)
* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)

