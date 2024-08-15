---
author: jasonsandlin
title: "PFAccountManagementBanUsersResult"
description: "PFAccountManagementBanUsersResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementBanUsersResult  

PFAccountManagementBanUsersResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementBanUsersResult {  
    PFAccountManagementBanInfo const* banData;  
    uint32_t banDataCount;  
} PFAccountManagementBanUsersResult;  
```
  
### Members  
  
**`banData`** &nbsp; [PFAccountManagementBanInfo](pfaccountmanagementbaninfo.md) const*  
*may be nullptr*  
  
(Optional) Information on the bans that were applied.
  
**`banDataCount`** &nbsp; uint32_t  
  
Count of banData
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
