---
author: jasonsandlin
title: "PFCatalogReportItemReviewAsync"
description: "Submit a report for a review"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
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
  
This API is available on all platforms. Submit a report for an inappropriate review, allowing the submitting user to specify their concern. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATABASE_THROUGHPUT_EXCEEDED or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
