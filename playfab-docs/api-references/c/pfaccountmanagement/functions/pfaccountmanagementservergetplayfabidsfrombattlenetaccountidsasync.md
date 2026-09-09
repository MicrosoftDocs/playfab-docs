---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Battle.net account identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Battle.net account identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrombattlenetaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. When the asynchronous task is complete, call [PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsGetResultSize](pfaccountmanagementservergetplayfabidsfrombattlenetaccountidsgetresultsize.md) and [PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsGetResult](pfaccountmanagementservergetplayfabidsfrombattlenetaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
