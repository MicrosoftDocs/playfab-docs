---
author: jasonsandlin
title: "PFCatalogGetItemsAsync"
description: "Retrieves items from the public catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemsAsync  

Retrieves items from the public catalog.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemsAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemsRequest*](../../pfcatalogtypes/structs/pfcataloggetitemsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFCatalogGetItemsGetResult](pfcataloggetitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
