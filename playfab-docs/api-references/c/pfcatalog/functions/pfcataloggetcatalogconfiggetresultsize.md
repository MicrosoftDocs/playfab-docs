---
author: jasonsandlin
title: "PFCatalogGetCatalogConfigGetResultSize"
description: "Get the size in bytes needed to store the result of a GetCatalogConfig call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/08/2026
---

# PFCatalogGetCatalogConfigGetResultSize  

Get the size in bytes needed to store the result of a GetCatalogConfig call.  

## Syntax  
  
```cpp
HRESULT PFCatalogGetCatalogConfigGetResultSize(  
    XAsyncBlock* async,  
    size_t* bufferSize  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
**`bufferSize`** &nbsp; size_t*  
*output*  
  
The buffer size in bytes required for the result.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. If the service call is unsuccessful, the result will be E_PF_BILLING_INFORMATION_REQUIRED, E_PF_INVALID_ENTITY_TYPE or any of the global PlayFab Service errors. See doc page "Handling PlayFab Errors" for more details on error handling.
  
  
## Requirements  
  
**Header:** PFCatalog.h
  
## See also  
[PFCatalog members](../pfcatalog_members.md)  

  
  
