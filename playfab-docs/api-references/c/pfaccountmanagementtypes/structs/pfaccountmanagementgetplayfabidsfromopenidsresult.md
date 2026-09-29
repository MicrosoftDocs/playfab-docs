---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromOpenIdsResult"
description: "PFAccountManagementGetPlayFabIDsFromOpenIdsResult data model. For OpenId identifiers which have not been linked to PlayFab accounts, null will be returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromOpenIdsResult  

PFAccountManagementGetPlayFabIDsFromOpenIdsResult data model. For OpenId identifiers which have not been linked to PlayFab accounts, null will be returned.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromOpenIdsResult {  
    PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair const* data;  
    uint32_t dataCount;  
} PFAccountManagementGetPlayFabIDsFromOpenIdsResult;  
```
  
### Members  
  
**`data`** &nbsp; [PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair](pfaccountmanagementopenidsubjectidentifierplayfabidpair.md) const*  
*may be nullptr*  
  
(Optional) Mapping of OpenId Connect identifiers to PlayFab identifiers.
  
**`dataCount`** &nbsp; uint32_t  
  
Count of data
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
