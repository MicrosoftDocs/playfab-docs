---
author: jasonsandlin
title: "PFAccountManagementUnlinkAndroidDeviceIDRequest"
description: "PFAccountManagementUnlinkAndroidDeviceIDRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkAndroidDeviceIDRequest  

PFAccountManagementUnlinkAndroidDeviceIDRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkAndroidDeviceIDRequest {  
    const char* androidDeviceId;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementUnlinkAndroidDeviceIDRequest;  
```
  
### Members  
  
**`androidDeviceId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) Android device identifier for the user's device. If not specified, the most recently signed in Android Device ID will be used.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
