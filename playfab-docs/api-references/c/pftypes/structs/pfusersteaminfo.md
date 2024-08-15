---
author: jasonsandlin
title: "PFUserSteamInfo"
description: "PFUserSteamInfo data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUserSteamInfo  

PFUserSteamInfo data model.  

## Syntax  
  
```cpp
typedef struct PFUserSteamInfo {  
    PFTitleActivationStatus const* steamActivationStatus;  
    const char* steamCountry;  
    PFCurrency const* steamCurrency;  
    const char* steamId;  
    const char* steamName;  
} PFUserSteamInfo;  
```
  
### Members  
  
**`steamActivationStatus`** &nbsp; [PFTitleActivationStatus](../enums/pftitleactivationstatus.md) const*  
*may be nullptr*  
  
(Optional) What stage of game ownership the user is listed as being in, from Steam.
  
**`steamCountry`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The country in which the player resides, from Steam data.
  
**`steamCurrency`** &nbsp; [PFCurrency](../enums/pfcurrency.md) const*  
*may be nullptr*  
  
(Optional) Currency type set in the user Steam account.
  
**`steamId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Steam identifier.
  
**`steamName`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Steam display name.
  
  
## Requirements  
  
**Header:** PFTypes.h
  
## See also  
[PFTypes members](../pftypes_members.md)  

  
  
