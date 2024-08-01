---
author: jasonsandlin
title: "PFUserTwitchInfo"
description: "PFUserTwitchInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserTwitchInfo  

PFUserTwitchInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserTwitchInfo {  
    const char* twitchId;  
    const char* twitchUserName;  
} PFUserTwitchInfo;  
```
  
### Members  
  
**`twitchId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Twitch ID.
  
**`twitchUserName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Twitch Username.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
