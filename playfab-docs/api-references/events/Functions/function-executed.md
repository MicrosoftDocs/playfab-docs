---
title: function_executed
author: joannaleecy
description: function_executed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# function_executed

This event is triggered when a CloudScript function is executed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ExecutionTimeMilliseconds|int|The execution time of the function in milliseconds.|
|FunctionName|String|The name of the function that was executed.|
|Result|[ExecuteFunctionResult](../data-types/executefunctionresult.md)|The result returned by the function execution.|
|ResultTooLarge|Boolean|Indicates if the result was too large to return and was truncated.|
|Source|String|The source or trigger that caused the function to execute.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
