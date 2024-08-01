---
author: jasonsandlin
title: "PFDataGetObjectsAsync"
description: "Retrieves objects from an entity's profile."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFDataGetObjectsAsync  

Retrieves objects from an entity's profile.  

## Syntax  
  
```cpp
HRESULT PFDataGetObjectsAsync(  
    PFEntityHandle entityHandle,  
    const PFDataGetObjectsRequest* request,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle to use for authentication.  
  
**`request`** &nbsp; [PFDataGetObjectsRequest*](../../pfdatatypes/structs/pfdatagetobjectsrequest.md)  
  
Populated request object.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This API is available on all platforms. Gets JSON objects from an entity profile and returns it. See also ObjectSetObjectsAsync. When the asynchronous task is complete, call [PFDataGetObjectsGetResultSize](pfdatagetobjectsgetresultsize.md) and [PFDataGetObjectsGetResult](pfdatagetobjectsgetresult.md) to get the result.
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
