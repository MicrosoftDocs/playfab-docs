---
title: monitoring_output_saved
author: valexao
description: monitoring_output_saved event.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# monitoring_output_saved

This event is triggered when the output of a monitoring application has been saved and can be downloaded.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|Payload|[MonitoringOutputSavedEventPayload](../data-types/monitoringoutputsavedeventpayload.md)|The multiplayer server monitoring output saved event payload.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]

