---
author: jasonsandlin
title: "PFUserAccountInfo"
description: "PFUserAccountInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserAccountInfo  

PFUserAccountInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserAccountInfo {  
    PFUserAndroidDeviceInfo const* androidDeviceInfo;  
    PFUserAppleIdInfo const* appleAccountInfo;  
    time_t created;  
    PFUserCustomIdInfo const* customIdInfo;  
    PFUserFacebookInfo const* facebookInfo;  
    PFUserFacebookInstantGamesIdInfo const* facebookInstantGamesIdInfo;  
    PFUserGameCenterInfo const* gameCenterInfo;  
    PFUserGoogleInfo const* googleInfo;  
    PFUserGooglePlayGamesInfo const* googlePlayGamesInfo;  
    PFUserIosDeviceInfo const* iosDeviceInfo;  
    PFUserKongregateInfo const* kongregateInfo;  
    PFUserNintendoSwitchAccountIdInfo const* nintendoSwitchAccountInfo;  
    PFUserNintendoSwitchDeviceIdInfo const* nintendoSwitchDeviceIdInfo;  
    PFUserOpenIdInfo const* openIdInfo;  
    uint32_t openIdInfoCount;  
    const char* playFabId;  
    PFUserPrivateAccountInfo const* privateInfo;  
    PFUserPsnInfo const* psnInfo;  
    PFUserServerCustomIdInfo const* serverCustomIdInfo;  
    PFUserSteamInfo const* steamInfo;  
    PFUserTitleInfo const* titleInfo;  
    PFUserTwitchInfo const* twitchInfo;  
    const char* username;  
    PFUserXboxInfo const* xboxInfo;  
} PFUserAccountInfo;  
```
  
### Members  
  
**`androidDeviceInfo`** &nbsp; [PFUserAndroidDeviceInfo](pfuserandroiddeviceinfo.md) const*  
*may be nullptr*  
  
(Optional) User Android device information, if an Android device has been linked.
  
**`appleAccountInfo`** &nbsp; [PFUserAppleIdInfo](pfuserappleidinfo.md) const*  
*may be nullptr*  
  
(Optional) Sign in with Apple account information, if an Apple account has been linked.
  
**`created`** &nbsp; time_t  
  
Timestamp indicating when the user account was created.
  
**`customIdInfo`** &nbsp; [PFUserCustomIdInfo](pfusercustomidinfo.md) const*  
*may be nullptr*  
  
(Optional) Custom ID information, if a custom ID has been assigned.
  
**`facebookInfo`** &nbsp; [PFUserFacebookInfo](pfuserfacebookinfo.md) const*  
*may be nullptr*  
  
(Optional) User Facebook information, if a Facebook account has been linked.
  
**`facebookInstantGamesIdInfo`** &nbsp; [PFUserFacebookInstantGamesIdInfo](pfuserfacebookinstantgamesidinfo.md) const*  
*may be nullptr*  
  
(Optional) Facebook Instant Games account information, if a Facebook Instant Games account has been linked.
  
**`gameCenterInfo`** &nbsp; [PFUserGameCenterInfo](pfusergamecenterinfo.md) const*  
*may be nullptr*  
  
(Optional) User Gamecenter information, if a Gamecenter account has been linked.
  
**`googleInfo`** &nbsp; [PFUserGoogleInfo](pfusergoogleinfo.md) const*  
*may be nullptr*  
  
(Optional) User Google account information, if a Google account has been linked.
  
**`googlePlayGamesInfo`** &nbsp; [PFUserGooglePlayGamesInfo](pfusergoogleplaygamesinfo.md) const*  
*may be nullptr*  
  
(Optional) User Google Play Games account information, if a Google Play Games account has been linked.
  
**`iosDeviceInfo`** &nbsp; [PFUserIosDeviceInfo](pfuseriosdeviceinfo.md) const*  
*may be nullptr*  
  
(Optional) User iOS device information, if an iOS device has been linked.
  
**`kongregateInfo`** &nbsp; [PFUserKongregateInfo](pfuserkongregateinfo.md) const*  
*may be nullptr*  
  
(Optional) User Kongregate account information, if a Kongregate account has been linked.
  
**`nintendoSwitchAccountInfo`** &nbsp; [PFUserNintendoSwitchAccountIdInfo](pfusernintendoswitchaccountidinfo.md) const*  
*may be nullptr*  
  
(Optional) Nintendo Switch account information, if a Nintendo Switch account has been linked.
  
**`nintendoSwitchDeviceIdInfo`** &nbsp; [PFUserNintendoSwitchDeviceIdInfo](pfusernintendoswitchdeviceidinfo.md) const*  
*may be nullptr*  
  
(Optional) Nintendo Switch device information, if a Nintendo Switch device has been linked.
  
**`openIdInfo`** &nbsp; [PFUserOpenIdInfo](pfuseropenidinfo.md) const*  
*may be nullptr*  
  
(Optional) OpenID Connect information, if any OpenID Connect accounts have been linked.
  
**`openIdInfoCount`** &nbsp; uint32_t  
  
Count of openIdInfo
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique identifier for the user account.
  
**`privateInfo`** &nbsp; [PFUserPrivateAccountInfo](pfuserprivateaccountinfo.md) const*  
*may be nullptr*  
  
(Optional) Personal information for the user which is considered more sensitive.
  
**`psnInfo`** &nbsp; [PFUserPsnInfo](pfuserpsninfo.md) const*  
*may be nullptr*  
  
(Optional) User PlayStation :tm: Network account information, if a PlayStation :tm: Network account has been linked.
  
**`serverCustomIdInfo`** &nbsp; [PFUserServerCustomIdInfo](pfuserservercustomidinfo.md) const*  
*may be nullptr*  
  
(Optional) Server Custom ID information, if a server custom ID has been assigned.
  
**`steamInfo`** &nbsp; [PFUserSteamInfo](pfusersteaminfo.md) const*  
*may be nullptr*  
  
(Optional) User Steam information, if a Steam account has been linked.
  
**`titleInfo`** &nbsp; [PFUserTitleInfo](pfusertitleinfo.md) const*  
*may be nullptr*  
  
(Optional) Title-specific information for the user account.
  
**`twitchInfo`** &nbsp; [PFUserTwitchInfo](pfusertwitchinfo.md) const*  
*may be nullptr*  
  
(Optional) User Twitch account information, if a Twitch account has been linked.
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) User account name in the PlayFab service.
  
**`xboxInfo`** &nbsp; [PFUserXboxInfo](pfuserxboxinfo.md) const*  
*may be nullptr*  
  
(Optional) User XBox account information, if a XBox account has been linked.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
