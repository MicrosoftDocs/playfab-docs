---
author: jasonsandlin
title: "PFCatalogGetItemContainersAsync"
description: "Search for a given item and return a set of bundles and stores containing the item"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemContainersAsync  

Search for a given item and return a set of bundles and stores containing the item  

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
  
Given an item, return a set of bundles and stores containing the item. If successful, call [PFCatalogGetItemContainersGetResult](pfcataloggetitemcontainersgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
