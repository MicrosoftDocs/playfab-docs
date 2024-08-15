---
author: jasonsandlin
title: "PFCloudScriptExecuteCloudScriptResult"
description: "PFCloudScriptExecuteCloudScriptResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptExecuteCloudScriptResult  

PFCloudScriptExecuteCloudScriptResult data model.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptExecuteCloudScriptResult {  
    int32_t aPIRequestsIssued;  
    PFCloudScriptScriptExecutionError const* error;  
    double executionTimeSeconds;  
    const char* functionName;  
    PFJsonObject functionResult;  
    bool const* functionResultTooLarge;  
    int32_t httpRequestsIssued;  
    PFCloudScriptLogStatement const* logs;  
    uint32_t logsCount;  
    bool const* logsTooLarge;  
    uint32_t memoryConsumedBytes;  
    double processorTimeSeconds;  
    int32_t revision;  
} PFCloudScriptExecuteCloudScriptResult;  
```
  
### Members  
  
**`aPIRequestsIssued`** &nbsp; int32_t  
  
Number of PlayFab API requests issued by the CloudScript function.
  
**`error`** &nbsp; [PFCloudScriptScriptExecutionError](pfcloudscriptscriptexecutionerror.md) const*  
*may be nullptr*  
  
(Optional) Information about the error, if any, that occurred during execution.
  
**`executionTimeSeconds`** &nbsp; double  
  
ExecutionTimeSeconds property.
  
**`functionName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the function that executed.
  
**`functionResult`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) The object returned from the CloudScript function, if any.
  
**`functionResultTooLarge`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Flag indicating if the FunctionResult was too large and was subsequently dropped from this event. This only occurs if the total event size is larger than 350KB.
  
**`httpRequestsIssued`** &nbsp; int32_t  
  
Number of external HTTP requests issued by the CloudScript function.
  
**`logs`** &nbsp; [PFCloudScriptLogStatement](pfcloudscriptlogstatement.md) const*  
*may be nullptr*  
  
(Optional) Entries logged during the function execution. These include both entries logged in the function code using log.info() and log.error() and error entries for API and HTTP request failures.
  
**`logsCount`** &nbsp; uint32_t  
  
Count of logs
  
**`logsTooLarge`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Flag indicating if the logs were too large and were subsequently dropped from this event. This only occurs if the total event size is larger than 350KB after the FunctionResult was removed.
  
**`memoryConsumedBytes`** &nbsp; uint32_t  
  
MemoryConsumedBytes property.
  
**`processorTimeSeconds`** &nbsp; double  
  
Processor time consumed while executing the function. This does not include time spent waiting on API calls or HTTP requests.
  
**`revision`** &nbsp; int32_t  
  
The revision of the CloudScript that executed.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
