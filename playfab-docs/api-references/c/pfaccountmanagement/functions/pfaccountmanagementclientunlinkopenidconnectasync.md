---
author: jasonsandlin
title: "PFAccountManagementClientUnlinkOpenIdConnectAsync"
description: "Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship between a title and an Open ID Connect provider."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientUnlinkOpenIdConnectAsync  

Unlinks an OpenID Connect account from a user's PlayFab account, based on the connection ID of an existing relationship between a title and an Open ID Connect provider.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientUnlinkOpenIdConnectAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementUnlinkOpenIdConnectRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementUnlinkOpenIdConnectRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementunlinkopenidconnectrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. See also ClientLinkOpenIdConnectAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
