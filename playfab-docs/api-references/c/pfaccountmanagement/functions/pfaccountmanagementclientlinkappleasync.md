---
author: jasonsandlin
title: "PFAccountManagementClientLinkAppleAsync"
description: "Links the Apple account associated with the token to the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientLinkAppleAsync  

Links the Apple account associated with the token to the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientLinkAppleAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementLinkAppleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementLinkAppleRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementlinkapplerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, iOS, and macOS. See also ClientLoginWithAppleAsync, ClientUnlinkAppleAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_APPLE_NOT_ENABLED_FOR_TITLE, E_PF_INVALID_IDENTITY_PROVIDER_ID, E_PF_LINKED_IDENTIFIER_ALREADY_CLAIMED, E_PF_TOKEN_SIGNING_KEY_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
