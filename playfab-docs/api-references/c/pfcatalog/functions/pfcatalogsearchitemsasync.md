---
author: jasonsandlin
title: "PFCatalogSearchItemsAsync"
description: "Executes a search against the public catalog using the provided search parameters and returns a set of paginated results."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogSearchItemsAsync  

Executes a search against the public catalog using the provided search parameters and returns a set of paginated results.  

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
  
If successful, call [PFCatalogSearchItemsGetResult](pfcatalogsearchitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
