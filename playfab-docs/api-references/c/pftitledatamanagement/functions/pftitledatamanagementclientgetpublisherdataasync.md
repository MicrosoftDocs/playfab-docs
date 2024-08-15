---
author: jasonsandlin
title: "PFTitleDataManagementClientGetPublisherDataAsync"
description: "Retrieves the key-value store of custom publisher settings"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFTitleDataManagementClientGetPublisherDataAsync  

Retrieves the key-value store of custom publisher settings  

## Syntax  
  
```cpp
HRESULT PFTitleDataManagementClientGetPublisherDataAsync(  
    PFEntityHandle entityHandle,  
    const PFTitleDataManagementGetPublisherDataRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFTitleDataManagementGetPublisherDataRequest*](../../pftitledatamanagementtypes/structs/pftitledatamanagementgetpublisherdatarequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. This API is designed to return publisher-specific values which can be read, but not written to, by the client. This data is shared across all titles assigned to a particular publisher, and can be used for cross-game coordination. Only titles assigned to a publisher can use this API. For more information email helloplayfab@microsoft.com. Note that there may up to a minute delay in between updating title data and this API call returning the newest value. When the asynchronous task is complete, call [PFTitleDataManagementClientGetPublisherDataGetResultSize](pftitledatamanagementclientgetpublisherdatagetresultsize.md) and [PFTitleDataManagementClientGetPublisherDataGetResult](pftitledatamanagementclientgetpublisherdatagetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFTitleDataManagement.h
  
## See also  
[PFTitleDataManagement members](../pftitledatamanagement_members.md)  

  
  
