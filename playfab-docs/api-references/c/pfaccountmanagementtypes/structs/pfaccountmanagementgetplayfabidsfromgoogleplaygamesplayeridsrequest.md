---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest"
description: "PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest  

PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest {  
    const char* const* googlePlayGamesPlayerIDs;  
    uint32_t googlePlayGamesPlayerIDsCount;  
} PFAccountManagementGetPlayFabIDsFromGooglePlayGamesPlayerIDsRequest;  
```
  
### Members  
  
**`googlePlayGamesPlayerIDs`** &nbsp; const char* const*  
  
Array of unique Google Play Games identifiers (Google+ user IDs) for which the title needs to get PlayFab identifiers. The array cannot exceed 2,000 in length.
  
**`googlePlayGamesPlayerIDsCount`** &nbsp; uint32_t  
  
Count of googlePlayGamesPlayerIDs
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
