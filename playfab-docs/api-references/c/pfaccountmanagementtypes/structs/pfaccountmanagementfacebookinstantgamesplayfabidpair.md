---
author: jasonsandlin
title: "PFAccountManagementFacebookInstantGamesPlayFabIdPair"
description: "PFAccountManagementFacebookInstantGamesPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementFacebookInstantGamesPlayFabIdPair  

PFAccountManagementFacebookInstantGamesPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementFacebookInstantGamesPlayFabIdPair {  
    const char* facebookInstantGamesId;  
    const char* playFabId;  
} PFAccountManagementFacebookInstantGamesPlayFabIdPair;  
```
  
### Members  
  
**`facebookInstantGamesId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Facebook Instant Games identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Facebook Instant Games identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
