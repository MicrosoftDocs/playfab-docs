---
author: jasonsandlin
title: "PFGroupsInviteToGroupGetResultSize"
description: "Get the size in bytes needed to store the result of a InviteToGroup call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsInviteToGroupGetResultSize  

Get the size in bytes needed to store the result of a InviteToGroup call.  

## Syntax  
  
```cpp
HRESULT PFGroupsInviteToGroupGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENTITY_BLOCKED_BY_GROUP, E_PF_ENTITY_IS_ALREADY_MEMBER, E_PF_OUTSTANDING_APPLICATION_ACCEPTED_INSTEAD, E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
