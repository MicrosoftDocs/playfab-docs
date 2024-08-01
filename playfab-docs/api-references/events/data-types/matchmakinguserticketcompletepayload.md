---
title: MatchmakingUserTicketCompletePayload
author: joannaleecy
description: MatchmakingUserTicketCompletePayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MatchmakingUserTicketCompletePayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CancellationReason|String|If the ticket result is "Canceled" then this string provides the reason why the ticket was canceled otherwise it is null. The possible list of values are "User", "Service", "Internal", "Timeout".|
|MatchId|String|The id of the match the ticket got matched into. If the ticket did not get matched this is set to null|
|QueueName|String|The name of the queue the ticket was created in.|
|Result|String|The final state of the ticket. Allowed states are "Matched" or "Canceled".|
|TicketId|String|Id of the ticket that was completed.|
