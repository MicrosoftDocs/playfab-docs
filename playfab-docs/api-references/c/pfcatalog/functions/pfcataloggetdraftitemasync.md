---
author: jasonsandlin
title: "PFCatalogGetDraftItemAsync"
description: "Retrieves an item from the working catalog. This item represents the current working state of the item. GetDraftItem does not work off a cache of the Catalog and should be used when trying to get recent item updates. However, please note that item references data is cached and may take a few moments for changes to propagate."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetDraftItemAsync  

Retrieves an item from the working catalog. This item represents the current working state of the item. GetDraftItem does not work off a cache of the Catalog and should be used when trying to get recent item updates. However, please note that item references data is cached and may take a few moments for changes to propagate.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetDraftItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetDraftItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetDraftItemRequest*](../../pfcatalogtypes/structs/pfcataloggetdraftitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogGetDraftItemGetResultSize](pfcataloggetdraftitemgetresultsize.md) and [PFCatalogGetDraftItemGetResult](pfcataloggetdraftitemgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
