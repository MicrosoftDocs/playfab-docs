---
author: jasonsandlin
title: "PFGroupsUpdateGroupRoleRequest"
description: "PFGroupsUpdateGroupRoleRequest data model. Updates the role name. Returns information about whether the update was successful."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsUpdateGroupRoleRequest  

PFGroupsUpdateGroupRoleRequest data model. Updates the role name. Returns information about whether the update was successful.  

## Syntax  
  
```cpp
typedef struct PFGroupsUpdateGroupRoleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    int32_t const* expectedProfileVersion;  
    PFEntityKey const* group;  
    const char* roleId;  
    const char* roleName;  
} PFGroupsUpdateGroupRoleRequest;  
```
  
### Members  
  
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
  
**`roleId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) ID of the role to update. Role IDs must be between 1 and 64 characters long.
  
**`roleName`** &nbsp; const char*  
*is null-terminated*  
  
The new name of the role.
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
