---
author: jasonsandlin
title: "PFCatalogSearchItemsAsync"
description: "Executes a search against the public catalog using the provided search parameters and returns a set of paginated results. SearchItems uses a cache of the catalog with item updates taking up to a few minutes to propagate. You should use the GetItem API for when trying to immediately get recent item updates. More information about the Search API can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/search"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogSearchItemsAsync  

Executes a search against the public catalog using the provided search parameters and returns a set of paginated results. SearchItems uses a cache of the catalog with item updates taking up to a few minutes to propagate. You should use the GetItem API for when trying to immediately get recent item updates. More information about the Search API can be found here: https://learn.microsoft.com/gaming/playfab/features/economy-v2/catalog/search  

## Syntax  
  
```cpp
HRESULT PFCatalogSearchItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogSearchItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogSearchItemsRequest*](../../pfcatalogtypes/structs/pfcatalogsearchitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogSearchItemsGetResultSize](pfcatalogsearchitemsgetresultsize.md) and [PFCatalogSearchItemsGetResult](pfcatalogsearchitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
