---
author: jasonsandlin
title: "PFAccountManagementSendEmailFromTemplateRequest"
description: "PFAccountManagementSendEmailFromTemplateRequest data model. Sends an email for only players that have contact emails associated with them. Takes in an email template ID specifyingthe email template to send."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementSendEmailFromTemplateRequest  

PFAccountManagementSendEmailFromTemplateRequest data model. Sends an email for only players that have contact emails associated with them. Takes in an email template ID specifyingthe email template to send.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSendEmailFromTemplateRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* emailTemplateId;  
    const char* playFabId;  
} PFAccountManagementSendEmailFromTemplateRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`emailTemplateId`** &nbsp; const char*  
*is null-terminated*  
  
The email template id of the email template to send.
  
**`playFabId`** &nbsp; const char*  
*is null-terminated*  
  
Unique PlayFab assigned ID of the user on whom the operation will be performed.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
