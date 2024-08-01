---
author: jasonsandlin
title: "PFAuthenticationLoginResult"
description: "PFAuthenticationLoginResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAuthenticationLoginResult  

PFAuthenticationLoginResult data model.  

## Syntax  
  
```cpp
typedef struct PFAuthenticationLoginResult {  
    PFGetPlayerCombinedInfoResultPayload const* infoResultPayload;  
    time_t const* lastLoginTime;  
    bool newlyCreated;  
    const char* playFabId;  
    PFAuthenticationUserSettings const* settingsForUser;  
    PFTreatmentAssignment const* treatmentAssignment;  
} PFAuthenticationLoginResult;  
```
  
### Members  
  
**`infoResultPayload`** &nbsp; PFGetPlayerCombinedInfoResultPayload const*  
*may be nullptr*  
  
(Optional) Results for requested info.
  
**`lastLoginTime`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time of this user's previous login. If there was no previous login, then it's DateTime.MinValue.
  
**`newlyCreated`** &nbsp; bool  
  
True if the account was newly created on this login.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Player's unique PlayFabId.
  
**`settingsForUser`** &nbsp; [PFAuthenticationUserSettings](pfauthenticationusersettings.md) const*  
*may be nullptr*  
  
(Optional) Settings specific to this user.
  
**`treatmentAssignment`** &nbsp; PFTreatmentAssignment const*  
*may be nullptr*  
  
(Optional) The experimentation treatments for this user at the time of login.
  
  
## Requirements  
  
**Header:** PFAuthenticationTypes.h
  
## See also  
[PFAuthenticationTypes members](../pfauthenticationtypes_members.md)  

  
  
