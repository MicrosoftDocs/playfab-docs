---
author: jasonsandlin
title: "PFGroupsListMembershipAsync"
description: "Lists all groups and roles for an entity"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipAsync  

Lists all groups and roles for an entity  

## Syntax  
  
```cpp
HRESULT PFGroupsListMembershipAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListMembershipRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListMembershipRequest*](../../pfgroupstypes/structs/pfgroupslistmembershiprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Lists the groups and roles that an entity is a part of, checking to see if group and role metadata and memberships should be visible to the caller. If the entity is not in any roles that are visible to the caller, the group is not returned in the results, even if the caller otherwise has permission to see that the entity is a member of that group. See also GroupListGroupMembersAsync, GroupListMembershipOpportunitiesAsync. When the asynchronous task is complete, call [PFGroupsListMembershipGetResultSize](pfgroupslistmembershipgetresultsize.md) and [PFGroupsListMembershipGetResult](pfgroupslistmembershipgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
