---
author: jasonsandlin
title: "PFCatalogGetItemReviewSummaryAsync"
description: "Get a summary of all ratings and reviews associated with the specified item. Summary ratings data is cached with update data coming within 15 minutes."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemReviewSummaryAsync  

Get a summary of all ratings and reviews associated with the specified item. Summary ratings data is cached with update data coming within 15 minutes.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemReviewSummaryAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemReviewSummaryRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemReviewSummaryRequest*](../../pfcatalogtypes/structs/pfcataloggetitemreviewsummaryrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetItemReviewSummaryGetResultSize](pfcataloggetitemreviewsummarygetresultsize.md) and [PFCatalogGetItemReviewSummaryGetResult](pfcataloggetitemreviewsummarygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
