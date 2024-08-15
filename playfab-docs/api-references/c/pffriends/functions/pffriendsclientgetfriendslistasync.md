---
author: jasonsandlin
title: "PFFriendsClientGetFriendsListAsync"
description: "Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientGetFriendsListAsync  

Retrieves the current friend list for the local user, constrained to users who have PlayFab accounts. Friends from linked accounts (Facebook, Steam) are also included. You may optionally exclude some linked services' friends.  

## Syntax  
  
```cpp
HRESULT PFFriendsClientGetFriendsListAsync(  
    PFEntityHandle entityHandle,  
    const PFFriendsClientGetFriendsListRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFFriendsClientGetFriendsListRequest*](../../pffriendstypes/structs/pffriendsclientgetfriendslistrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientAddFriendAsync, ClientGetPlayerProfileAsync, ClientRemoveFriendAsync. When the asynchronous task is complete, call [PFFriendsClientGetFriendsListGetResultSize](pffriendsclientgetfriendslistgetresultsize.md) and [PFFriendsClientGetFriendsListGetResult](pffriendsclientgetfriendslistgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
