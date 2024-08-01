---
title: MatchmakingTicketCompletePayload
author: joannaleecy
description: MatchmakingTicketCompletePayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MatchmakingTicketCompletePayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CancellationReason|String|If the ticket result is "Canceled" then this string provides the reason why the ticket was canceled otherwise it is null. The possible list of values are "User", "Service", "Internal", "Timeout".|
|CompletionTime|DateTime|Time at which this ticket was completed.|
|CreationTime|DateTime|Time at which this ticket was created.|
|QueueName|String|The name of the queue the ticket was created in.|
|Result|String|The final state of the ticket. It could be "Matched" or "Canceled".|
|SubmissionTime|DateTime|Time at which this ticket was submitted into the matchmaking queue.|
|TicketEntities|[EntityKey](entitykey.md)|The list of entities that are part of this ticket.|
|TicketId|String|Id of the ticket that was completed.|
