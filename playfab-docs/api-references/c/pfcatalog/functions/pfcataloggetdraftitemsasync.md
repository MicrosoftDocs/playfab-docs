---
author: jasonsandlin
title: "PFCatalogGetDraftItemsAsync"
description: "Retrieves a paginated list of the items from the draft catalog. Up to 50 IDs can be retrieved in a single request. GetDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetDraftItemsAsync  

Retrieves a paginated list of the items from the draft catalog. Up to 50 IDs can be retrieved in a single request. GetDraftItems does not work off a cache of the Catalog and should be used when trying to get recent item updates.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetDraftItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetDraftItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetDraftItemsRequest*](../../pfcatalogtypes/structs/pfcataloggetdraftitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetDraftItemsGetResultSize](pfcataloggetdraftitemsgetresultsize.md) and [PFCatalogGetDraftItemsGetResult](pfcataloggetdraftitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
