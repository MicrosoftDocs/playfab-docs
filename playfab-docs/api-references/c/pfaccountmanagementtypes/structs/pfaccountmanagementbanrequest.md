---
author: jasonsandlin
title: "PFAccountManagementBanRequest"
description: "PFAccountManagementBanRequest data model. Represents a single ban request."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementBanRequest  

PFAccountManagementBanRequest data model. Represents a single ban request.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementBanRequest {  
    uint32_t const* durationInHours;  
    const char* IPAddress;  
    const char* playFabId;  
    const char* reason;  
} PFAccountManagementBanRequest;  
```
  
### Members  
  
**`durationInHours`** &nbsp; uint32_t const*  
*may be nullptr*  
  
(Optional) The duration in hours for the ban. Leave this blank for a permanent ban.
  
**`IPAddress`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) IP address to be banned. May affect multiple players.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The reason for this ban. Maximum 140 characters.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
