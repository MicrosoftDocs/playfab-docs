---
author: jasonsandlin
title: "PFLeaderboardsGetFriendLeaderboardForEntityRequest"
description: "PFLeaderboardsGetFriendLeaderboardForEntityRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/20/2026
---

# PFLeaderboardsGetFriendLeaderboardForEntityRequest  

PFLeaderboardsGetFriendLeaderboardForEntityRequest data model.  

## Syntax  
  
```cpp
typedef struct PFLeaderboardsGetFriendLeaderboardForEntityRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    PFEntityKey const* entity;  
    PFExternalFriendSources const* externalFriendSources;  
    const char* leaderboardName;  
    uint32_t const* version;  
    const char* xboxToken;  
} PFLeaderboardsGetFriendLeaderboardForEntityRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`entity`** &nbsp; [PFEntityKey](../../pftypes/structs/pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) The optional entity to perform this action on. Defaults to the currently logged in entity.
  
**`externalFriendSources`** &nbsp; [PFExternalFriendSources](../enums/pfexternalfriendsources.md) const*  
*may be nullptr*  
  
(Optional) Indicates which other platforms' friends should be included in the response. In HTTP, it is represented as a comma-separated list of platforms.
  
**`leaderboardName`** &nbsp; const char*  
*is null-terminated*  
  
Name of the leaderboard.
  
**`version`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) Optional version of the leaderboard, defaults to current version.
  
**`xboxToken`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) XBOX token if XBOX friends should be included. Requires XBOX be configured on PlayFab.
  
  
## Requirements  
  
**Header:** PFLeaderboardsTypes.h
  
## See also  
[PFLeaderboardsTypes members](../pfleaderboardstypes_members.md)  

  
  
