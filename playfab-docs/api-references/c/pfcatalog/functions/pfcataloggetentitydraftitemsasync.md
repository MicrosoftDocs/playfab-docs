---
author: jasonsandlin
title: "PFCatalogGetEntityDraftItemsAsync"
description: "Retrieves a paginated list of the items from the draft catalog created by the Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetEntityDraftItemsAsync  

Retrieves a paginated list of the items from the draft catalog created by the Entity.  

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
  
If successful, call [PFCatalogGetEntityDraftItemsGetResult](pfcataloggetentitydraftitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
