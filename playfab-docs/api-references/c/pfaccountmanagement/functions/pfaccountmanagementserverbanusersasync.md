---
author: jasonsandlin
title: "PFAccountManagementServerBanUsersAsync"
description: "Bans users by PlayFab ID with optional IP address, or MAC address for the provided game."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerBanUsersAsync  

Bans users by PlayFab ID with optional IP address, or MAC address for the provided game.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerBanUsersAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementBanUsersRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementBanUsersRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementbanusersrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. The existence of each user will not be verified. When banning by IP or MAC address, multiple players may be affected, so use this feature with caution. Returns information about the new bans. See also ServerGetUserBansAsync, ServerRevokeAllBansForUserAsync, ServerRevokeBansAsync, ServerUpdateBansAsync. When the asynchronous task is complete, call [PFAccountManagementServerBanUsersGetResultSize](pfaccountmanagementserverbanusersgetresultsize.md) and [PFAccountManagementServerBanUsersGetResult](pfaccountmanagementserverbanusersgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
