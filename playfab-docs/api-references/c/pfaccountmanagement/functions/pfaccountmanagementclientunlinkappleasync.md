---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkAppleAsync"
description: "Unlinks the related Apple account from the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUnlinkAppleAsync  

Unlinks the related Apple account from the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUnlinkAppleAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementUnlinkAppleRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementUnlinkAppleRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementunlinkapplerequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, iOS, and macOS. See also ClientLinkAppleAsync, ClientLoginWithAppleAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED, E_PF_APPLE_NOT_ENABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
