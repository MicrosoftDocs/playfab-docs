---
author: jasonsandlin
title: "PFAccountManagementUpdateBansRequest"
description: "PFAccountManagementUpdateBansRequest data model. For each ban, only updates the values that are set. Leave any value to null for no change. If a ban could not be found, the rest are still applied. Returns information about applied updates only."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/26/2023
---

# PFAccountManagementUpdateBansRequest  

PFAccountManagementUpdateBansRequest data model. For each ban, only updates the values that are set. Leave any value to null for no change. If a ban could not be found, the rest are still applied. Returns information about applied updates only.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUpdateBansRequest {  
    PFAccountManagementUpdateBanRequest const* bans;  
    uint32_t bansCount;  
} PFAccountManagementUpdateBansRequest;  
```
  
### Members  
  
**`bans`** &nbsp; [PFAccountManagementUpdateBanRequest](pfaccountmanagementupdatebanrequest.md) const*  
  
List of bans to be updated. Maximum 100.
  
**`bansCount`** &nbsp; uint32_t  
  
Count of bans
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
