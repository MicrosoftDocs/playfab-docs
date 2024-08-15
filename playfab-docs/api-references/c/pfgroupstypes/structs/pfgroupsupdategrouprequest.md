---
author: jasonsandlin
title: "PFGroupsUpdateGroupRequest"
description: "PFGroupsUpdateGroupRequest data model. Updates data about a group, such as the name or default member role. Returns information about whether the update was successful. Only title claimants may modify the administration role for a group."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsUpdateGroupRequest  

PFGroupsUpdateGroupRequest data model. Updates data about a group, such as the name or default member role. Returns information about whether the update was successful. Only title claimants may modify the administration role for a group.  

## Syntax  
  
```cpp
typedef struct PFGroupsUpdateGroupRequest {  
    const char* adminRoleId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* expectedProfileVersion;  
    PFEntityKey const* group;  
    const char* groupName;  
    const char* memberRoleId;  
} PFGroupsUpdateGroupRequest;  
```
  
### Members  
  
**`adminRoleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional: the ID of an existing role to set as the new administrator role for the group.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`expectedProfileVersion`** &nbsp; int32_t const*  
*may be nullptr*  
  
(Optional) Optional field used for concurrency control. By specifying the previously returned value of ProfileVersion from the GetGroup API, you can ensure that the group data update will only be performed if the group has not been updated by any other clients since the version you last loaded.
  
**`group`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
  
The identifier of the group.
  
**`groupName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional: the new name of the group.
  
**`memberRoleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Optional: the ID of an existing role to set as the new member role for the group.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
