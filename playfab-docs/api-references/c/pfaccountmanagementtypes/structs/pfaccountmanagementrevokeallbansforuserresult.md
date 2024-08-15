---
author: jasonsandlin
title: "PFAccountManagementRevokeAllBansForUserResult"
description: "PFAccountManagementRevokeAllBansForUserResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementRevokeAllBansForUserResult  

PFAccountManagementRevokeAllBansForUserResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementRevokeAllBansForUserResult {  
    PFAccountManagementBanInfo const* banData;  
    uint32_t banDataCount;  
} PFAccountManagementRevokeAllBansForUserResult;  
```
  
### Members  
  
**`banData`** &nbsp; [PFAccountManagementBanInfo](pfaccountmanagementbaninfo.md) const*  
*may be nullptr*  
  
(Optional) Information on the bans that were revoked.
  
**`banDataCount`** &nbsp; uint32_t  
  
Count of banData
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
