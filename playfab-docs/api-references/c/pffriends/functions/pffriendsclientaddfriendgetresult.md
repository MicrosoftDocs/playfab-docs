---
author: jasonsandlin
title: "PFFriendsClientAddFriendGetResult"
description: "Gets the result of a successful PFFriendsClientAddFriendAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
