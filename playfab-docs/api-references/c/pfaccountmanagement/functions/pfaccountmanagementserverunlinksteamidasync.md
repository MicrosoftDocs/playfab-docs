---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkSteamIdAsync"
description: "Unlinks the Steam account associated with the provided Steam ID to the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUnlinkSteamIdAsync  

Unlinks the Steam account associated with the provided Steam ID to the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerUnlinkSteamIdAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementUnlinkSteamIdRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementUnlinkSteamIdRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementunlinksteamidrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerLinkSteamIdAsync, ServerLoginWithSteamIdAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
