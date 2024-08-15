---
author: jasonsandlin
title: "PFAccountManagementPSNAccountPlayFabIdPair"
description: "PFAccountManagementPSNAccountPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementPSNAccountPlayFabIdPair  

PFAccountManagementPSNAccountPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementPSNAccountPlayFabIdPair {  
    const char* playFabId;  
    const char* PSNAccountId;  
} PFAccountManagementPSNAccountPlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the PlayStation :tm: Network identifier.
  
**`PSNAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayStation :tm: Network identifier for a user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
