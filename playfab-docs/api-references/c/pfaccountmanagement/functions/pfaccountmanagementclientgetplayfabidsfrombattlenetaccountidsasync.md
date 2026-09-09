---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromBattleNetAccountIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Battle.net account identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementClientGetPlayFabIDsFromBattleNetAccountIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Battle.net account identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromBattleNetAccountIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromBattleNetAccountIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfrombattlenetaccountidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromBattleNetAccountIdsGetResultSize](pfaccountmanagementclientgetplayfabidsfrombattlenetaccountidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromBattleNetAccountIdsGetResult](pfaccountmanagementclientgetplayfabidsfrombattlenetaccountidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
