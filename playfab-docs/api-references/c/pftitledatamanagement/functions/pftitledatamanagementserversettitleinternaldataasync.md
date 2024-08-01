---
author: jasonsandlin
title: "PFTitleDataManagementServerSetTitleInternalDataAsync"
description: "Updates the key-value store of custom title settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerSetTitleInternalDataAsync  

Updates the key-value store of custom title settings  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerSetTitleInternalDataAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFTitleDataManagementSetTitleDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFTitleDataManagementSetTitleDataRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementsettitledatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API is designed to store title specific values which are accessible only to the server. This can be used to tweak settings on game servers and Cloud Scripts without needed to update and re-deploy them. This operation is additive. If a Key does not exist in the current dataset, it will be added with the specified Value. If it already exists, the Value for that key will be overwritten with the new Value. See also ServerGetTitleInternalDataAsync. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATA_LENGTH_EXCEEDED, E_PF_TOO_MANY_KEYS or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
