---
author: jasonsandlin
title: "PFFriendsClientGetFriendsListGetResultSize"
description: "Get the size in bytes needed to store the result of a ClientGetFriendsList call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFFriendsClientGetFriendsListGetResultSize  

Get the size in bytes needed to store the result of a ClientGetFriendsList call.  

## Syntax  
  
```cpp
HRESULT PFFriendsClientGetFriendsListGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFFriends.h
  
## See also  
[PFFriends members](../pffriends_members.md)  

  
  
