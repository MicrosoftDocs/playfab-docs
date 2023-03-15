---
author: jasonsandlin
title: "PFCatalogGetItemAsync"
description: "Retrieves an item from the public catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogGetItemAsync  

Retrieves an item from the public catalog.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogGetItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogGetItemRequest*](../../pfcatalogtypes/structs/pfcataloggetitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
If successful, call [PFCatalogGetItemGetResult](pfcataloggetitemgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
