---
author: jasonsandlin
title: "PFGroupsInviteToGroupGetResult"
description: "Gets the result of a successful PFGroupsInviteToGroupAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFGroupsInviteToGroupGetResult  

Gets the result of a successful PFGroupsInviteToGroupAsync call.  

## Syntax  
  
```cpp
HRESULT PFGroupsInviteToGroupGetResult(  
    XAsyncBlock* async,  
    size_t bufferSize,  
    void* buffer,  
    PFGroupsInviteToGroupResponse** result,  
    size_t* bufferUsed  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t  
  
The size of the buffer for the result object.  
  
**`buffer`** &nbsp; void*  
*_Out_writes_bytes_to_(bufferSize,*bufferUsed)*  
  
Byte buffer used for the result value and its fields.  
  
**`result`** &nbsp; [PFGroupsInviteToGroupResponse**](../../pfgroupstypes/structs/pfgroupsinvitetogroupresponse.md)  
*library-allocated output*  
  
Pointer to the result object.  
  
**`bufferUsed`** &nbsp; size_t*  
*optional output*  
  
The number of bytes in the provided buffer that were used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_ENTITY_BLOCKED_BY_GROUP, E_PF_ENTITY_IS_ALREADY_MEMBER, E_PF_OUTSTANDING_APPLICATION_ACCEPTED_INSTEAD, E_PF_ROLE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Remarks  
  
result is a pointer within buffer and does not need to be freed separately.
  
## Requirements  
  
**Header:** PFGroups.h
  
## See also  
[PFGroups members](../pfgroups_members.md)  

  
  
