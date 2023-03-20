---
author: jasonsandlin
title: "PFFriendsClientRemoveFriendRequest"
description: "PFFriendsClientRemoveFriendRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFFriendsClientRemoveFriendRequest  

PFFriendsClientRemoveFriendRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsClientRemoveFriendRequest {  
    const char* friendPlayFabId;  
} PFFriendsClientRemoveFriendRequest;  
```
  
### Members  
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab identifier of the friend account which is to be removed.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
