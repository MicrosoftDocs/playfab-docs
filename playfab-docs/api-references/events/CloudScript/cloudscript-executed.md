---
title: cloudscript_executed
author: ronnyparedes
description: cloudscript_executed event.
ms.author: ronnyparedes
ms.date: 02/06/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# cloudscript_executed

This event is triggered when a CloudScript function is executed.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CloudScriptExecutionResult|[ExecuteCloudScriptResult](../data-types/executecloudscriptresult.md)|The details of the execution result.|
|FunctionName|String|Name of the CloudScript function that was executed.|
|Source|String|The source that caused the function to be executed; PlayStreamV2, Task.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]