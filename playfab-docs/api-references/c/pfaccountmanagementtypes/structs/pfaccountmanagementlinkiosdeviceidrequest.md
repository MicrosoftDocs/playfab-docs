---
author: jasonsandlin
title: "PFAccountManagementLinkIOSDeviceIDRequest"
description: "PFAccountManagementLinkIOSDeviceIDRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkIOSDeviceIDRequest  

PFAccountManagementLinkIOSDeviceIDRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkIOSDeviceIDRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* deviceId;  
    const char* deviceModel;  
    bool const* forceLink;  
    const char* OS;  
} PFAccountManagementLinkIOSDeviceIDRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`deviceId`** &nbsp; const char*  
*is null-terminated*  
  
Vendor-specific iOS identifier for the user's device.
  
**`deviceModel`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Specific model of the user's device.
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the device, unlink the other user and re-link.
  
**`OS`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Specific Operating System version for the user's device.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
