---
author: jasonsandlin
title: "PFAccountManagementGetPlayFabIDsFromOpenIdsRequest"
description: "PFAccountManagementGetPlayFabIDsFromOpenIdsRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementGetPlayFabIDsFromOpenIdsRequest  

PFAccountManagementGetPlayFabIDsFromOpenIdsRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayFabIDsFromOpenIdsRequest {  
    PFAccountManagementOpenIdSubjectIdentifier const* openIdSubjectIdentifiers;  
    uint32_t openIdSubjectIdentifiersCount;  
} PFAccountManagementGetPlayFabIDsFromOpenIdsRequest;  
```
  
### Members  
  
**`openIdSubjectIdentifiers`** &nbsp; [PFAccountManagementOpenIdSubjectIdentifier](pfaccountmanagementopenidsubjectidentifier.md) const*  
  
Array of unique OpenId Connect identifiers for which the title needs to get PlayFab identifiers. The array cannot exceed 10 in length.
  
**`openIdSubjectIdentifiersCount`** &nbsp; uint32_t  
  
Count of openIdSubjectIdentifiers
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
