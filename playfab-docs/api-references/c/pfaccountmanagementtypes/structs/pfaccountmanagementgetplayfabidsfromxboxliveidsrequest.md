---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest  

PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest {  
    const char* sandbox;  
    const char* const* xboxLiveAccountIDs;  
    uint32_t xboxLiveAccountIDsCount;  
} PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest;  
```
  
### Members  
  
**`sandbox`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The ID of Xbox Live sandbox.
  
**`xboxLiveAccountIDs`** &nbsp; const char* const*  
  
Array of unique Xbox Live account identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`xboxLiveAccountIDsCount`** &nbsp; uint32_t  
  
Count of xboxLiveAccountIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
