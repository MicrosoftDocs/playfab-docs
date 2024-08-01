---
author: jasonsandlin
title: "PFCatalogGetItemPublishStatusAsync"
description: "Gets the status of a publish of an item."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemPublishStatusAsync  

Gets the status of a publish of an item.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemPublishStatusAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemPublishStatusRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemPublishStatusRequest*](../../pfcatalogtypes/structs/pfcataloggetitempublishstatusrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetItemPublishStatusGetResultSize](pfcataloggetitempublishstatusgetresultsize.md) and [PFCatalogGetItemPublishStatusGetResult](pfcataloggetitempublishstatusgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
