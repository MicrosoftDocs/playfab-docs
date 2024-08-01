---
author: jasonsandlin
title: "PFPlayerDataManagementServerUpdateUserInternalDataAsync"
description: "Updates the title-specific custom data for the user which cannot be accessed by the client"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFPlayerDataManagementServerUpdateUserInternalDataAsync  

Updates the title-specific custom data for the user which cannot be accessed by the client  

## Syntax  
  
```cpp
HRESULT PFPlayerDataManagementServerUpdateUserInternalDataAsync(  
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
  
This API is available on Win32, Linux, and macOS. This function performs an additive update of the arbitrary JSON object containing the custom data for the user. In updating the custom data object, keys which already exist in the object will have their values overwritten, keys with null values will be removed. No other key-value pairs will be changed apart from those specified in the call. See also ServerGetUserDataAsync, ServerGetUserInternalDataAsync, ServerGetUserReadOnlyDataAsync, ServerUpdateUserDataAsync, ServerUpdateUserReadOnlyDataAsync. When the asynchronous task is complete, call [PFPlayerDataManagementServerUpdateUserInternalDataGetResult](pfplayerdatamanagementserverupdateuserinternaldatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFPlayerDataManagement.h
  
## See also  
[PFPlayerDataManagement members](../pfplayerdatamanagement_members.md)  

  
  
