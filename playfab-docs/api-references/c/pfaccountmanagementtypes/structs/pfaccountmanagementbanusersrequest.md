---
author: jasonsandlin
title: "PFAccountManagementBanUsersRequest"
description: "PFAccountManagementBanUsersRequest data model. The existence of each user will not be verified. When banning by IP or MAC address, multiple players may be affected, so use this feature with caution. Returns information about the new bans."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementBanUsersRequest  

PFAccountManagementBanUsersRequest data model. The existence of each user will not be verified. When banning by IP or MAC address, multiple players may be affected, so use this feature with caution. Returns information about the new bans.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementBanUsersRequest {  
    PFAccountManagementBanRequest const* bans;  
    uint32_t bansCount;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementBanUsersRequest;  
```
  
### Members  
  
**`bans`** &nbsp; [PFAccountManagementBanRequest](pfaccountmanagementbanrequest.md) const*  
  
List of ban requests to be applied. Maximum 100.
  
**`bansCount`** &nbsp; uint32_t  
  
Count of bans
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
