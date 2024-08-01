---
author: jasonsandlin
title: "PFAccountManagementUnlinkAppleRequest"
description: "PFAccountManagementUnlinkAppleRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkAppleRequest  

PFAccountManagementUnlinkAppleRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkAppleRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementUnlinkAppleRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
