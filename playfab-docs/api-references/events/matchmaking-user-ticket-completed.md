---
title: matchmaking_user_ticket_completed 
author: joannaleecy
description: matchmaking_user_ticket_completed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# matchmaking_user_ticket_completed 

This event is triggered when a matchmaking ticket reaches a completion state. This event is sent to each of the users in the completed ticket

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[MatchmakingUserTicketCompletePayload](data-types/matchmakinguserticketcompletepayload.md)|Payload that this entity is a child of.|
|WriterEntity|[EntityKey](data-types/entitykey.md)|Entity that wrote this event, included only if different than the event's entity.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv1.md)]


