---
author: jasonsandlin
title: "PFCatalogGetItemReviewSummaryAsync"
description: "Get a summary of all reviews associated with the specified item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemReviewSummaryAsync  

Get a summary of all reviews associated with the specified item.  

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
  
If successful, call [PFCatalogGetItemReviewSummaryGetResult](pfcataloggetitemreviewsummarygetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
