---
author: jasonsandlin
title: "PFAccountManagementBattleNetAccountPlayFabIdPair"
description: "PFAccountManagementBattleNetAccountPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementBattleNetAccountPlayFabIdPair  

PFAccountManagementBattleNetAccountPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementBattleNetAccountPlayFabIdPair {  
    const char* battleNetAccountId;  
    const char* playFabId;  
} PFAccountManagementBattleNetAccountPlayFabIdPair;  
```
  
### Members  
  
**`battleNetAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Battle.net account identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Battle.net account identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
