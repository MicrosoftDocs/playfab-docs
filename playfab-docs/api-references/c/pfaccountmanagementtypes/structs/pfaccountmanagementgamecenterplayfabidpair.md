---
author: jasonsandlin
title: "PFAccountManagementGameCenterPlayFabIdPair"
description: "PFAccountManagementGameCenterPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/26/2023
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

  
  
