---
author: jasonsandlin
title: "PFGroupsCreateGroupRequest"
description: "PFGroupsCreateGroupRequest data model. Creates a new group, as well as administration and member roles, based off of a title's group template. Returns information about the group that was created."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsCreateGroupRequest  

PFGroupsCreateGroupRequest data model. Creates a new group, as well as administration and member roles, based off of a title's group template. Returns information about the group that was created.  

## Syntax  
  
```cpp
typedef struct PFGroupsCreateGroupRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    const char* groupName;  
} PFGroupsCreateGroupRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`groupName`** &nbsp; const char*  
*is null-terminated*  
  
The name of the group. This is unique at the title level by default.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
