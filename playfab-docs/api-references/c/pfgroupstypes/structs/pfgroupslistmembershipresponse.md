---
author: jasonsandlin
title: "PFGroupsListMembershipResponse"
description: "PFGroupsListMembershipResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipResponse  

PFGroupsListMembershipResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListMembershipResponse {  
    PFGroupsGroupWithRoles const* groups;  
    uint32_t groupsCount;  
} PFGroupsListMembershipResponse;  
```
  
### Members  
  
**`groups`** &nbsp; [PFGroupsGroupWithRoles](pfgroupsgroupwithroles.md) const*  
*may be nullptr*  
  
(Optional) The list of groups.
  
**`groupsCount`** &nbsp; uint32_t  
  
Count of groups
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
