---
author: jasonsandlin
title: "PFFriendsGetFriendsListResult"
description: "PFFriendsGetFriendsListResult data model. If any additional services are queried for the user's friends, those friends who also have a PlayFab account registered for the title will be returned in the results. For Facebook, user has to have logged into the title's Facebook app recently, and only friends who also plays this game will be included. For Xbox Live, user has to have logged into the Xbox Live recently, and only friends who also play this game will be included."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsGetFriendsListResult  

PFFriendsGetFriendsListResult data model. If any additional services are queried for the user's friends, those friends who also have a PlayFab account registered for the title will be returned in the results. For Facebook, user has to have logged into the title's Facebook app recently, and only friends who also plays this game will be included. For Xbox Live, user has to have logged into the Xbox Live recently, and only friends who also play this game will be included.  

## Syntax  
  
```cpp
typedef struct PFFriendsGetFriendsListResult {  
    PFFriendsFriendInfo const* friends;  
    uint32_t friendsCount;  
} PFFriendsGetFriendsListResult;  
```
  
### Members  
  
**`friends`** &nbsp; [PFFriendsFriendInfo](pffriendsfriendinfo.md) const*  
*may be nullptr*  
  
(Optional) Array of friends found.
  
**`friendsCount`** &nbsp; uint32_t  
  
Count of friends
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
