---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest  

PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest {  
    int32_t const* issuerId;  
    const char* const* PSNAccountIDs;  
    uint32_t PSNAccountIDsCount;  
} PFAccountManagementGetPlayFabIDsFromPSNAccountIDsRequest;  
```
  
### Members  
  
**`issuerId`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
  
**`PSNAccountIDs`** &nbsp; const char* const*  
  
Array of unique PlayStation :tm: Network identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`PSNAccountIDsCount`** &nbsp; uint32_t  
  
Count of PSNAccountIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
