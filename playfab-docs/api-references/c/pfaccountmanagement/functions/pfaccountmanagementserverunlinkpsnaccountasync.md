---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkPSNAccountAsync"
description: "Unlinks the related PlayStation :tm: Network account from the user's PlayFab account"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerUnlinkPSNAccountAsync  

Unlinks the related PlayStation :tm: Network account from the user's PlayFab account  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerUnlinkPSNAccountAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementServerUnlinkPSNAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementServerUnlinkPSNAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementserverunlinkpsnaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. See also ServerLinkPSNAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
