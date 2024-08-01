---
author: jasonsandlin
title: "PFAccountManagementLinkAndroidDeviceIDRequest"
description: "PFAccountManagementLinkAndroidDeviceIDRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkAndroidDeviceIDRequest  

PFAccountManagementLinkAndroidDeviceIDRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkAndroidDeviceIDRequest {  
    const char* androidDevice;  
    const char* androidDeviceId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* OS;  
} PFAccountManagementLinkAndroidDeviceIDRequest;  
```
  
### Members  
  
**`androidDevice`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Specific model of the user's device.
  
**`androidDeviceId`** &nbsp; const char*  
*is null-terminated*  
  
Android device identifier for the user's device.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
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

  
  
