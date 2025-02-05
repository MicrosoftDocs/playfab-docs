---
author: jasonsandlin
title: "PFAccountManagementBanInfo"
description: "PFAccountManagementBanInfo data model. Contains information for a ban."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/19/2024
---

# PFAccountManagementBanInfo  

PFAccountManagementBanInfo data model. Contains information for a ban.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementBanInfo {  
    bool active;  
    const char* banId;  
    time_t const* created;  
    time_t const* expires;  
    const char* IPAddress;  
    const char* playFabId;  
    const char* reason;  
    const char* userFamilyType;  
} PFAccountManagementBanInfo;  
```
  
### Members  
  
**`active`** &nbsp; bool  
  
The active state of this ban. Expired bans may still have this value set to true but they will have no effect.
  
**`banId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The unique Ban Id associated with this ban.
  
**`created`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time when this ban was applied.
  
**`expires`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The time when this ban expires. Permanent bans do not have expiration date.
  
**`IPAddress`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The IP address on which the ban was applied. May affect multiple players.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The reason why this ban was applied.
  
**`userFamilyType`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The family type of the suer that is included in the ban.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
