---
author: jasonsandlin
title: "PFAccountManagementServerRevokeAllBansForUserAsync"
description: "Revoke all active bans for a user."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerRevokeAllBansForUserAsync  

Revoke all active bans for a user.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerRevokeAllBansForUserAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementRevokeAllBansForUserRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementRevokeAllBansForUserRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementrevokeallbansforuserrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Setting the active state of all non-expired bans for a user to Inactive. Expired bans with an Active state will be ignored, however. Returns information about applied updates only. See also ServerBanUsersAsync, ServerGetUserBansAsync, ServerRevokeBansAsync, ServerUpdateBansAsync. When the asynchronous task is complete, call [PFAccountManagementServerRevokeAllBansForUserGetResultSize](pfaccountmanagementserverrevokeallbansforusergetresultsize.md) and [PFAccountManagementServerRevokeAllBansForUserGetResult](pfaccountmanagementserverrevokeallbansforusergetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
