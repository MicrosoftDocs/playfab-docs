---
author: jasonsandlin
title: "PFFriendsClientAddFriendAsync"
description: "Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientAddFriendAsync  

Adds the PlayFab user, based upon a match against a supplied unique identifier, to the friend list of the local user. At least one of FriendPlayFabId,FriendUsername,FriendEmail, or FriendTitleDisplayName should be initialized.  

## Syntax  
  
```cpp
HRESULT PFFriendsClientAddFriendAsync(  
    PFEntityHandle entityHandle,  
    const PFFriendsClientAddFriendRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientAddFriendRequest*](../../pffriendstypes/structs/pffriendsclientaddfriendrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientGetFriendsListAsync, ClientSetFriendTagsAsync. When the asynchronous task is complete, call [PFFriendsClientAddFriendGetResult](pffriendsclientaddfriendgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
