---
author: jasonsandlin
title: "PFAccountManagementAddOrUpdateContactEmailRequest"
description: "PFAccountManagementAddOrUpdateContactEmailRequest data model. This API adds a contact email to the player's profile. If the player's profile already contains a contact email, it will update the contact email to the email address specified."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementAddOrUpdateContactEmailRequest  

PFAccountManagementAddOrUpdateContactEmailRequest data model. This API adds a contact email to the player's profile. If the player's profile already contains a contact email, it will update the contact email to the email address specified.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementAddOrUpdateContactEmailRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* emailAddress;  
} PFAccountManagementAddOrUpdateContactEmailRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`emailAddress`** &nbsp; const char*  
*is null-terminated*  
  
The new contact email to associate with the player.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
