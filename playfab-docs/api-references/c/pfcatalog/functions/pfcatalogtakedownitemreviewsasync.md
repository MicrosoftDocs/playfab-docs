---
author: jasonsandlin
title: "PFCatalogTakedownItemReviewsAsync"
description: "Submit a request to takedown one or more reviews."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogTakedownItemReviewsAsync  

Submit a request to takedown one or more reviews.  

## Syntax  
  
```cpp
HRESULT PFCatalogTakedownItemReviewsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogTakedownItemReviewsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogTakedownItemReviewsRequest*](../../pfcatalogtypes/structs/pfcatalogtakedownitemreviewsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Submit a request to takedown one or more reviews, removing them from public view. Authors will still be able to see their reviews after being taken down. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATABASE_THROUGHPUT_EXCEEDED, E_PF_ITEM_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
