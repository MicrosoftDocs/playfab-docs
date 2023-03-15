---
author: jasonsandlin
title: "PFCatalogGetItemReviewsAsync"
description: "Get a paginated set of reviews associated with the specified item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemReviewsAsync  

Get a paginated set of reviews associated with the specified item.  

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
  
If successful, call [PFCatalogGetItemReviewsGetResult](pfcataloggetitemreviewsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
