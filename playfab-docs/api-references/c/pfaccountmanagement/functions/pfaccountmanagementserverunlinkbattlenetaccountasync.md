---
author: jasonsandlin
title: "PFAccountManagementServerUnlinkBattleNetAccountAsync"
description: "Unlinks the related Battle.net account from the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerUnlinkBattleNetAccountAsync  

Unlinks the related Battle.net account from the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerUnlinkBattleNetAccountAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementServerUnlinkBattleNetAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementServerUnlinkBattleNetAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementserverunlinkbattlenetaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ServerLinkBattleNetAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_ACCOUNT_NOT_LINKED, E_PF_BATTLE_NET_NOT_ENABLED_FOR_TITLE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
