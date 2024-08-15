---
author: jasonsandlin
title: "PFTitleDataManagementServerGetTitleInternalDataAsync"
description: "Retrieves the key-value store of custom internal title settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerGetTitleInternalDataAsync  

Retrieves the key-value store of custom internal title settings  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerGetTitleInternalDataAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFTitleDataManagementGetTitleDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFTitleDataManagementGetTitleDataRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgettitledatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. This API is designed to return title specific values which are accessible only to the server. This can be used to tweak settings on game servers and Cloud Scripts without needed to update and re-deploy them. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. See also ServerSetTitleInternalDataAsync. When the asynchronous task is complete, call [PFTitleDataManagementServerGetTitleInternalDataGetResultSize](pftitledatamanagementservergettitleinternaldatagetresultsize.md) and [PFTitleDataManagementServerGetTitleInternalDataGetResult](pftitledatamanagementservergettitleinternaldatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
