---
author: jasonsandlin
title: "PFAccountManagementServerUpdateBansAsync"
description: "Updates information of a list of existing bans specified with Ban Ids."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 09/25/2023
---

# PFAccountManagementServerUpdateBansAsync  

Updates information of a list of existing bans specified with Ban Ids.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerUpdateBansAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementUpdateBansRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementUpdateBansRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementupdatebansrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32. For each ban, only updates the values that are set. Leave any value to null for no change. If a ban could not be found, the rest are still applied. Returns information about applied updates only. See also ServerBanUsersAsync, ServerGetUserBansAsync, ServerRevokeAllBansForUserAsync, ServerRevokeBansAsync. When the asynchronous task is complete, call [PFAccountManagementServerUpdateBansGetResultSize](pfaccountmanagementserverupdatebansgetresultsize.md) and [PFAccountManagementServerUpdateBansGetResult](pfaccountmanagementserverupdatebansgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
