---
author: jasonsandlin
title: "Services C API overview - PFFriendsTypes.h"
description: "Services C API overview - PFFriendsTypes.h"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# Services C API overview - PFFriendsTypes.h

  
## Structures  

| Structure | Description |  
| --- | --- |  
| [PFFriendsAddFriendResult](structs/pffriendsaddfriendresult.md) | PFFriendsAddFriendResult data model. |  
| [PFFriendsClientAddFriendRequest](structs/pffriendsclientaddfriendrequest.md) | PFFriendsClientAddFriendRequest data model. |  
| [PFFriendsClientGetFriendsListRequest](structs/pffriendsclientgetfriendslistrequest.md) | PFFriendsClientGetFriendsListRequest data model. |  
| [PFFriendsClientRemoveFriendRequest](structs/pffriendsclientremovefriendrequest.md) | PFFriendsClientRemoveFriendRequest data model. |  
| [PFFriendsClientSetFriendTagsRequest](structs/pffriendsclientsetfriendtagsrequest.md) | PFFriendsClientSetFriendTagsRequest data model. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error. |  
| [PFFriendsFriendInfo](structs/pffriendsfriendinfo.md) | PFFriendsFriendInfo data model. |  
| [PFFriendsGetFriendsListResult](structs/pffriendsgetfriendslistresult.md) | PFFriendsGetFriendsListResult data model. If any additional services are queried for the user's friends, those friends who also have a PlayFab account registered for the title will be returned in the results. For Facebook, user has to have logged into the title's Facebook app recently, and only friends who also plays this game will be included. For Xbox Live, user has to have logged into the Xbox Live recently, and only friends who also play this game will be included. |  
| [PFFriendsServerAddFriendRequest](structs/pffriendsserveraddfriendrequest.md) | PFFriendsServerAddFriendRequest data model. |  
| [PFFriendsServerGetFriendsListRequest](structs/pffriendsservergetfriendslistrequest.md) | PFFriendsServerGetFriendsListRequest data model. |  
| [PFFriendsServerRemoveFriendRequest](structs/pffriendsserverremovefriendrequest.md) | PFFriendsServerRemoveFriendRequest data model. |  
| [PFFriendsServerSetFriendTagsRequest](structs/pffriendsserversetfriendtagsrequest.md) | PFFriendsServerSetFriendTagsRequest data model. This operation is not additive. It will completely replace the tag list for the specified user. Please note that only users in the PlayFab friends list can be assigned tags. Attempting to set a tag on a friend only included in the friends list from a social site integration (such as Facebook or Steam) will return the AccountNotFound error. |  
  
## State changes  
  
| State change | Description |  
| --- | --- |  
  
## Enumerations  

| Enumeration | Description |  
| --- | --- |  
| [PFFriendsExternalFriendSources](enums/pffriendsexternalfriendsources.md) | ExternalFriendSources enum.|  
