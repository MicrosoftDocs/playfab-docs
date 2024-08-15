---
author: jasonsandlin
title: "PFAccountManagementFacebookPlayFabIdPair"
description: "PFAccountManagementFacebookPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementFacebookPlayFabIdPair  

PFAccountManagementFacebookPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementFacebookPlayFabIdPair {  
    const char* facebookId;  
    const char* playFabId;  
} PFAccountManagementFacebookPlayFabIdPair;  
```
  
### Members  
  
**`facebookId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Facebook identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Facebook identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
