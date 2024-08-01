---
author: jasonsandlin
title: "PFCatalogReviewItemAsync"
description: "Creates or updates a review for the specified item. More information around the caching surrounding item ratings and reviews can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/ratings#ratings-design-and-caching"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogReviewItemAsync  

Creates or updates a review for the specified item. More information around the caching surrounding item ratings and reviews can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/ratings#ratings-design-and-caching  

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
  
This API is available on all platforms. Call XAsyncGetStatus to get the status of the operation. If the service call is unsuccessful, the async result will be E_PF_DATABASE_THROUGHPUT_EXCEEDED, E_PF_ITEM_NOT_FOUND or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
