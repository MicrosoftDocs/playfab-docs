---
author: jasonsandlin
title: "PFPlayerDataManagementClientUpdateUserPublisherDataAsync"
description: "Creates and updates the publisher-specific custom data for the user which is readable and writable by the client"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementClientUpdateUserPublisherDataAsync  

Creates and updates the publisher-specific custom data for the user which is readable and writable by the client  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementClientUpdateUserPublisherDataAsync(  
    PFEntityHandle entityHandle,  
    const PFPlayerDataManagementClientUpdateUserDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFPlayerDataManagementClientUpdateUserDataRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementclientupdateuserdatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This function performs an additive update of the arbitrary strings containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, while keys with null values will be removed. New keys will be added, with the given values. No other key-value pairs will be changed apart from those specified in the call. See also ClientGetUserPublisherDataAsync, ClientGetUserPublisherReadOnlyDataAsync. When the asynchronous task is complete, call [PFPlayerDataManagementClientUpdateUserPublisherDataGetResult](pfplayerdatamanagementclientupdateuserpublisherdatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
