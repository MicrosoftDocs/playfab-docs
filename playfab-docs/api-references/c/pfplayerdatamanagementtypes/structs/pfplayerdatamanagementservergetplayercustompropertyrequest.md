---
author: jasonsandlin
title: "PFPlayerDataManagementServerGetPlayerCustomPropertyRequest"
description: "PFPlayerDataManagementServerGetPlayerCustomPropertyRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementServerGetPlayerCustomPropertyRequest  

PFPlayerDataManagementServerGetPlayerCustomPropertyRequest data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementServerGetPlayerCustomPropertyRequest {  
    const char* playFabId;  
    const char* propertyName;  
} PFPlayerDataManagementServerGetPlayerCustomPropertyRequest;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`propertyName`** &nbsp; const char*  
*is null-terminated*  
  
Specific property name to search for in the player's properties.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
