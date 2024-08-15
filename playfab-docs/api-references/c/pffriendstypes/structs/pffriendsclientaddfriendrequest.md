---
author: jasonsandlin
title: "PFFriendsClientAddFriendRequest"
description: "PFFriendsClientAddFriendRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientAddFriendRequest  

PFFriendsClientAddFriendRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsClientAddFriendRequest {  
    const char* friendEmail;  
    const char* friendPlayFabId;  
    const char* friendTitleDisplayName;  
    const char* friendUsername;  
} PFFriendsClientAddFriendRequest;  
```
  
### Members  
  
**`friendEmail`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Email address of the user to attempt to add to the local user's friend list.
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab identifier of the user to attempt to add to the local user's friend list.
  
**`friendTitleDisplayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title-specific display name of the user to attempt to add to the local user's friend list.
  
**`friendUsername`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab username of the user to attempt to add to the local user's friend list.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
