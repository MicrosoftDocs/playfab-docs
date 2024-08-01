---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest"
description: "PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest  

PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* nintendoSwitchDeviceId;  
    const char* playFabId;  
} PFAccountManagementServerUnlinkNintendoSwitchDeviceIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`nintendoSwitchDeviceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Nintendo Switch Device identifier for the user. If not specified, the most recently signed in device ID will be used.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
