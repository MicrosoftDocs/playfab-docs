---
author: jasonsandlin
title: "PFEntityGetEntityTokenAsync"
description: "Get the cached PFEntityToken for an Entity."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFEntityGetEntityTokenAsync  

Get the cached PFEntityToken for an Entity.  

## Syntax  
  
```cpp
HRESULT PFEntityGetEntityTokenAsync(  
    PFEntityHandle entityHandle,  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`entityHandle`** &nbsp; PFEntityHandle  
  
PFEntityHandle returned from a login call.  
  
**`async`** &nbsp; XAsyncBlock*  
*_Inout_*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
