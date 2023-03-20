---
author: jasonsandlin
title: "PFGroupsListGroupApplicationsRequest"
description: "PFGroupsListGroupApplicationsRequest data model. Lists all outstanding requests to join a group. Returns a list of all requests to join, as well as when the request will expire. To get the group applications for a specific entity, use ListMembershipOpportunities."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupApplicationsRequest  

PFGroupsListGroupApplicationsRequest data model. Lists all outstanding requests to join a group. Returns a list of all requests to join, as well as when the request will expire. To get the group applications for a specific entity, use ListMembershipOpportunities.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupApplicationsRequest {  
    uint32_t customTagsCount;  
    PFEntityKey const* group;  
} PFGroupsListGroupApplicationsRequest;  
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

  
  
