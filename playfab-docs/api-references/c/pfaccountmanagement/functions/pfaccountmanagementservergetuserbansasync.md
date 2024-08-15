---
author: jasonsandlin
title: "PFAccountManagementServerGetUserBansAsync"
description: "Gets all bans for a user."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetUserBansAsync  

Gets all bans for a user.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetUserBansAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetUserBansRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetUserBansRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetuserbansrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Get all bans for a user, including inactive and expired bans. See also ServerBanUsersAsync, ServerRevokeAllBansForUserAsync, ServerRevokeBansAsync, ServerUpdateBansAsync. When the asynchronous task is complete, call [PFAccountManagementServerGetUserBansGetResultSize](pfaccountmanagementservergetuserbansgetresultsize.md) and [PFAccountManagementServerGetUserBansGetResult](pfaccountmanagementservergetuserbansgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
