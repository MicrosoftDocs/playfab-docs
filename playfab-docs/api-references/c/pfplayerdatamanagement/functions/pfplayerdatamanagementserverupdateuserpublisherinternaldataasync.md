---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdateUserPublisherInternalDataAsync"
description: "Updates the publisher-specific custom data for the user which cannot be accessed by the client"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementServerUpdateUserPublisherInternalDataAsync  

Updates the publisher-specific custom data for the user which cannot be accessed by the client  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerUpdateUserPublisherInternalDataAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFPlayerDataManagementUpdateUserInternalDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFPlayerDataManagementUpdateUserInternalDataRequest*](../../pfplayerdatamanagementtypes/structs/pfplayerdatamanagementupdateuserinternaldatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. See also ServerGetUserPublisherDataAsync, ServerGetUserPublisherInternalDataAsync, ServerGetUserPublisherReadOnlyDataAsync, ServerUpdateUserPublisherDataAsync, ServerUpdateUserPublisherReadOnlyDataAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerUpdateUserPublisherInternalDataGetResult](pfplayerdatamanagementserverupdateuserpublisherinternaldatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
