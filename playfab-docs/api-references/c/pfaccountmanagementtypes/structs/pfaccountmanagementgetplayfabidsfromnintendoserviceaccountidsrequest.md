---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest"
description: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest  

PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest {  
    const char* const* nintendoAccountIds;  
    uint32_t nintendoAccountIdsCount;  
} PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest;  
```
  
### Members  
  
**`nintendoAccountIds`** &nbsp; const char* const*  
  
Array of unique Nintendo Switch Account identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`nintendoAccountIdsCount`** &nbsp; uint32_t  
  
Count of nintendoAccountIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
