---
author: jasonsandlin
title: "PFCatalogReportItemReviewAsync"
description: "Submit a report for a review"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogReportItemReviewAsync  

Submit a report for a review  

## Syntax  
  
```cpp
HRESULT PFCatalogReportItemReviewAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogReportItemReviewRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogReportItemReviewRequest*](../../pfcatalogtypes/structs/pfcatalogreportitemreviewrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Submit a report for an inappropriate review, allowing the submitting user to specify their concern. Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
