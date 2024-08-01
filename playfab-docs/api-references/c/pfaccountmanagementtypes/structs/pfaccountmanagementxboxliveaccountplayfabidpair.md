---
author: jasonsandlin
title: "PFAccountManagementXboxLiveAccountPlayFabIdPair"
description: "PFAccountManagementXboxLiveAccountPlayFabIdPair data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementXboxLiveAccountPlayFabIdPair  

PFAccountManagementXboxLiveAccountPlayFabIdPair data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementXboxLiveAccountPlayFabIdPair {  
    const char* playFabId;  
    const char* xboxLiveAccountId;  
} PFAccountManagementXboxLiveAccountPlayFabIdPair;  
```
  
### Members  
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab identifier for a user, or null if no PlayFab account is linked to the Xbox Live identifier.
  
**`xboxLiveAccountId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique Xbox Live identifier for a user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
