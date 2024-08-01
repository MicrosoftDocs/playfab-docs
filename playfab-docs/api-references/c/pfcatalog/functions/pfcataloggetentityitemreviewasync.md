---
author: jasonsandlin
title: "PFCatalogGetEntityItemReviewAsync"
description: "Gets the submitted review for the specified item by the authenticated entity. Individual ratings and reviews data update in near real time with delays within a few seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetEntityItemReviewAsync  

Gets the submitted review for the specified item by the authenticated entity. Individual ratings and reviews data update in near real time with delays within a few seconds.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetEntityItemReviewAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetEntityItemReviewRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetEntityItemReviewRequest*](../../pfcatalogtypes/structs/pfcataloggetentityitemreviewrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetEntityItemReviewGetResultSize](pfcataloggetentityitemreviewgetresultsize.md) and [PFCatalogGetEntityItemReviewGetResult](pfcataloggetentityitemreviewgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
