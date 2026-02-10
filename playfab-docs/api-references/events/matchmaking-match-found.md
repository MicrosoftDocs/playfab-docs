---
title: matchmaking_match_found
author: joannaleecy
description: matchmaking_match_found event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# matchmaking_match_found

This event is triggered when a group of tickets are matched together.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[MatchmakingMatchFoundPayload](data-types/matchmakingmatchfoundpayload.md)|Payload that this entity is a child of.|
|WriterEntity|[EntityKey](data-types/entitykey.md)|Entity that wrote this event, included only if different than the event's entity.|

## Common Properties

[!INCLUDE [common-properties](../../includes/_common-properties-eventsv1.md)]


