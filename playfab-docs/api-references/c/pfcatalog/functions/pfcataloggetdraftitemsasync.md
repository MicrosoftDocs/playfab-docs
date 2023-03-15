---
author: jasonsandlin
title: "PFCatalogGetDraftItemsAsync"
description: "Retrieves a paginated list of the items from the draft catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetDraftItemsAsync  

Retrieves a paginated list of the items from the draft catalog.  

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
  
If successful, call [PFCatalogGetDraftItemsGetResult](pfcataloggetdraftitemsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
