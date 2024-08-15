---
author: jasonsandlin
title: "PFEntityGetEntityTokenResultSize"
description: "Get the size in bytes needed to store the result of a PFEntityGetEntityTokenAsync call."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityGetEntityTokenResultSize  

Get the size in bytes needed to store the result of a PFEntityGetEntityTokenAsync call.  

## Syntax  
  
```cpp
HRESULT PFEntityGetEntityTokenResultSize(  
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
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
