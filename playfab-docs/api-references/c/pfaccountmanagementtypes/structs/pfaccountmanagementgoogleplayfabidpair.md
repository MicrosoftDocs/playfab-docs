---
author: jasonsandlin
title: "PFAccountManagementGooglePlayFabIdPair"
description: "PFAccountManagementGooglePlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGooglePlayFabIdPair  

PFAccountManagementGooglePlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGooglePlayFabIdPair {  
    const char* googleId;  
    const char* playFabId;  
} PFAccountManagementGooglePlayFabIdPair;  
```
  
### Members  
  
**`googleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Google identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Google identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
