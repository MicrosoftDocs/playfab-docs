---
author: jasonsandlin
title: "PFAccountManagementSteamNamePlayFabIdPair"
description: "PFAccountManagementSteamNamePlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementSteamNamePlayFabIdPair  

PFAccountManagementSteamNamePlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSteamNamePlayFabIdPair {  
    const char* playFabId;  
    const char* steamName;  
} PFAccountManagementSteamNamePlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Steam identifier.
  
**`steamName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Steam identifier for a user, also known as Steam persona name.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
