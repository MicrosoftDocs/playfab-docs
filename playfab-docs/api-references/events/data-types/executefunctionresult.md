---
title: ExecuteFunctionResult
author: joannaleecy
description: ExecuteFunctionResult data type.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ExecuteFunctionResult

The result from executing a CloudScript Azure Function.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Error|[FunctionExecutionError](functionexecutionerror.md)|Error from the CloudScript Azure Function, if any.|
|ExecutionTimeMilliseconds|int|The amount of time the function took to execute in milliseconds.|
|FunctionName|String|The name of the function that executed.|
|FunctionResult|Object|The object returned from the function, if any.|
|FunctionResultSize|int|The size in bytes of the object returned from the function, if any.|
|FunctionResultTooLarge|Boolean|Flag indicating if the FunctionResult was too large and was subsequently dropped from this event.|
