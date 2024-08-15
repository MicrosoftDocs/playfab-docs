---
author: jasonsandlin
title: "PFAccountManagementGooglePlayGamesPlayFabIdPair"
description: "PFAccountManagementGooglePlayGamesPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGooglePlayGamesPlayFabIdPair  

PFAccountManagementGooglePlayGamesPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGooglePlayGamesPlayFabIdPair {  
    const char* googlePlayGamesPlayerId;  
    const char* playFabId;  
} PFAccountManagementGooglePlayGamesPlayFabIdPair;  
```
  
### Members  
  
**`googlePlayGamesPlayerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Google Play Games identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Google Play Games identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
