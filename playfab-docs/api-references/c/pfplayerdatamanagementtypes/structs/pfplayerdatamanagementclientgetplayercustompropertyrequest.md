---
author: jasonsandlin
title: "PFPlayerDataManagementClientGetPlayerCustomPropertyRequest"
description: "PFPlayerDataManagementClientGetPlayerCustomPropertyRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementClientGetPlayerCustomPropertyRequest  

PFPlayerDataManagementClientGetPlayerCustomPropertyRequest data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementClientGetPlayerCustomPropertyRequest {  
    const char* propertyName;  
} PFPlayerDataManagementClientGetPlayerCustomPropertyRequest;  
```
  
### Members  
  
**`propertyName`** &nbsp; const char*  
*is null-terminated*  
  
Specific property name to search for in the player's properties.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
