---
author: jasonsandlin
title: "PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest"
description: "PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest  

PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* nintendoSwitchDeviceId;  
} PFAccountManagementClientLinkNintendoSwitchDeviceIdRequest;  
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
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
