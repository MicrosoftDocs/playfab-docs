---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult"
description: "PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult  

PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult {  
    int32_t propertiesVersion;  
} PFPlayerDataManagementClientUpdatePlayerCustomPropertiesResult;  
```
  
### Members  
  
**`propertiesVersion`** &nbsp; int32_t  
  
Indicates the current version of a player's properties that have been set. This is incremented after updates and deletes. This version can be provided in update and delete calls for concurrency control.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
