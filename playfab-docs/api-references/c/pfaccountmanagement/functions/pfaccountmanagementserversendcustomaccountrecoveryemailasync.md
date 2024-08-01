---
author: jasonsandlin
title: "PFAccountManagementServerSendCustomAccountRecoveryEmailAsync"
description: "Forces an email to be sent to the registered contact email address for the user's account based on an account recovery email template"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerSendCustomAccountRecoveryEmailAsync  

Forces an email to be sent to the registered contact email address for the user's account based on an account recovery email template  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerSendCustomAccountRecoveryEmailAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementSendCustomAccountRecoveryEmailRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementSendCustomAccountRecoveryEmailRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementsendcustomaccountrecoveryemailrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. PlayFab accounts which have valid email address or username will be able to receive a password reset email using this API.The email sent must be an account recovery email template. The username or email can be passed in to send the email. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_EMAIL_CLIENT_CANCELED_TASK, E_PF_EMAIL_CLIENT_TIMEOUT, E_PF_EMAIL_MESSAGE_TO_ADDRESS_IS_MISSING, E_PF_EMAIL_TEMPLATE_MISSING, E_PF_NO_CONTACT_EMAIL_ADDRESS_FOUND, E_PF_SMTP_ADDON_NOT_ENABLED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
