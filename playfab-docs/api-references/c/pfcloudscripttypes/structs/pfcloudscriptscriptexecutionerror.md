---
author: jasonsandlin
title: "PFCloudScriptScriptExecutionError"
description: "PFCloudScriptScriptExecutionError data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCloudScriptScriptExecutionError  

PFCloudScriptScriptExecutionError data model.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptScriptExecutionError {  
    const char* error;  
    const char* message;  
    const char* stackTrace;  
} PFCloudScriptScriptExecutionError;  
```
  
### Members  
  
**`error`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Error code, such as CloudScriptNotFound, JavascriptException, CloudScriptFunctionArgumentSizeExceeded, CloudScriptAPIRequestCountExceeded, CloudScriptAPIRequestError, or CloudScriptHTTPRequestError.
  
**`message`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Details about the error.
  
**`stackTrace`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Point during the execution of the script at which the error occurred, if any.
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
