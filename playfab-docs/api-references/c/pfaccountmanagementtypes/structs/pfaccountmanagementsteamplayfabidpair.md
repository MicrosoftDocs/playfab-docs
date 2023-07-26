---
author: jasonsandlin
title: "PFAccountManagementSteamPlayFabIdPair"
description: "PFAccountManagementSteamPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/26/2023
---

# PFAccountManagementSteamPlayFabIdPair  

PFAccountManagementSteamPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSteamPlayFabIdPair {  
    const char* playFabId;  
    const char* steamStringId;  
} PFAccountManagementSteamPlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Steam identifier.
  
**`steamStringId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Steam identifier for a user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
