---
author: jasonsandlin
title: "PFAccountManagementServerRevokeBansAsync"
description: "Revoke all active bans specified with BanId."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerRevokeBansAsync  

Revoke all active bans specified with BanId.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerRevokeBansAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementRevokeBansRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementRevokeBansRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementrevokebansrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Setting the active state of all bans requested to Inactive regardless of whether that ban has already expired. BanIds that do not exist will be skipped. Returns information about applied updates only. See also ServerBanUsersAsync, ServerGetUserBansAsync, ServerRevokeAllBansForUserAsync, ServerUpdateBansAsync. When the asynchronous task is complete, call [PFAccountManagementServerRevokeBansGetResultSize](pfaccountmanagementserverrevokebansgetresultsize.md) and [PFAccountManagementServerRevokeBansGetResult](pfaccountmanagementserverrevokebansgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
