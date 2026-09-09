---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkBattleNetAccountRequest"
description: "PFAccountManagementClientUnlinkBattleNetAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientUnlinkBattleNetAccountRequest  

PFAccountManagementClientUnlinkBattleNetAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementClientUnlinkBattleNetAccountRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
} PFAccountManagementClientUnlinkBattleNetAccountRequest;  
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

  
  
