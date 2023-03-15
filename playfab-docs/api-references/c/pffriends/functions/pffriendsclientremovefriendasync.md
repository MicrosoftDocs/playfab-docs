---
author: jasonsandlin
title: "PFFriendsClientRemoveFriendAsync"
description: "Removes a specified user from the friend list of the local user"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFFriendsClientRemoveFriendAsync  

Removes a specified user from the friend list of the local user  

## Syntax  
  
```cpp
HRESULT PFFriendsClientRemoveFriendAsync(  
    PFEntityHandle entityHandle,  
    const PFFriendsClientRemoveFriendRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientRemoveFriendRequest*](../../pffriendstypes/structs/pffriendsclientremovefriendrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
See also ClientAddFriendAsync, ClientSetFriendTagsAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
