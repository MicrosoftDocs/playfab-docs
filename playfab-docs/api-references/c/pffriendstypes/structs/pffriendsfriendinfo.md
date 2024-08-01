---
author: jasonsandlin
title: "PFFriendsFriendInfo"
description: "PFFriendsFriendInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFFriendsFriendInfo  

PFFriendsFriendInfo data model.  

## Syntax  
  
```cpp
typedef struct PFFriendsFriendInfo {  
    PFUserFacebookInfo const* facebookInfo;  
    const char* friendPlayFabId;  
    PFUserGameCenterInfo const* gameCenterInfo;  
    PFPlayerProfileModel const* profile;  
    PFUserPsnInfo const* PSNInfo;  
    PFUserSteamInfo const* steamInfo;  
    const char* const* tags;  
    uint32_t tagsCount;  
    const char* titleDisplayName;  
    const char* username;  
    PFUserXboxInfo const* xboxInfo;  
} PFFriendsFriendInfo;  
```
  
### Members  
  
**`facebookInfo`** &nbsp; [PFUserFacebookInfo](../../pftypes/structs/pfuserfacebookinfo.md) const*  
*may be nullptr*  
  
(Optional) Available Facebook information (if the user and PlayFab friend are also connected in Facebook).
  
**`friendPlayFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique identifier for this friend.
  
**`gameCenterInfo`** &nbsp; [PFUserGameCenterInfo](../../pftypes/structs/pfusergamecenterinfo.md) const*  
*may be nullptr*  
  
(Optional) Available Game Center information (if the user and PlayFab friend are also connected in Game Center).
  
**`profile`** &nbsp; [PFPlayerProfileModel](../../pftypes/structs/pfplayerprofilemodel.md) const*  
*may be nullptr*  
  
(Optional) The profile of the user, if requested.
  
**`PSNInfo`** &nbsp; [PFUserPsnInfo](../../pftypes/structs/pfuserpsninfo.md) const*  
*may be nullptr*  
  
(Optional) Available PlayStation :tm: Network information, if the user and PlayFab friend are both connected to PlayStation :tm: Network.
  
**`steamInfo`** &nbsp; [PFUserSteamInfo](../../pftypes/structs/pfusersteaminfo.md) const*  
*may be nullptr*  
  
(Optional) Available Steam information (if the user and PlayFab friend are also connected in Steam).
  
**`tags`** &nbsp; const char* const*  
*may be nullptr*  
  
(Optional) Tags which have been associated with this friend.
  
**`tagsCount`** &nbsp; uint32_t  
  
Count of tags
  
**`titleDisplayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Title-specific display name for this friend.
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) PlayFab unique username for this friend.
  
**`xboxInfo`** &nbsp; [PFUserXboxInfo](../../pftypes/structs/pfuserxboxinfo.md) const*  
*may be nullptr*  
  
(Optional) Available Xbox information, if the user and PlayFab friend are both connected to Xbox Live.
  
  
## Requirements  
  
**Header:** PFFriendsTypes.h
  
## See also  
[PFFriendsTypes members](../pffriendstypes_members.md)  

  
  
