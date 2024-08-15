---
author: jasonsandlin
title: "PFCatalogGetEntityDraftItemsAsync"
description: "Retrieves a paginated list of the items from the draft catalog created by the Entity. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. GetEntityDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetEntityDraftItemsAsync  

Retrieves a paginated list of the items from the draft catalog created by the Entity. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. GetEntityDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetEntityDraftItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetEntityDraftItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetEntityDraftItemsRequest*](../../pfcatalogtypes/structs/pfcataloggetentitydraftitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetEntityDraftItemsGetResultSize](pfcataloggetentitydraftitemsgetresultsize.md) and [PFCatalogGetEntityDraftItemsGetResult](pfcataloggetentitydraftitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
