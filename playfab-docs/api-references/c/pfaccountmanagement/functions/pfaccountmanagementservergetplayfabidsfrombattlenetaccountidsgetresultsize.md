---
author: jasonsandlin
title: "PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsGetResultSize"
description: "Get the size in bytes needed to store the result of a ServerGetPlayFabIDsFromBattleNetAccountIds call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsGetResultSize  

Get the size in bytes needed to store the result of a ServerGetPlayFabIDsFromBattleNetAccountIds call.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetPlayFabIDsFromBattleNetAccountIdsGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be one of global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
