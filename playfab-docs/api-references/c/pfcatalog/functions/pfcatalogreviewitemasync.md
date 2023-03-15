---
author: jasonsandlin
title: "PFCatalogReviewItemAsync"
description: "Creates or updates a review for the specified item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogReviewItemAsync  

Creates or updates a review for the specified item.  

## Syntax  
  
```cpp
HRESULT PFCatalogReviewItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogReviewItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogReviewItemRequest*](../../pfcatalogtypes/structs/pfcatalogreviewitemrequest.md)  
  
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

  
  
