---
title: match_found
author: anaislawson
description: match_found event.
ms.author: anaislawson
ms.date: 02/05/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events, matchmaking
ms.localizationpriority: medium
---

# match_found

This event is triggered when matchmaking successfully forms a match for a set of tickets.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|MatchId|String|The unique identifier for the match that was created.|
|QueueName|String|The name of the matchmaking queue in which the match was formed.|
|TicketIds|String[]|An array of ticket IDs that were matched together to form the match.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]