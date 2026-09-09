---
author: jasonsandlin
title: "PFAccountManagementServerLinkBattleNetAccountAsync"
description: "Links the Battle.net account associated with the token to the user's PlayFab account."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerLinkBattleNetAccountAsync  

Links the Battle.net account associated with the token to the user's PlayFab account.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerLinkBattleNetAccountAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementServerLinkBattleNetAccountRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementServerLinkBattleNetAccountRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementserverlinkbattlenetaccountrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. See also ServerUnlinkBattleNetAccountAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_BATTLE_NET_NOT_ENABLED_FOR_TITLE, E_PF_LINKED_IDENTIFIER_ALREADY_CLAIMED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
