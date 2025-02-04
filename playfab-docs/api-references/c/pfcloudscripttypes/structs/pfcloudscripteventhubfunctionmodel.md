---
author: jasonsandlin
title: "PFCloudScriptEventHubFunctionModel"
description: "PFCloudScriptEventHubFunctionModel data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFCloudScriptEventHubFunctionModel  

PFCloudScriptEventHubFunctionModel data model.  

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
  
  
## Requirements  
  
**Header:** PFCloudScriptTypes.h
  
## See also  
[PFCloudScriptTypes members](../pfcloudscripttypes_members.md)  

  
  
