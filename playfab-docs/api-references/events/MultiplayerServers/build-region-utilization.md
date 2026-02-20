---
title: build_region_utilization
author: valexao
description: build_region_utilization event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# build_region_utilization

This event is triggered to display the utilization of servers for a build in each region.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[BuildRegionUtilizationEventPayload](../data-types/buildregionutilizationeventpayload.md)|The multiplayer server build region utilization event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]

