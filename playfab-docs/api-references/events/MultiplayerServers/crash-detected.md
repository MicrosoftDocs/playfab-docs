---
title: crash_detected
author: valexao
description: crash_detected event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# crash_detected

This event triggered when a crash dump is found on a terminating server.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[CrashDetectedEventPayload](../data-types/crashdetectedeventpayload.md)|The multiplayer server crash detected event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]

