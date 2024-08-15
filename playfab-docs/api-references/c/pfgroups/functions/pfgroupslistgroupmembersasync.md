---
author: jasonsandlin
title: "PFGroupsListGroupMembersAsync"
description: "Lists all members for a group"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsListGroupMembersAsync  

Lists all members for a group  

## Syntax  
  
```cpp
HRESULT PFGroupsListGroupMembersAsync(  
    PFEntityHandle entityHandle,  
    const PFGroupsListGroupMembersRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFGroupsListGroupMembersRequest*](../../pfgroupstypes/structs/pfgroupslistgroupmembersrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Gets a list of members and the roles they belong to within the group. If the caller does not have permission to view the role, and the member is in no other role, the member is not displayed. Returns a list of entities that are members of the group. See also GroupListMembershipAsync. When the asynchronous task is complete, call [PFGroupsListGroupMembersGetResultSize](pfgroupslistgroupmembersgetresultsize.md) and [PFGroupsListGroupMembersGetResult](pfgroupslistgroupmembersgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
