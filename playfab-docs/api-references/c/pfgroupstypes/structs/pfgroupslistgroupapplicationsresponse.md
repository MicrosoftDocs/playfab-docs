---
author: jasonsandlin
title: "PFGroupsListGroupApplicationsResponse"
description: "PFGroupsListGroupApplicationsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFGroupsListGroupApplicationsResponse  

PFGroupsListGroupApplicationsResponse data model.  

## Syntax  
  
```cpp
typedef struct PFGroupsListGroupApplicationsResponse {  
    PFGroupsGroupApplication const* applications;  
    uint32_t applicationsCount;  
} PFGroupsListGroupApplicationsResponse;  
```
  
### Members  
  
**`applications`** &nbsp; [PFGroupsGroupApplication](pfgroupsgroupapplication.md) const*  
*array of size `applicationsCount`*  
  
(Optional) The requested list of applications to the group.
  
**`applicationsCount`** &nbsp; uint32_t  
  
Count of applications
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
