---
author: jasonsandlin
title: "PFGroupsListGroupBlocksRequest"
description: "PFGroupsListGroupBlocksRequest data model. Lists all entities blocked from joining a group. A list of blocked entities is returned."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupBlocksRequest  

PFGroupsListGroupBlocksRequest data model. Lists all entities blocked from joining a group. A list of blocked entities is returned.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupBlocksRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupBlocksRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
