---
author: jasonsandlin
title: "PFUserTitleInfo"
description: "PFUserTitleInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserTitleInfo  

PFUserTitleInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserTitleInfo {  
    const char* avatarUrl;  
    time_t created;  
    const char* displayName;  
    time_t const* firstLogin;  
    bool const* isBanned;  
    time_t const* lastLogin;  
    PFUserOrigination const* origination;  
    PFEntityKey const* titlePlayerAccount;  
} PFUserTitleInfo;  
```
  
### Members  
  
**`avatarUrl`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) URL to the player's avatar.
  
**`created`** &nbsp; time_t  
  
Timestamp indicating when the user was first associated with this game (this can differ significantly from when the user first registered with PlayFab).
  
**`displayName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Name of the user, as it is displayed in-game.
  
**`firstLogin`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Timestamp indicating when the user first signed into this game (this can differ from the Created timestamp, as other events, such as issuing a beta key to the user, can associate the title to the user).
  
**`isBanned`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Boolean indicating whether or not the user is currently banned for a title.
  
**`lastLogin`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) Timestamp for the last user login for this title.
  
**`origination`** &nbsp; [PFUserOrigination](../enums/pfuserorigination.md) const*  
*may be nullptr*  
  
(Optional) Source by which the user first joined the game, if known.
  
**`titlePlayerAccount`** &nbsp; [PFEntityKey](pfentitykey-c.md) const*  
*may be nullptr*  
  
(Optional) Title player account entity for this user.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
