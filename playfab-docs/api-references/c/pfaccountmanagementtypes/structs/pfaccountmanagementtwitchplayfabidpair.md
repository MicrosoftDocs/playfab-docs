---
author: jasonsandlin
title: "PFAccountManagementTwitchPlayFabIdPair"
description: "PFAccountManagementTwitchPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementTwitchPlayFabIdPair  

PFAccountManagementTwitchPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementTwitchPlayFabIdPair {  
    const char* playFabId;  
    const char* twitchId;  
} PFAccountManagementTwitchPlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Twitch identifier.
  
**`twitchId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Twitch identifier for a user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
