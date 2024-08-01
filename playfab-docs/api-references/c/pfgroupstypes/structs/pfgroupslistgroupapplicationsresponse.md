---
author: jasonsandlin
title: "PFGroupsListGroupApplicationsResponse"
description: "PFGroupsListGroupApplicationsResponse data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
*may be nullptr*  
  
(Optional) The requested list of applications to the group.
  
**`applicationsCount`** &nbsp; uint32_t  
  
Count of applications
  
  
## Requirements  
  
**Header:** PFGroupsTypes.h
  
## See also  
[PFGroupsTypes members](../pfgroupstypes_members.md)  

  
  
