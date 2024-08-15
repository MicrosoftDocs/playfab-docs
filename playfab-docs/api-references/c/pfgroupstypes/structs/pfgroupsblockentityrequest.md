---
author: jasonsandlin
title: "PFGroupsBlockEntityRequest"
description: "PFGroupsBlockEntityRequest data model. Blocks a list of entities from joining a group. Blocked entities may not create new applications to join, be invited to join, accept an invitation, or have an application accepted. Failure due to being blocked does not clean up existing applications or invitations to the group. No data is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsBlockEntityRequest  

PFGroupsBlockEntityRequest data model. Blocks a list of entities from joining a group. Blocked entities may not create new applications to join, be invited to join, accept an invitation, or have an application accepted. Failure due to being blocked does not clean up existing applications or invitations to the group. No data is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsBlockEntityRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsBlockEntityRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The entity to perform this action on.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
