---
title: ticket_completed
author: anaislawson
description: ticket_completed event.
ms.author: anaislawson
ms.date: 02/05/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events, matchmaking
ms.localizationpriority: medium
---

# ticket_completed

This event is triggered when a matchmaking ticket reaches a terminal state (for example, it is matched or canceled).

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CancellationReason|String|If the ticket result is Canceled then this string provides the reason why the ticket was canceled otherwise it is null. Possible values: Requested, Internal, Timeout, ServerAllocationFailed.|
|CompletionTime|DateTime|Time at which this ticket was completed.|
|CreationTime|DateTime|Time at which this ticket was created.|
|MatchId|String|The identifier for the match that the ticket got matched into. This field is only set if the ticket got matched otherwise it will be null.|
|QueueName|String|The name of the queue the ticket was created in.|
|Result|String|The final state of the ticket. It could be Matched or Canceled.|
|SubmissionTime|DateTime|Time at which this ticket was submitted into the matchmaking queue.|
|TicketEntities|[EntityKey](../data-types/entitykey.md)[]|The list of entities that are part of this ticket.|
|TicketId|String|Id of the ticket that was completed.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]