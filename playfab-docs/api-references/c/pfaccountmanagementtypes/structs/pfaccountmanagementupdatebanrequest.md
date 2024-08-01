---
author: jasonsandlin
title: "PFAccountManagementUpdateBanRequest"
description: "PFAccountManagementUpdateBanRequest data model. Represents a single update ban request."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUpdateBanRequest  

PFAccountManagementUpdateBanRequest data model. Represents a single update ban request.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUpdateBanRequest {  
    bool const* active;  
    const char* banId;  
    time_t const* expires;  
    const char* IPAddress;  
    bool const* permanent;  
    const char* reason;  
} PFAccountManagementUpdateBanRequest;  
```
  
### Members  
  
**`active`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) The updated active state for the ban. Null for no change.
  
**`banId`** &nbsp; const char*  
*is null-terminated*  
  
The id of the ban to be updated.
  
**`expires`** &nbsp; time_t const*  
*may be nullptr*  
  
(Optional) The updated expiration date for the ban. Null for no change.
  
**`IPAddress`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The updated IP address for the ban. Null for no change.
  
**`permanent`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) Whether to make this ban permanent. Set to true to make this ban permanent. This will not modify Active state.
  
**`reason`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The updated reason for the ban to be updated. Maximum 140 characters. Null for no change.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
