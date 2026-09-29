---
author: jasonsandlin
title: "PFCatalogDeleteEntityItemReviewsAsync"
description: "Deletes all reviews, helpfulness votes, and ratings submitted by the entity specified."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogDeleteEntityItemReviewsAsync  

Deletes all reviews, helpfulness votes, and ratings submitted by the entity specified.  

## Syntax  
  
```cpp
HRESULT PFCatalogDeleteEntityItemReviewsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogDeleteEntityItemReviewsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogDeleteEntityItemReviewsRequest*](../../pfcatalogtypes/structs/pfcatalogdeleteentityitemreviewsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on Windows. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_PROFILE_DOES_NOT_EXIST or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
