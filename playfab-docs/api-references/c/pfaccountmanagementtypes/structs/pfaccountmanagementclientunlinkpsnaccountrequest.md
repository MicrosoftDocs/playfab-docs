---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkPSNAccountRequest"
description: "PFAccountManagementClientUnlinkPSNAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 07/25/2023
---

# PFAccountManagementClientUnlinkPSNAccountRequest  

PFAccountManagementClientUnlinkPSNAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientUnlinkPSNAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementClientUnlinkPSNAccountRequest;  
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

  
  
