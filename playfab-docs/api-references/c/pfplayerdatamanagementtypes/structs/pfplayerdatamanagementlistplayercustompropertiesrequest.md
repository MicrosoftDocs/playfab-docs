---
author: jasonsandlin
title: "PFPlayerDataManagementListPlayerCustomPropertiesRequest"
description: "PFPlayerDataManagementListPlayerCustomPropertiesRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFPlayerDataManagementListPlayerCustomPropertiesRequest  

PFPlayerDataManagementListPlayerCustomPropertiesRequest data model.  

## Syntax  
  
```cpp
typedef struct PFPlayerDataManagementListPlayerCustomPropertiesRequest {  
    const char* playFabId;  
} PFPlayerDataManagementListPlayerCustomPropertiesRequest;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFPlayerDataManagementTypes.h
  
## See also  
[PFPlayerDataManagementTypes members](../pfplayerdatamanagementtypes_members.md)  

  
  
