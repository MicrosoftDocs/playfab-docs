---
author: jasonsandlin
title: "PFAccountManagementUpdateUserTitleDisplayNameResult"
description: "PFAccountManagementUpdateUserTitleDisplayNameResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUpdateUserTitleDisplayNameResult  

PFAccountManagementUpdateUserTitleDisplayNameResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUpdateUserTitleDisplayNameResult {  
    const char* displayName;  
} PFAccountManagementUpdateUserTitleDisplayNameResult;  
```
  
### Members  
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Current title display name for the user (this will be the original display name if the rename attempt failed).
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
