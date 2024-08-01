---
author: jasonsandlin
title: "PFDataSetObjectsAsync"
description: "Sets objects on an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataSetObjectsAsync  

Sets objects on an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataSetObjectsAsync(  
    PFEntityHandle entityHandle,  
    const PFDataSetObjectsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataSetObjectsRequest*](../../pfdatatypes/structs/pfdatasetobjectsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Sets JSON objects on the requested entity profile. May include a version number to be used to perform optimistic concurrency operations during update. If the current version differs from the version in the request the request will be ignored. If no version is set on the request then the value will always be updated if the values differ. Using the version value does not guarantee a write though, ConcurrentEditError may still occur if multiple clients are attempting to update the same profile. See also ObjectGetObjectsAsync. When the asynchronous task is complete, call [PFDataSetObjectsGetResultSize](pfdatasetobjectsgetresultsize.md) and [PFDataSetObjectsGetResult](pfdatasetobjectsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
