---
author: jasonsandlin
title: "PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest"
description: "PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest  

PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* nintendoSwitchDeviceId;  
    const char* playFabId;  
} PFAccountManagementServerLinkNintendoSwitchDeviceIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the Nintendo Switch Device ID, unlink the other user and re-link.
  
**`nintendoSwitchDeviceId`** &nbsp; const char*  
*is null-terminated*  
  
Nintendo Switch unique identifier for the user's device.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
