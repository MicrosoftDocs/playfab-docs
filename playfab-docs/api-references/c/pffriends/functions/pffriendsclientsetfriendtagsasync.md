---
author: jasonsandlin
title: "PFFriendsClientSetFriendTagsAsync"
description: "Updates the tag list for a specified user in the friend list of the local user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientSetFriendTagsAsync  

Updates the tag list for a specified user in the friend list of the local user  

## Syntax  
  
```cpp
HRESULT PFFriendsClientSetFriendTagsAsync(  
    PFEntityHandle entityHandle,  
    const PFFriendsClientSetFriendTagsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientSetFriendTagsRequest*](../../pffriendstypes/structs/pffriendsclientsetfriendtagsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error. See also ClientAddFriendAsync, ClientRemoveFriendAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
