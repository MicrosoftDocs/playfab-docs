---
author: jasonsandlin
title: "PFTitleDataManagementClientGetTitleNewsAsync"
description: "Retrieves the title news feed, as configured in the developer portal"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementClientGetTitleNewsAsync  

Retrieves the title news feed, as configured in the developer portal  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementClientGetTitleNewsAsync(  
    PFEntityHandle entityHandle,  
    const PFTitleDataManagementGetTitleNewsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFTitleDataManagementGetTitleNewsRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgettitlenewsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFTitleDataManagementClientGetTitleNewsGetResultSize](pftitledatamanagementclientgettitlenewsgetresultsize.md) and [PFTitleDataManagementClientGetTitleNewsGetResult](pftitledatamanagementclientgettitlenewsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
