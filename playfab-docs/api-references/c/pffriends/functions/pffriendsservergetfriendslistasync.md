---
author: jasonsandlin
title: "PFFriendsServerGetFriendsListAsync"
description: "Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerGetFriendsListAsync  

Retrieves the current friends for the user with PlayFabId, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.  

## Syntax  
  
```cpp
HRESULT PFFriendsServerGetFriendsListAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFFriendsServerGetFriendsListRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFFriendsServerGetFriendsListRequest*](../../pffriendstypes/structs/pffriendsservergetfriendslistrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerAddFriendAsync, ServerGetPlayerProfileAsync, ServerRemoveFriendAsync, ServerSetFriendTagsAsync. When the asynchronous task is complete, call [PFFriendsServerGetFriendsListGetResultSize](pffriendsservergetfriendslistgetresultsize.md) and [PFFriendsServerGetFriendsListGetResult](pffriendsservergetfriendslistgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
