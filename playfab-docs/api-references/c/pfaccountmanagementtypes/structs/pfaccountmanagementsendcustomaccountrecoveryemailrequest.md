---
author: jasonsandlin
title: "PFAccountManagementSendCustomAccountRecoveryEmailRequest"
description: "PFAccountManagementSendCustomAccountRecoveryEmailRequest data model. PlayFab accounts which have valid email address or username will be able to receive a password reset email using this API.The email sent must be an account recovery email template. The username or email can be passed in to send the email."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementSendCustomAccountRecoveryEmailRequest  

PFAccountManagementSendCustomAccountRecoveryEmailRequest data model. PlayFab accounts which have valid email address or username will be able to receive a password reset email using this API.The email sent must be an account recovery email template. The username or email can be passed in to send the email.  

## Syntax  
  
```cpp
typedef struct PFAccountManagementSendCustomAccountRecoveryEmailRequest {  
    PFStringDictionaryEntry const* customTags;  
    uint32_t customTagsCount;  
    const char* email;  
    const char* emailTemplateId;  
    const char* username;  
} PFAccountManagementSendCustomAccountRecoveryEmailRequest;  
```
  
### Members  
  
**`customTags`** &nbsp; [PFStringDictionaryEntry](../../pftypes/structs/pfstringdictionaryentry.md) const*  
*may be nullptr*  
  
(Optional) The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
  
**`customTagsCount`** &nbsp; uint32_t  
  
Count of customTags
  
**`email`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) User email address attached to their account.
  
**`emailTemplateId`** &nbsp; const char*  
*is null-terminated*  
  
The email template id of the account recovery email template to send.
  
**`username`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The user's username requesting an account recovery.
  
  
## Requirements  
  
**Header:** PFAccountManagementTypes.h
  
## See also  
[PFAccountManagementTypes members](../pfaccountmanagementtypes_members.md)  

  
  
