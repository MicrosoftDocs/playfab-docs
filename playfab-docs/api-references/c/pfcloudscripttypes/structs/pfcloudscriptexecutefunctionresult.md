---
author: jasonsandlin
title: "PFCloudScriptExecuteFunctionResult"
description: "PFCloudScriptExecuteFunctionResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCloudScriptExecuteFunctionResult  

PFCloudScriptExecuteFunctionResult data model.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptExecuteFunctionResult {  
    PFCloudScriptFunctionExecutionError const* error;  
    int32_t executionTimeMilliseconds;  
    const char* functionName;  
    PFJsonObject functionResult;  
    int32_t const* functionResultSize;  
    bool const* functionResultTooLarge;  
} PFCloudScriptExecuteFunctionResult;  
```
  
### Members  
  
**`error`** &nbsp; [PFCloudScriptFunctionExecutionError](pfcloudscriptfunctionexecutionerror.md) const*  
*may be nullptr*  
  
(Optional) Error from the CloudScript Azure Function.
  
**`executionTimeMilliseconds`** &nbsp; int32_t  
  
The amount of time the function took to execute.
  
**`functionName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the function that executed.
  
**`functionResult`** &nbsp; [PFJsonObject](../../pftypes/structs/pfjsonobject.md)  
  
(Optional) The object returned from the function, if any.
  
**`functionResultSize`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) The size in bytes of the object returned from the function, if any.
  
**`functionResultTooLarge`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Flag indicating if the FunctionResult was too large and was subsequently dropped from this event.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
