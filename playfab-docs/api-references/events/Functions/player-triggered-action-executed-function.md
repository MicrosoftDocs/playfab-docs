---
title: player_triggered_action_executed_function
author: joannaleecy
description: player_triggered_action_executed_function event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_triggered_action_executed_function

This event is triggered when a CloudScript Azure Function is run as the result of a PlayStream action, and the 'Publish results as a PlayStream Event' box was checked.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|FunctionExecutionResult|[ExecuteFunctionResult](../data-types/executefunctionresult.md)|Result of the CloudScript Azure Function.|
|FunctionName|String|Name of the CloudScript Azure Function that was called.|
|TriggeringEventData|Object|The full JSON data of the event that triggered this CloudScript function to run. Useful for debugging.|
|TriggeringEventName|String|Name of the event that triggered this CloudScript function to run.|
|TriggeringPlayer|[PlayerProfile](../data-types/playerprofile.md)|JSON data profile of the player that triggered this CloudScript function to run.|
|TitleId|String|The ID of the title to which this player event applies.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]