---
author: jasonsandlin
title: "PFAccountManagementGetTitlePlayersFromXboxLiveIDsAsync"
description: "Retrieves the title player accounts associated with the given XUIDs."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementGetTitlePlayersFromXboxLiveIDsAsync  

Retrieves the title player accounts associated with the given XUIDs.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementGetTitlePlayersFromXboxLiveIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetTitlePlayersFromXboxLiveIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgettitleplayersfromxboxliveidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. Given a collection of Xbox IDs (XUIDs), returns all title player accounts. When the asynchronous task is complete, call [PFAccountManagementGetTitlePlayersFromXboxLiveIDsGetResultSize](pfaccountmanagementgettitleplayersfromxboxliveidsgetresultsize.md) and [PFAccountManagementGetTitlePlayersFromXboxLiveIDsGetResult](pfaccountmanagementgettitleplayersfromxboxliveidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
