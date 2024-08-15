---
author: jasonsandlin
title: "PFGroupsInviteToGroupAsync"
description: "Invites a player to join a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsInviteToGroupAsync  

Invites a player to join a group  

## Syntax  
  
```cpp
HRESULT PFGroupsInviteToGroupAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsInviteToGroupRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsInviteToGroupRequest*](../../pfgroupstypes/structs/pfgroupsinvitetogrouprequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Invites a player to join a group, if they are not blocked by the group. An optional role can be provided to automatically assign the player to the role if they accept the invitation. By default, if the entity has an application to the group outstanding, this will accept the application instead and return an error indicating such, rather than creating a duplicate invitation to join that will need to be cleaned up later. Returns information about the new invitation or an error indicating an existing application to join was accepted. See also GroupAcceptGroupInvitationAsync, GroupListGroupInvitationsAsync, GroupListMembershipOpportunitiesAsync, GroupRemoveGroupInvitationAsync. When the asynchronous task is complete, call [PFGroupsInviteToGroupGetResultSize](pfgroupsinvitetogroupgetresultsize.md) and [PFGroupsInviteToGroupGetResult](pfgroupsinvitetogroupgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
