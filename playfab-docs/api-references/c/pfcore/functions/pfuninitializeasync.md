---
author: jasonsandlin
title: "PFUninitializeAsync"
description: "Cleanup PlayFab global state."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFUninitializeAsync  

Cleanup PlayFab global state.  

## Syntax  
  
```cpp
HRESULT PFUninitializeAsync(  
    XAsyncBlock* async  
)  
```  
  
### Parameters  
  
**`async`** &nbsp; XAsyncBlock*  
  
XAsyncBlock for the async operation.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
Asynchronous result returned via XAsyncGetStatus.
  
## Requirements  
  
**Header:** PFCore.h
  
## See also  
[PFCore members](../pfcore_members.md)  

  
  
