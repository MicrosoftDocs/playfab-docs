---
author: jasonsandlin
title: "PFAccountManagementUnlinkServerCustomIdRequest"
description: "PFAccountManagementUnlinkServerCustomIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementUnlinkServerCustomIdRequest  

PFAccountManagementUnlinkServerCustomIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementUnlinkServerCustomIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* playFabId;  
    const char* serverCustomId;  
} PFAccountManagementUnlinkServerCustomIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab identifier.
  
**`serverCustomId`** &nbsp; const char*  
*is null-terminated*  
  
Unique server custom identifier for this player.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
