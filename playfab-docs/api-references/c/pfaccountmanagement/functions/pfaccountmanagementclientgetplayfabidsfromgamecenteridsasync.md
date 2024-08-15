---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center Programming Guide as the Player Identifier)."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsAsync  

Retrieves the unique PlayFab identifiers for the given set of Game Center identifiers (referenced in the Game Center Programming Guide as the Player Identifier).  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromGameCenterIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromgamecenteridsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, iOS, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsGetResultSize](pfaccountmanagementclientgetplayfabidsfromgamecenteridsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromGameCenterIDsGetResult](pfaccountmanagementclientgetplayfabidsfromgamecenteridsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
