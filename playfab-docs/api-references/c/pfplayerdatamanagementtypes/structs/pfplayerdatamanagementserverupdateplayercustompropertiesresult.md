---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult"
description: "PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult  

PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult {  
    const char* playFabId;  
    int32_t propertiesVersion;  
} PFPlayerDataManagementServerUpdatePlayerCustomPropertiesResult;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique identifier of the user whose properties were updated.
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
