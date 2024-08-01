---
author: jasonsandlin
title: "PFGroupsDeleteGroupRequest"
description: "PFGroupsDeleteGroupRequest data model. Deletes a group and all roles, invitations, join requests, and blocks associated with it. Permission to delete is only required the group itself to execute this action. The group and data cannot be cannot be recovered once removed, but any abuse reports about the group will remain. No data is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsDeleteGroupRequest  

PFGroupsDeleteGroupRequest data model. Deletes a group and all roles, invitations, join requests, and blocks associated with it. Permission to delete is only required the group itself to execute this action. The group and data cannot be cannot be recovered once removed, but any abuse reports about the group will remain. No data is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsDeleteGroupRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsDeleteGroupRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
ID of the group or role to remove.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
