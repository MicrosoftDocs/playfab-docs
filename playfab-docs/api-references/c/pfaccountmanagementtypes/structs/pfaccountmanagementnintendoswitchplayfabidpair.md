---
author: jasonsandlin
title: "PFAccountManagementNintendoSwitchPlayFabIdPair"
description: "PFAccountManagementNintendoSwitchPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementNintendoSwitchPlayFabIdPair  

PFAccountManagementNintendoSwitchPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementNintendoSwitchPlayFabIdPair {  
    const char* nintendoSwitchDeviceId;  
    const char* playFabId;  
} PFAccountManagementNintendoSwitchPlayFabIdPair;  
```
  
### Members  
  
**`nintendoSwitchDeviceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Nintendo Switch Device identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Nintendo Switch Device identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
