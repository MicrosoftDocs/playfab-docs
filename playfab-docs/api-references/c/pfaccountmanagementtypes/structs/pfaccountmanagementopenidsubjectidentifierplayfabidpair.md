---
author: jasonsandlin
title: "PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair"
description: "PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair  

PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair {  
    PFAccountManagementOpenIdSubjectIdentifier const* openIdSubjectIdentifier;  
    const char* playFabId;  
} PFAccountManagementOpenIdSubjectIdentifierPlayFabIdPair;  
```
  
### Members  
  
**`openIdSubjectIdentifier`** &nbsp; [PFAccountManagementOpenIdSubjectIdentifier](pfaccountmanagementopenidsubjectidentifier.md) const*  
*may be nullptr*  
  
(Optional) Unique OpenId Connect identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the OpenId Connect identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
