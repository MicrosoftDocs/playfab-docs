---
author: jasonsandlin
title: "PFAccountManagementClientSendAccountRecoveryEmailAsync"
description: "Forces an email to be sent to the registered email address for the user's account, with a link allowing the user to change the password.If an account recovery email template ID is provided, an email using the custom email template will be used."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientSendAccountRecoveryEmailAsync  

Forces an email to be sent to the registered email address for the user's account, with a link allowing the user to change the password.If an account recovery email template ID is provided, an email using the custom email template will be used.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientSendAccountRecoveryEmailAsync(  
    PFServiceConfigHandle serviceConfigHandle,  
    const PFAccountManagementSendAccountRecoveryEmailRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`serviceConfigHandle`** &nbsp; PFServiceConfigHandle  
  
PFServiceConfigHandle returned from PFServiceConfigCreateHandle call.  
  
**`request`** &nbsp; [PFAccountManagementSendAccountRecoveryEmailRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementsendaccountrecoveryemailrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. If the account in question is a 'temporary' account (for example, one that was created via a call to LoginFromIOSDeviceID), thisfunction will have no effect. Only PlayFab accounts which have valid email addresses will be able to receive a password reset email using this API. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_EMAIL_RECIPIENT_BLACKLISTED, E_PF_INVALID_EMAIL_ADDRESS, E_PF_NO_CONTACT_EMAIL_ADDRESS_FOUND, E_PF_SMTP_ADDON_NOT_ENABLED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
