---
author: jasonsandlin
title: "PFGroupsGetGroupRequest"
description: "PFGroupsGetGroupRequest data model. Returns the ID, name, role list and other non-membership related information about a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsGetGroupRequest  

PFGroupsGetGroupRequest data model. Returns the ID, name, role list and other non-membership related information about a group.  

## Syntax  
  
```cpp
typedef struct PFGroupsGetGroupRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
    const char* groupName;  
} PFGroupsGetGroupRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
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

  
  
