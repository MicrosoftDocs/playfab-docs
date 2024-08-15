---
author: jasonsandlin
title: "PFFriendsServerSetFriendTagsAsync"
description: "Updates the tag list for a specified user in the friend list of another user"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerSetFriendTagsAsync  

Updates the tag list for a specified user in the friend list of another user  

## Syntax  
  
```cpp
HRESULT PFFriendsServerSetFriendTagsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFFriendsServerSetFriendTagsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFFriendsServerSetFriendTagsRequest*](../../pffriendstypes/structs/pffriendsserversetfriendtagsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error. See also ServerAddFriendAsync, ServerGetFriendsListAsync, ServerRemoveFriendAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
