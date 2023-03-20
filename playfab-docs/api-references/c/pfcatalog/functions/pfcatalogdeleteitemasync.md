---
author: jasonsandlin
title: "PFCatalogDeleteItemAsync"
description: "Removes an item from working catalog and all published versions from the public catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFCatalogDeleteItemAsync  

Removes an item from working catalog and all published versions from the public catalog.  

## Syntax  
  
```cpp
HRESULT PFCatalogDeleteItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogDeleteItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogDeleteItemRequest*](../../pfcatalogtypes/structs/pfcatalogdeleteitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Call XAsyncGetStatus to get the status of the operation.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
