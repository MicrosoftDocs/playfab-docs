---
author: jasonsandlin
title: "PFPlayerDataManagementClientGetUserPublisherReadOnlyDataAsync"
description: "Retrieves the publisher-specific custom data for the user which can only be read by the client"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementClientGetUserPublisherReadOnlyDataAsync  

Retrieves the publisher-specific custom data for the user which can only be read by the client  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientGetUserPublisherReadOnlyDataAsync(  
    PFEntityHandle entityHandle,  
    const PFPlayerDataManagementGetUserDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlayerDataManagementGetUserDataRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementgetuserdatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Data is stored as JSON key-value pairs. If the Keys parameter is provided, the data object returned will only contain the data specific to the indicated Keys. Otherwise, the full set of custom user data will be returned. See also ClientGetUserPublisherDataAsync, ClientUpdateUserPublisherDataAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientGetUserPublisherReadOnlyDataGetResultSize](pfplayerdatamanagementclientgetuserpublisherreadonlydatagetresultsize.md) and [PFPlayerDataManagementClientGetUserPublisherReadOnlyDataGetResult](pfplayerdatamanagementclientgetuserpublisherreadonlydatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
