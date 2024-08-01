---
author: jasonsandlin
title: "PFTitleDataManagementServerGetTitleDataAsync"
description: "Retrieves the key-value store of custom title settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerGetTitleDataAsync  

Retrieves the key-value store of custom title settings  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerGetTitleDataAsync(  
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
  
This API is available on Win32, Linux, and macOS. This API is designed to return title specific values which can be read, but not written to, by the client. For example, a developer could choose to store values which modify the user experience, such as enemy spawn rates, weapon strengths, movement speeds, etc. This allows a developer to update the title without the need to create, test, and ship a new build. If an override label is specified in the request, the overrides are applied automatically and returned with the title data. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. See also ServerSetTitleDataAsync. When the asynchronous task is complete, call [PFTitleDataManagementServerGetTitleDataGetResultSize](pftitledatamanagementservergettitledatagetresultsize.md) and [PFTitleDataManagementServerGetTitleDataGetResult](pftitledatamanagementservergettitledatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
