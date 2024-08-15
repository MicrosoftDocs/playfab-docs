---
author: jasonsandlin
title: "PFAccountManagementSendAccountRecoveryEmailRequest"
description: "PFAccountManagementSendAccountRecoveryEmailRequest data model. If the account in question is a \"temporary\" account (for example, one that was created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. Only PlayFab accounts which have valid email addresses will be able to receive a password reset email using this API."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementSendAccountRecoveryEmailRequest  

PFAccountManagementSendAccountRecoveryEmailRequest data model. If the account in question is a "temporary" account (for example, one that was created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. Only PlayFab accounts which have valid email addresses will be able to receive a password reset email using this API.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSendAccountRecoveryEmailRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* email;  
    const char* emailTemplateId;  
    const char* titleId;  
} PFAccountManagementSendAccountRecoveryEmailRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`email`** &nbsp; const char*  
*is null-terminated*  
  
User email address attached to their account.
  
**`emailTemplateId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The email template id of the account recovery email template to send.
  
**`titleId`** &nbsp; const char*  
*is null-terminated*  
  
Unique identifier for the title, found in the Settings&gt; Game Properties section of the PlayFab developer site when a title has been selected.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
