---
author: jasonsandlin
title: "PFAccountManagementClientLinkGoogleAccountAsync"
description: "Links the currently signed-in user account to their Google account, using their Google account credentials"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkGoogleAccountAsync  

Links the currently signed-in user account to their Google account, using their Google account credentials  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkGoogleAccountAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkGoogleAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkGoogleAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkgoogleaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, Android, and macOS. Google sign-in is accomplished by obtaining a Google OAuth 2.0 credential using the Google sign-in for Android APIs on the device and passing it to this API. See also ClientLoginWithGoogleAccountAsync, ClientUnlinkGoogleAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_ALREADY_LINKED, E_PF_GOOGLE_O_AUTH_ERROR, E_PF_GOOGLE_O_AUTH_NO_ID_TOKEN_INCLUDED_IN_RESPONSE, E_PF_GOOGLE_O_AUTH_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_GOOGLE_TOKEN, E_PF_LINKED_ACCOUNT_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
