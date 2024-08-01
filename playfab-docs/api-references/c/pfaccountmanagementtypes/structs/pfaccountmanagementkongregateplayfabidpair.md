---
author: jasonsandlin
title: "PFAccountManagementKongregatePlayFabIdPair"
description: "PFAccountManagementKongregatePlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementKongregatePlayFabIdPair  

PFAccountManagementKongregatePlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementKongregatePlayFabIdPair {  
    const char* kongregateId;  
    const char* playFabId;  
} PFAccountManagementKongregatePlayFabIdPair;  
```
  
### Members  
  
**`kongregateId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Kongregate identifier for a user.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Kongregate identifier.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
