---
title: player_triggered_action_executed_cloudscript
author: joannaleecy
description: player_triggered_action_executed_cloudscript event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_triggered_action_executed_cloudscript

This event is triggered when a CloudScript function is run as the result of a PlayStream action, and the 'Publish results as a PlayStream Event' box was checked.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CloudScriptExecutionResult|[ExecuteCloudScriptResult](../data-types/executecloudscriptresult.md)|Result of the CloudScript function, including an error information. Useful for debugging.|
|FunctionName|String|Name of the CloudScript function that was called.|
|TitleId|String|The ID of the title to which this player event applies.|
|TriggeringEventData|object|The full JSON data of the event that triggered this CloudScript function to run. Useful for debugging.|
|TriggeringEventName|String|Name of the event that triggered this CloudScript function to run.|
|TriggeringPlayer|[PlayerProfile](../data-types/playerprofile.md)|JSON data profile of the player that triggered this CloudScript function to run.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
