---
author: jasonsandlin
title: "PFFriendsClientSetFriendTagsAsync"
description: "Updates the tag list for a specified user in the friend list of the local user"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientSetFriendTagsRequest*](../../pffriendstypes/structs/pffriendsclientsetfriendtagsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error. See also ClientAddFriendAsync, ClientRemoveFriendAsync. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
