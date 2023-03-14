---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of XboxLive identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFTitlePlayerHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromXboxLiveIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromxboxliveidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFAccountManagementClientGetPlayFabIDsFromXboxLiveIDsGetResult](pfaccountmanagementclientgetplayfabidsfromxboxliveidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
