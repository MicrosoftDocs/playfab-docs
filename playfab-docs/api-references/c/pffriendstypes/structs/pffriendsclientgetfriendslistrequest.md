---
author: jasonsandlin
title: "PFFriendsClientGetFriendsListRequest"
description: "PFFriendsClientGetFriendsListRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFFriendsClientGetFriendsListRequest  

PFFriendsClientGetFriendsListRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsClientGetFriendsListRequest {  
    uint32_t customTagsCount;  
    PFFriendsExternalFriendSources const* externalPlatformFriends;  
    bool const* includeFacebookFriends;  
    bool const* includeSteamFriends;  
    PFPlayerProfileViewConstraints const* profileConstraints;  
    const char* xboxToken;  
} PFFriendsClientGetFriendsListRequest;  
```
  
### Members  
  
**`customTagsCount`** &nbsp; uint32_t  
*array of size `customTagsCount`*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`externalPlatformFriends`** &nbsp; [PFFriendsExternalFriendSources](../enums/pffriendsexternalfriendsources.md) const*  
*may be nullptr*  
  
(Optional) Indicates which other platforms' friends should be included in the response. In HTTP, it is represented as a comma-separated list of platforms.
  
**`includeFacebookFriends`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates whether Facebook friends should be included in the response. Default is true.
  
**`includeSteamFriends`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Indicates whether Steam service friends should be included in the response. Default is true.
  
**`profileConstraints`** &nbsp; [PFPlayerProfileViewConstraints](../../pftypes/structs/pfplayerprofileviewconstraints.md) const*  
*may be nullptr*  
  
(Optional) If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
