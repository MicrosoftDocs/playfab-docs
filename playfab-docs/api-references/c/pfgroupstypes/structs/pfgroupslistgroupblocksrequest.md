---
author: jasonsandlin
title: "PFGroupsListGroupBlocksRequest"
description: "PFGroupsListGroupBlocksRequest data model. Lists all entities blocked from joining a group. A list of blocked entities is returned."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupBlocksRequest  

PFGroupsListGroupBlocksRequest data model. Lists all entities blocked from joining a group. A list of blocked entities is returned.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupBlocksRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupBlocksRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
