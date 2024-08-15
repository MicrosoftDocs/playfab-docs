---
author: jasonsandlin
title: "PFFriendsClientRemoveFriendAsync"
description: "Removes a specified user from the friend list of the local user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientRemoveFriendRequest*](../../pffriendstypes/structs/pffriendsclientremovefriendrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientAddFriendAsync, ClientSetFriendTagsAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
