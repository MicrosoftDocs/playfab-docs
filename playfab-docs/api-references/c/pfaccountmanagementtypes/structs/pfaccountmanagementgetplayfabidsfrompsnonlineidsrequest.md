---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest  

PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest {  
    int32_t const* issuerId;  
    const char* const* PSNOnlineIDs;  
    uint32_t PSNOnlineIDsCount;  
} PFAccountManagementGetPlayFabIDsFromPSNOnlineIDsRequest;  
```
  
### Members  
  
**`issuerId`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Id of the PlayStation :tm: Network issuer environment. If null, defaults to production environment.
  
**`PSNOnlineIDs`** &nbsp; const char* const*  
  
Array of unique PlayStation :tm: Network identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`PSNOnlineIDsCount`** &nbsp; uint32_t  
  
Count of PSNOnlineIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
