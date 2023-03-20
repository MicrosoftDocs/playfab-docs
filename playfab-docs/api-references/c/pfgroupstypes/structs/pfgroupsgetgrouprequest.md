---
author: jasonsandlin
title: "PFGroupsGetGroupRequest"
description: "PFGroupsGetGroupRequest data model. Returns the ID, name, role list and other non-membership related information about a group."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsGetGroupRequest  

PFGroupsGetGroupRequest data model. Returns the ID, name, role list and other non-membership related information about a group.  

## Syntax  
  
```cpp
typedef struct PFGroupsGetGroupRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    const char* groupName;  
} PFGroupsGetGroupRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The identifier of the group.
  
**`groupName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The full name of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
