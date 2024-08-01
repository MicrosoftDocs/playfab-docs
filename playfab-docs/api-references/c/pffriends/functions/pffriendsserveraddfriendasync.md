---
author: jasonsandlin
title: "PFFriendsServerAddFriendAsync"
description: "Adds the Friend user to the friendlist of the user with PlayFabId. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerAddFriendAsync  

Adds the Friend user to the friendlist of the user with PlayFabId. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.  

## Syntax  
  
```cpp
HRESULT PFFriendsServerAddFriendAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFFriendsServerAddFriendRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFFriendsServerAddFriendRequest*](../../pffriendstypes/structs/pffriendsserveraddfriendrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerGetFriendsListAsync, ServerRemoveFriendAsync, ServerSetFriendTagsAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_USERS_ALREADY_FRIENDS or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
