---
author: jasonsandlin
title: "PFFriendsServerAddFriendRequest"
description: "PFFriendsServerAddFriendRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerAddFriendRequest  

PFFriendsServerAddFriendRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsServerAddFriendRequest {  
    const char* friendEmail;  
    const char* friendPlayFabId;  
    const char* friendTitleDisplayName;  
    const char* friendUsername;  
    const char* playFabId;  
} PFFriendsServerAddFriendRequest;  
```
  
### Members  
  
**`friendEmail`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Email address of the user being added.
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The PlayFab identifier of the user being added.
  
**`friendTitleDisplayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title-specific display name of the user to being added.
  
**`friendUsername`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The PlayFab username of the user being added.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab identifier of the player to add a new friend.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
