---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest  

PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest {  
    const char* const* googleIDs;  
    uint32_t googleIDsCount;  
} PFAccountManagementGetPlayFabIDsFromGoogleIDsRequest;  
```
  
### Members  
  
**`googleIDs`** &nbsp; const char* const*  
  
Array of unique Google identifiers (Google+ user IDs) for which the title needs to get PlayFab identifiers. The array cannot exceed 25 in length.
  
**`googleIDsCount`** &nbsp; uint32_t  
  
Count of googleIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
