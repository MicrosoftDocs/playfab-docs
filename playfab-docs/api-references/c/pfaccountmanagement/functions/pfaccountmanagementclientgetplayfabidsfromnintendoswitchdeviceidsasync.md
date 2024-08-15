---
author: jasonsandlin
title: "PFAccountManagementClientGetPlayFabIDsFromNintendoSwitchDeviceIdsAsync"
description: "Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch Device identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementClientGetPlayFabIDsFromNintendoSwitchDeviceIdsAsync  

Retrieves the unique PlayFab identifiers for the given set of Nintendo Switch Device identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementClientGetPlayFabIDsFromNintendoSwitchDeviceIdsAsync(  
    PFEntityHandle entityHandle,  
    const PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFAccountManagementGetPlayFabIDsFromNintendoSwitchDeviceIdsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetplayfabidsfromnintendoswitchdeviceidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementClientGetPlayFabIDsFromNintendoSwitchDeviceIdsGetResultSize](pfaccountmanagementclientgetplayfabidsfromnintendoswitchdeviceidsgetresultsize.md) and [PFAccountManagementClientGetPlayFabIDsFromNintendoSwitchDeviceIdsGetResult](pfaccountmanagementclientgetplayfabidsfromnintendoswitchdeviceidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
