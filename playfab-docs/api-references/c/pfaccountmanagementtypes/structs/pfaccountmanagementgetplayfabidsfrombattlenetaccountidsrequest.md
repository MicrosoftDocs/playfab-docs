---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest"
description: "PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest  

PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest {  
    const char* const* battleNetAccountIds;  
    uint32_t battleNetAccountIdsCount;  
} PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest;  
```
  
### Members  
  
**`battleNetAccountIds`** &nbsp; const char* const*  
  
Array of unique Battle.net account identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 10 in length.
  
**`battleNetAccountIdsCount`** &nbsp; uint32_t  
  
Count of battleNetAccountIds
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
