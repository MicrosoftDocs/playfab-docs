---
author: jasonsandlin
title: "PFUserGooglePlayGamesInfo"
description: "PFUserGooglePlayGamesInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserGooglePlayGamesInfo  

PFUserGooglePlayGamesInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserGooglePlayGamesInfo {  
    const char* googlePlayGamesPlayerAvatarImageUrl;  
    const char* googlePlayGamesPlayerDisplayName;  
    const char* googlePlayGamesPlayerId;  
} PFUserGooglePlayGamesInfo;  
```
  
### Members  
  
**`googlePlayGamesPlayerAvatarImageUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Avatar image url of the Google Play Games player.
  
**`googlePlayGamesPlayerDisplayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Display name of the Google Play Games player.
  
**`googlePlayGamesPlayerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Google Play Games player ID.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
