---
author: jasonsandlin
title: "PFFriendsServerRemoveFriendAsync"
description: "Removes the specified friend from the the user's friend list"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2023
---

# PFFriendsServerRemoveFriendAsync  

Removes the specified friend from the the user's friend list  

## Syntax  
  
```cpp
HRESULT PFFriendsServerRemoveFriendAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFFriendsServerRemoveFriendRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFFriendsServerRemoveFriendRequest*](../../pffriendstypes/structs/pffriendsserverremovefriendrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32. See also ServerAddFriendAsync, ServerSetFriendTagsAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
