---
author: jasonsandlin
title: "PFGroupsRemoveGroupApplicationRequest"
description: "PFGroupsRemoveGroupApplicationRequest data model. Removes an existing application to join the group. This is used for both rejection of an application as well as withdrawing an application. The applying entity or a parent in its chain (e.g. title) may withdraw the application, and any caller with appropriate access in the group may reject an application. No data is returned in the case of success."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsRemoveGroupApplicationRequest  

PFGroupsRemoveGroupApplicationRequest data model. Removes an existing application to join the group. This is used for both rejection of an application as well as withdrawing an application. The applying entity or a parent in its chain (e.g. title) may withdraw the application, and any caller with appropriate access in the group may reject an application. No data is returned in the case of success.  

## Syntax  
  
```cpp
typedef struct PFGroupsRemoveGroupApplicationRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFEntityKey const* group;  
} PFGroupsRemoveGroupApplicationRequest;  
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

  
  
