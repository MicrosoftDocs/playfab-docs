---
title: player_executed_cloudscript
author: joannaleecy
description: player_executed_cloudscript event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_executed_cloudscript

This event is optionally triggered when a CloudScript function is executed, either by calling the ExecuteCloudScript API with the GeneratePlayStreamEvent option or triggered by a PlayStream event action with the 'Publish results as a PlayStream Event' box checked.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CloudScriptExecutionResult|[ExecuteCloudScriptResult](../data-types/executecloudscriptresult.md)|Result of the CloudScript function, including diagnostic information that's useful for debugging.|
|FunctionName|String|Name of the CloudScript function that was called.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
