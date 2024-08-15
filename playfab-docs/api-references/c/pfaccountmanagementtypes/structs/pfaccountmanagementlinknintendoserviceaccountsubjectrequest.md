---
author: jasonsandlin
title: "PFAccountManagementLinkNintendoServiceAccountSubjectRequest"
description: "PFAccountManagementLinkNintendoServiceAccountSubjectRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkNintendoServiceAccountSubjectRequest  

PFAccountManagementLinkNintendoServiceAccountSubjectRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkNintendoServiceAccountSubjectRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* playFabId;  
    const char* subject;  
} PFAccountManagementLinkNintendoServiceAccountSubjectRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to a specific Nintendo Service Account, unlink the other user and re-link.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
**`subject`** &nbsp; const char*  
*is null-terminated*  
  
The Nintendo Service Account subject or id to link to the PlayFab user.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
