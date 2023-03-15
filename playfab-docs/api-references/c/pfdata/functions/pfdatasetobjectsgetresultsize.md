---
author: jasonsandlin
title: "PFDataSetObjectsGetResultSize"
description: "Get the size in bytes needed to store the result of a SetObjects call."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFDataSetObjectsGetResultSize  

Get the size in bytes needed to store the result of a SetObjects call.  

## Syntax  
  
```cpp
HRESULT PFDataSetObjectsGetResultSize(  
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
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFData.h
  
## See also  
[PFData members](../pfdata_members.md)  

  
  
