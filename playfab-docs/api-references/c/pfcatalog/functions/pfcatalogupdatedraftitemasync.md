---
author: jasonsandlin
title: "PFCatalogUpdateDraftItemAsync"
description: "Update the metadata for an item in the working catalog."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogUpdateDraftItemAsync  

Update the metadata for an item in the working catalog.  

## Syntax  
  
```cpp
HRESULT PFCatalogUpdateDraftItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogUpdateDraftItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogUpdateDraftItemRequest*](../../pfcatalogtypes/structs/pfcatalogupdatedraftitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. When the asynchronous task is complete, call [PFCatalogUpdateDraftItemGetResultSize](pfcatalogupdatedraftitemgetresultsize.md) and [PFCatalogUpdateDraftItemGetResult](pfcatalogupdatedraftitemgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
