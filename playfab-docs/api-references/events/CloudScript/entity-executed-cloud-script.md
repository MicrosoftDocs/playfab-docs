---
title: entity_executed_cloud_script
author: joannaleecy
description: entity_executed_cloud_script event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_executed_cloud_script

This event is optionally triggered when a CloudScript function is executed by calling the ExecuteEntityCloudScript API. If you want the Event logged, you can pass in GeneratePlayStreamEvent.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CloudScriptExecutionResult|[ExecuteCloudScriptResult](../data-types/executecloudscriptresult.md)|Result of the CloudScript function, including diagnostic information that's useful for debugging.|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|FunctionName|String|Name of the CloudScript function that was called.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
