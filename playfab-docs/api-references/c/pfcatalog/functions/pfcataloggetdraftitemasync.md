---
author: jasonsandlin
title: "PFCatalogGetDraftItemAsync"
description: "Retrieves an item from the working catalog. This item represents the current working state of the item."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetDraftItemAsync  

Retrieves an item from the working catalog. This item represents the current working state of the item.  

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
  
If successful, call [PFCatalogGetDraftItemGetResult](pfcataloggetdraftitemgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
