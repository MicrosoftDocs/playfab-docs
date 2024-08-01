---
author: jasonsandlin
title: "PFAccountManagementGetPlayerProfileResult"
description: "PFAccountManagementGetPlayerProfileResult data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetPlayerProfileResult  

PFAccountManagementGetPlayerProfileResult data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementGetPlayerProfileResult {  
    PFPlayerProfileModel const* playerProfile;  
} PFAccountManagementGetPlayerProfileResult;  
```
  
### Members  
  
**`playerProfile`** &nbsp; [PFPlayerProfileModel](../../pftypes/structs/pfplayerprofilemodel.md) const*  
*may be nullptr*  
  
(Optional) The profile of the player. This profile is not guaranteed to be up-to-date. For a new player, this profile will not exist.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
