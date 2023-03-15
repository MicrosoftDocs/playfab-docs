---
author: jasonsandlin
title: "PFCatalogSubmitItemReviewVoteAsync"
description: "Submit a vote for a review, indicating whether the review was helpful or unhelpful."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogSubmitItemReviewVoteAsync  

Submit a vote for a review, indicating whether the review was helpful or unhelpful.  

## Syntax  
  
```cpp
HRESULT PFCatalogSubmitItemReviewVoteAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogSubmitItemReviewVoteRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogSubmitItemReviewVoteRequest*](../../pfcatalogtypes/structs/pfcatalogsubmititemreviewvoterequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
