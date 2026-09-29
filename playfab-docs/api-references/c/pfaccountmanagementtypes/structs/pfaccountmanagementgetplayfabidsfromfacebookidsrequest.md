---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest  

PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest {  
    const char* const* facebookIDs;  
    uint32_t facebookIDsCount;  
} PFAccountManagementGetPlayFabIDsFromFacebookIDsRequest;  
```
  
### Members  
  
**`facebookIDs`** &nbsp; const char* const*  
  
Array of unique Facebook identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 25 in length.
  
**`facebookIDsCount`** &nbsp; uint32_t  
  
Count of facebookIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
