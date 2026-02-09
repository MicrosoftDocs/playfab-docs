---
title: title_scheduled_cloudscript_executed
author: joannaleecy
description: title_scheduled_cloudscript_executed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_scheduled_cloudscript_executed

This event is triggered when a CloudScript function is run by a scheduled task.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|CloudScriptExecutionResult|[ExecuteCloudScriptResult](../data-types/executecloudscriptresult.md)|Result of the CloudScript function, including an error information. Useful for debugging.|
|FunctionName|String|Name of the CloudScript function that was called.|
|ScheduledTask|[NameId](../data-types/nameid.md)|Scheduled task that called the CloudScript|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
