---
author: jasonsandlin
title: "PFAccountManagementUnlinkIOSDeviceIDRequest"
description: "PFAccountManagementUnlinkIOSDeviceIDRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkIOSDeviceIDRequest  

PFAccountManagementUnlinkIOSDeviceIDRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkIOSDeviceIDRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* deviceId;  
} PFAccountManagementUnlinkIOSDeviceIDRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`deviceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Vendor-specific iOS identifier for the user's device. If not specified, the most recently signed in iOS Device ID will be used.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
