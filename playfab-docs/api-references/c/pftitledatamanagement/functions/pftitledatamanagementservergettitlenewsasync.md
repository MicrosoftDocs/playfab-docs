---
author: jasonsandlin
title: "PFTitleDataManagementServerGetTitleNewsAsync"
description: "Retrieves the title news feed, as configured in the developer portal"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementServerGetTitleNewsAsync  

Retrieves the title news feed, as configured in the developer portal  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementServerGetTitleNewsAsync(  
    PFEntityHandle titleEntityHandle,  
    const PFTitleDataManagementGetTitleNewsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`titleEntityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle for a title Entity obtained using PFAuthenticationGetEntityWithSecretKeyAsync.  
  
**`request`** &nbsp; [PFTitleDataManagementGetTitleNewsRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgettitlenewsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Win32, Linux, and macOS. When the asynchronous task is complete, call [PFTitleDataManagementServerGetTitleNewsGetResultSize](pftitledatamanagementservergettitlenewsgetresultsize.md) and [PFTitleDataManagementServerGetTitleNewsGetResult](pftitledatamanagementservergettitlenewsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
