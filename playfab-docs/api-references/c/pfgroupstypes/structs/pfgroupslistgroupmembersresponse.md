---
author: jasonsandlin
title: "PFGroupsListGroupMembersResponse"
description: "PFGroupsListGroupMembersResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupMembersResponse  

PFGroupsListGroupMembersResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupMembersResponse {  
    PFGroupsEntityMemberRole const* members;  
    uint32_t membersCount;  
} PFGroupsListGroupMembersResponse;  
```
  
### Members  
  
**`members`** &nbsp; [PFGroupsEntityMemberRole](pfgroupsentitymemberrole.md) const*  
*may be nullptr*  
  
(Optional) The requested list of roles and member entity IDs.
  
**`membersCount`** &nbsp; uint32_t  
  
Count of members
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
