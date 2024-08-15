---
author: jasonsandlin
title: "PFAccountManagementGameCenterPlayFabIdPair"
description: "PFAccountManagementGameCenterPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGameCenterPlayFabIdPair  

PFAccountManagementGameCenterPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGameCenterPlayFabIdPair {  
    const char* gameCenterId;  
    const char* playFabId;  
} PFAccountManagementGameCenterPlayFabIdPair;  
```
  
### Members  
  
**`gameCenterId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Game Center identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Game Center identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
