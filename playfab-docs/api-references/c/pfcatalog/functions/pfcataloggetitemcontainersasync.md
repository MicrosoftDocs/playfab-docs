---
author: jasonsandlin
title: "PFCatalogGetItemContainersAsync"
description: "Search for a given item and return a set of bundles and stores containing the item. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. This API is intended for tooling/automation scenarios and has a reduced RPS with Player Entities limited to 30 requests in 300 seconds and Title Entities limited to 100 requests in 10 seconds."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogGetItemContainersAsync  

Search for a given item and return a set of bundles and stores containing the item. Up to 50 items can be returned at once. You can use continuation tokens to paginate through results that return greater than the limit. This API is intended for tooling/automation scenarios and has a reduced RPS with Player Entities limited to 30 requests in 300 seconds and Title Entities limited to 100 requests in 10 seconds.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemContainersAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemContainersRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemContainersRequest*](../../pfcatalogtypes/structs/pfcataloggetitemcontainersrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Given an item, return a set of bundles and stores containing the item. When the asynchronous task is complete, call [PFCatalogGetItemContainersGetResultSize](pfcataloggetitemcontainersgetresultsize.md) and [PFCatalogGetItemContainersGetResult](pfcataloggetitemcontainersgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
