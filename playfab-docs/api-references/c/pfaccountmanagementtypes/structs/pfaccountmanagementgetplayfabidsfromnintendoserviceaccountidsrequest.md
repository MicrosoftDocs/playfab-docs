---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest"
description: "PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest  

PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest {  
    const char* issuer;  
    const char* const* nintendoAccountIds;  
    uint32_t nintendoAccountIdsCount;  
} PFAccountManagementGetPlayFabIDsFromNintendoServiceAccountIdsRequest;  
```
  
### Members  
  
**`issuer`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Nintendo NSA issuer URL identifying the environment. When provided, only accounts registered in that environment are returned. If null or empty, falls back to the default environment.
  
**`nintendoAccountIds`** &nbsp; const char* const*  
  
Array of unique Nintendo Switch Account identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 25 in length.
  
**`nintendoAccountIdsCount`** &nbsp; uint32_t  
  
Count of nintendoAccountIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
