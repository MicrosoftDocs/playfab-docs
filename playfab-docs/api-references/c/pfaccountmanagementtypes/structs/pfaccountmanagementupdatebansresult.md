---
author: jasonsandlin
title: "PFAccountManagementUpdateBansResult"
description: "PFAccountManagementUpdateBansResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUpdateBansResult  

PFAccountManagementUpdateBansResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUpdateBansResult {  
    PFAccountManagementBanInfo const* banData;  
    uint32_t banDataCount;  
} PFAccountManagementUpdateBansResult;  
```
  
### Members  
  
**`banData`** &nbsp; [PFAccountManagementBanInfo](pfaccountmanagementbaninfo.md) const*  
*may be nullptr*  
  
(Optional) Information on the bans that were updated.
  
**`banDataCount`** &nbsp; uint32_t  
  
Count of banData
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
