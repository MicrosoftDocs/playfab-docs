---
author: jasonsandlin
title: "PFCatalogGetItemReviewsAsync"
description: "Get a paginated set of reviews associated with the specified item. Individual ratings and reviews data update in near real time with delays within a few seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemReviewsAsync  

Get a paginated set of reviews associated with the specified item. Individual ratings and reviews data update in near real time with delays within a few seconds.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemReviewsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemReviewsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemReviewsRequest*](../../pfcatalogtypes/structs/pfcataloggetitemreviewsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetItemReviewsGetResultSize](pfcataloggetitemreviewsgetresultsize.md) and [PFCatalogGetItemReviewsGetResult](pfcataloggetitemreviewsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
