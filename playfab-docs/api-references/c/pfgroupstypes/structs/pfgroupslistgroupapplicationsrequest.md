---
author: jasonsandlin
title: "PFGroupsListGroupApplicationsRequest"
description: "PFGroupsListGroupApplicationsRequest data model. Lists all outstanding requests to join a group. Returns a list of all requests to join, as well as when the request will expire. To get the group applications for a specific entity, use ListMembershipOpportunities."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupApplicationsRequest  

PFGroupsListGroupApplicationsRequest data model. Lists all outstanding requests to join a group. Returns a list of all requests to join, as well as when the request will expire. To get the group applications for a specific entity, use ListMembershipOpportunities.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupApplicationsRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupApplicationsRequest;  
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

  
  
