---
author: vicodex
title: MatchmakingTicket.Cancel
description: MatchmakingTicket.Cancel
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# MatchmakingTicket.Cancel method

Cancels the ticket.

```csharp
public void Cancel()
```

## Remarks

This method queues an asynchronous operation to cancel this matchmaking ticket. On success, a [`OnMatchmakingTicketCompleted`](../PlayFabMultiplayer/OnMatchmakingTicketCompleted.md) will be provided indicating that the ticket has been canceled.

This method does not guarantee the ticket will be canceled. The ticket may complete before the cancellation can be processed, or the cancellation request may fail due to networking or service errors. If the cancellation attempt fails but is retrievable, the library will continue to retry the cancellation. Otherwise, a [`OnMatchmakingTicketCompleted`](../PlayFabMultiplayer/OnMatchmakingTicketCompleted.md) will be provided that indicates the ticket failed.

## See Also

* class [MatchmakingTicket](../MatchmakingTicket.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)
