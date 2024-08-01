---
author: jasonsandlin
title: "PFGroupsListMembershipOpportunitiesAsync"
description: "Lists all outstanding invitations and group applications for an entity"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListMembershipOpportunitiesAsync  

Lists all outstanding invitations and group applications for an entity  

## Syntax  
  
```cpp
HRESULT PFGroupsListMembershipOpportunitiesAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListMembershipOpportunitiesRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListMembershipOpportunitiesRequest*](../../pfgroupstypes/structs/pfgroupslistmembershipopportunitiesrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Lists all outstanding group applications and invitations for an entity. Anyone may call this for any entity, but data will only be returned for the entity or a parent of that entity. To list invitations or applications for a group to check if a player is trying to join, use ListGroupInvitations and ListGroupApplications. See also GroupListGroupApplicationsAsync, GroupListGroupInvitationsAsync. When the asynchronous task is complete, call [PFGroupsListMembershipOpportunitiesGetResultSize](pfgroupslistmembershipopportunitiesgetresultsize.md) and [PFGroupsListMembershipOpportunitiesGetResult](pfgroupslistmembershipopportunitiesgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
