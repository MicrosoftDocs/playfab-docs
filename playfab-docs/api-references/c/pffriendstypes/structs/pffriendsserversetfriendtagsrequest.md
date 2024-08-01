---
author: jasonsandlin
title: "PFFriendsServerSetFriendTagsRequest"
description: "PFFriendsServerSetFriendTagsRequest data model. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsServerSetFriendTagsRequest  

PFFriendsServerSetFriendTagsRequest data model. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error.  

## Syntax  
  
```cpp
typedef struct PFFriendsServerSetFriendTagsRequest {  
    const char* friendPlayFabId;  
    const char* playFabId;  
    const char* const* tags;  
    uint32_t tagsCount;  
} PFFriendsServerSetFriendTagsRequest;  
```
  
### Members  
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab identifier of the friend account to which the tag(s) should be applied.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
PlayFab identifier of the player whose friend is to be updated.
  
**`tags`** &nbsp; const char* const*  
  
Array of tags to set on the friend account.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
