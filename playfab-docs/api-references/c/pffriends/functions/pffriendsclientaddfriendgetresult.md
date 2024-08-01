---
author: jasonsandlin
title: "PFFriendsClientAddFriendGetResult"
description: "Gets the result of a successful PFFriendsClientAddFriendAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientAddFriendGetResult  

Gets the result of a successful PFFriendsClientAddFriendAsync call.  

## Syntax  
  
```cpp
HRESULT PFFriendsClientAddFriendGetResult(  
    XAsyncBlock* async,  
    PFFriendsAddFriendResult* result  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`result`** &nbsp; [PFFriendsAddFriendResult*](../../pffriendstypes/structs/pffriendsaddfriendresult.md)  
*output*  
  
PFFriendsAddFriendResult object that will be populated with the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_USERS_ALREADY_FRIENDS or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
