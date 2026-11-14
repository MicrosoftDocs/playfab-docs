---
author: jasonsandlin
title: "PFCloudScriptEventHubFunctionModel"
description: "Contains details about a registered Azure Function triggered by an event hub. No callable PlayFab Services C API returns it."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/13/2026
---

# PFCloudScriptEventHubFunctionModel  

Contains details about a registered Azure Function triggered by an event hub.  

## Syntax  
  
```cpp
typedef struct PFCloudScriptEventHubFunctionModel {  
    const char* connectionString;  
    const char* eventHubName;  
    const char* functionName;  
} PFCloudScriptEventHubFunctionModel;  
```
  
### Members  
  
**`connectionString`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The connection string for the event hub.
  
**`eventHubName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name of the event hub that triggers the Azure Function.
  
**`functionName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The name the function was registered under.
  
  
## Remarks

No callable PlayFab Services C API returns this model. `PFCloudScriptListEventHubFunctionsResult` contains an array of pointers to these models, but its result-retrieval function is disabled by `#if 0` in `PFCloudScript.h`.

## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
