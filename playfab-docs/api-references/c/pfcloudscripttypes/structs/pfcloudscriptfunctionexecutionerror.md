---
author: jasonsandlin
title: "PFCloudScriptFunctionExecutionError"
description: "PFCloudScriptFunctionExecutionError data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptFunctionExecutionError  

PFCloudScriptFunctionExecutionError data model.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptFunctionExecutionError {  
    const char* error;  
    const char* message;  
    const char* stackTrace;  
} PFCloudScriptFunctionExecutionError;  
```
  
### Members  
  
**`error`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Error code, such as CloudScriptAzureFunctionsExecutionTimeLimitExceeded, CloudScriptAzureFunctionsArgumentSizeExceeded, CloudScriptAzureFunctionsReturnSizeExceeded or CloudScriptAzureFunctionsHTTPRequestError.
  
**`message`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Details about the error.
  
**`stackTrace`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Point during the execution of the function at which the error occurred, if any.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
