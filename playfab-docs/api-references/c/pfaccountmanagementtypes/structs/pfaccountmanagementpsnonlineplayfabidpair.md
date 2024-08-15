---
author: jasonsandlin
title: "PFAccountManagementPSNOnlinePlayFabIdPair"
description: "PFAccountManagementPSNOnlinePlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementPSNOnlinePlayFabIdPair  

PFAccountManagementPSNOnlinePlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementPSNOnlinePlayFabIdPair {  
    const char* playFabId;  
    const char* PSNOnlineId;  
} PFAccountManagementPSNOnlinePlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the PlayStation :tm: Network identifier.
  
**`PSNOnlineId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayStation :tm: Network identifier for a user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
