---
author: jasonsandlin
title: "PFAccountManagementLinkKongregateAccountRequest"
description: "PFAccountManagementLinkKongregateAccountRequest data model."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementLinkKongregateAccountRequest  

PFAccountManagementLinkKongregateAccountRequest data model.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementLinkKongregateAccountRequest {  
    const char* authTicket;  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    bool const* forceLink;  
    const char* kongregateId;  
} PFAccountManagementLinkKongregateAccountRequest;  
```
  
### Members  
  
**`authTicket`** &nbsp; const char*  
*is null-terminated*  
  
Valid session auth ticket issued by Kongregate.
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`forceLink`** &nbsp; bool const*  
*may be nullptr*  
  
(Optional) If another user is already linked to the account, unlink the other user and re-link.
  
**`kongregateId`** &nbsp; const char*  
*is null-terminated*  
  
Numeric user ID assigned by Kongregate.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
