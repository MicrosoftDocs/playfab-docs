---
author: jasonsandlin
title: "PFServicesInitialize"
description: "Initializes PlayFab Services global state"
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFServicesInitialize  

Initializes PlayFab Services global state  

## Syntax  
  
```cpp
HRESULT PFServicesInitialize(  
    XTaskQueueHandle backgroundQueue  
)  
```  
  
### Parameters  
  
**`backgroundQueue`** &nbsp; XTaskQueueHandle  
*optional*  
  
An XTaskQueue that should be used for background work. If no queue is provided then a default (thread pool) queue will be used.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This will internally call PFInitialize() if it hasn't been called. If PFInitialize() has already been called, then backgroundQueue is ignored.
  
## Requirements  
  
**Header:** PFServices.h
  
## See also  
[PFServices members](../pfservices_members.md)  

  
  
