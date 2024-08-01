---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest"
description: "PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest  

PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* nintendoSwitchDeviceId;  
} PFAccountManagementClientUnlinkNintendoSwitchDeviceIdRequest;  
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
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
