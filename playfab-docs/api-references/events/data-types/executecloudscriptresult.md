---
title: ExecuteCloudScriptResult
author: joannaleecy
description: ExecuteCloudScriptResult data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ExecuteCloudScriptResult

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|APIRequestsIssued|int32|Number of PlayFab API requests issued by the CloudScript function|
|Error|[ScriptExecutionError](scriptexecutionerror.md)|Information about the error, if any, that occurred during execution|
|ExecutionTimeSeconds|double||
|FunctionName|String|The name of the function that executed|
|FunctionResult|object|The object returned from the CloudScript function, if any|
|FunctionResultTooLarge|Boolean|Flag indicating if the FunctionResult was too large and was subsequently dropped from this event. This only occurs if the total event size is larger than 350KB.|
|HttpRequestsIssued|int32|Number of external HTTP requests issued by the CloudScript function|
|Logs|[LogStatement](logstatement.md)|Entries logged during the function execution. These include both entries logged in the function code using log.info() and log.error() and error entries for API and HTTP request failures.|
|LogsTooLarge|Boolean|Flag indicating if the logs were too large and were subsequently dropped from this event. This only occurs if the total event size is larger than 350KB after the FunctionResult was removed.|
|MemoryConsumedBytes|uint32||
|ProcessorTimeSeconds|double|Processor time consumed while executing the function. This does not include time spent waiting on API calls or HTTP requests.|
|Revision|int32|The revision of the CloudScript that executed|
