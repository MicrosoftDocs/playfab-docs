---
author: jasonsandlin
title: "PFInitialize"
description: "Initialize PlayFabCore global state. Custom platform hooks must be configured prior to calling PFInitialize."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInitialize  

Initialize PlayFabCore global state. Custom platform hooks must be configured prior to calling PFInitialize.  

## Syntax  
  
```cpp
HRESULT PFInitialize(  
    XTaskQueueHandle backgroundQueue  
)  
```  
  
### Parameters  
  
**`backgroundQueue`** &nbsp; XTaskQueueHandle  
*optional*  
  
An XTaskQueue that should be used for background work. If no queue is provided then a default (threadpool) queue will be used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFCore.h
  
## See also  
[PFCore members](../pfcore_members.md)  

  
  
