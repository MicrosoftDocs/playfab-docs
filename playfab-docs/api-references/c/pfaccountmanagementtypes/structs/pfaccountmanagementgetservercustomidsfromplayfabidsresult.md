---
author: jasonsandlin
title: "PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult"
description: "PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult data model. For a PlayFab account that isn't associated with a server custom identity, ServerCustomId will be null."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult  

PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult data model. For a PlayFab account that isn't associated with a server custom identity, ServerCustomId will be null.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult {  
    PFAccountManagementServerCustomIDPlayFabIDPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetServerCustomIDsFromPlayFabIDsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementServerCustomIDPlayFabIDPair](pfaccountmanagementservercustomidplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of server custom player identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
