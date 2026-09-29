---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkTwitchAsync"
description: "Unlinks the related Twitch account from the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientUnlinkTwitchAsync  

Unlinks the related Twitch account from the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUnlinkTwitchAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementClientUnlinkTwitchAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementClientUnlinkTwitchAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementclientunlinktwitchaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Linux and macOS. See also ClientLinkTwitchAsync, ClientLoginWithTwitchAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED, E_PF_FEATURE_NOT_CONFIGURED_FOR_TITLE, E_PF_INVALID_TWITCH_TOKEN or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
