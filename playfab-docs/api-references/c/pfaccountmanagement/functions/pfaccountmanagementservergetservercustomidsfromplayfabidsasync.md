---
author: jasonsandlin
title: "PFAccountManagementServerGetServerCustomIDsFromPlayFabIDsAsync"
description: "Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFAccountManagementServerGetServerCustomIDsFromPlayFabIDsAsync  

Retrieves the associated PlayFab account identifiers for the given set of server custom identifiers.  

## Syntax  
  
```cpp
HRESULT PFAccountManagementServerGetServerCustomIDsFromPlayFabIDsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFAccountManagementGetServerCustomIDsFromPlayFabIDsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFAccountManagementGetServerCustomIDsFromPlayFabIDsRequest*](../../pfaccountmanagementtypes/structs/pfaccountmanagementgetservercustomidsfromplayfabidsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFAccountManagementServerGetServerCustomIDsFromPlayFabIDsGetResultSize](pfaccountmanagementservergetservercustomidsfromplayfabidsgetresultsize.md) and [PFAccountManagementServerGetServerCustomIDsFromPlayFabIDsGetResult](pfaccountmanagementservergetservercustomidsfromplayfabidsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFAccountManagement.h
  
## See also  
[PFAccountManagement members](../pfaccountmanagement_members.md)  

  
  
