---
author: jasonsandlin
title: "PFFriendsServerRemoveFriendRequest"
description: "PFFriendsServerRemoveFriendRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerRemoveFriendRequest  

PFFriendsServerRemoveFriendRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsServerRemoveFriendRequest {  
    const char* friendPlayFabId;  
    const char* playFabId;  
} PFFriendsServerRemoveFriendRequest;  
```
  
### Members  
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab identifier of the friend account which is to be removed.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
