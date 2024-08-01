---
author: jasonsandlin
title: "PFAccountManagementLinkServerCustomIdRequest"
description: "PFAccountManagementLinkServerCustomIdRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkServerCustomIdRequest  

PFAccountManagementLinkServerCustomIdRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkServerCustomIdRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* playFabId;  
    const char* serverCustomId;  
} PFAccountManagementLinkServerCustomIdRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the custom ID, unlink the other user and re-link.
  
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

  
  
