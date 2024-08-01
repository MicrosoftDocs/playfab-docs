---
author: jasonsandlin
title: "PFCatalogCreateDraftItemAsync"
description: "Creates a new item in the working catalog using provided metadata."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFCatalogCreateDraftItemAsync  

Creates a new item in the working catalog using provided metadata.  

## Syntax  
  
```cpp
HRESULT PFCatalogCreateDraftItemAsync(  
    PFEntityHandle entityHandle,  
    const PFCatalogCreateDraftItemRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFCatalogCreateDraftItemRequest*](../../pfcatalogtypes/structs/pfcatalogcreatedraftitemrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. The item will not be published to the public catalog until the PublishItem API is called for the item. When the asynchronous task is complete, call [PFCatalogCreateDraftItemGetResultSize](pfcatalogcreatedraftitemgetresultsize.md) and [PFCatalogCreateDraftItemGetResult](pfcatalogcreatedraftitemgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
