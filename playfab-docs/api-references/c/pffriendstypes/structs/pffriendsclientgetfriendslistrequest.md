---
author: jasonsandlin
title: "PFFriendsClientGetFriendsListRequest"
description: "PFFriendsClientGetFriendsListRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsClientGetFriendsListRequest  

PFFriendsClientGetFriendsListRequest data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsClientGetFriendsListRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFFriendsExternalFriendSources const* externalPlatformFriends;  
    PFPlayerProfileViewConstraints const* profileConstraints;  
    HC_PLATFORM user;  
    const char* xboxToken;  
} PFFriendsClientGetFriendsListRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`externalPlatformFriends`** &nbsp; [PFFriendsExternalFriendSources](../enums/pffriendsexternalfriendsources.md) const*  
*may be nullptr*  
  
(Optional) Indicates which other platforms' friends should be included in the response. In HTTP, it is represented as a comma-separated list of platforms.
  
**`profileConstraints`** &nbsp; [PFPlayerProfileViewConstraints](../../pftypes/structs/pfplayerprofileviewconstraints.md) const*  
*may be nullptr*  
  
(Optional) If non-null, this determines which properties of the resulting player profiles to return. For API calls from the client, only the allowed client profile properties for the title may be requested. These allowed properties are configured in the Game Manager "Client Profile Options" tab in the "Settings" section.
  
**`user`** &nbsp; HC_PLATFORM  
  
TBD  
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Xbox token if Xbox friends should be included. Requires Xbox be configured on PlayFab.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
