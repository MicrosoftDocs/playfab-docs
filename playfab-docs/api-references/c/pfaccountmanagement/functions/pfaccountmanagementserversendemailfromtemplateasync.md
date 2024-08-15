---
author: jasonsandlin
title: "PFAccountManagementServerSendEmailFromTemplateAsync"
description: "Sends an email based on an email template to a player's contact email"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerSendEmailFromTemplateAsync  

Sends an email based on an email template to a player's contact email  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerSendEmailFromTemplateAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementSendEmailFromTemplateRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementSendEmailFromTemplateRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementsendemailfromtemplaterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Sends an email for only players that have contact emails associated with them. Takes in an email template ID specifyingthe email template to send. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_EMAIL_CLIENT_CANCELED_TASK, E_PF_EMAIL_CLIENT_TIMEOUT, E_PF_EMAIL_TEMPLATE_MISSING, E_PF_NO_CONTACT_EMAIL_ADDRESS_FOUND, E_PF_SMTP_ADDON_NOT_ENABLED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
