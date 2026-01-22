---
title: matchmaking_user_ticket_invite  
author: joannaleecy
description: matchmaking_user_ticket_invite event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# matchmaking_user_ticket_invite  

This event is triggered when a ticket with an invited user is created. The event will be sent to the invited user.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[MatchmakingUserTicketInvitePayload](data-types/matchmakinguserticketinvitepayload.md)|Payload that this entity is a child of.|
|WriterEntity|[EntityKey](data-types/entitykey.md)|Entity that wrote this event, included only if different than the event's entity.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv1.md)]


