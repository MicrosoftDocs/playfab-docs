---
author: jasonsandlin
title: "PFInitialize"
description: "Initializes PlayFabCore global state. Custom platform hooks must be configured prior to calling PFInitialize."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFInitialize  

Initializes PlayFabCore global state. Custom platform hooks must be configured prior to calling PFInitialize.  

## Syntax  
  
```cpp
HRESULT PFInitialize(  
    XTaskQueueHandle backgroundQueue,  
    JavaVM* javaVm,  
    jobject applicationContext  
)  
```  
  
### Parameters  
  
**`backgroundQueue`** &nbsp; XTaskQueueHandle  
*optional*  
  
An XTaskQueue that should be used for background work. If no queue is provided then a default (threadpool) queue will be used.  
  
**`javaVm`** &nbsp; JavaVM*  
  
TBD    
  
**`applicationContext`** &nbsp; jobject  
  
TBD    
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This will internally call PFInitialize(nullptr) if it hasn't been called already by the title. If control of PFCore background work is needed, the title should explicitly call PFInitialize and PFUninitialize.
  
## Requirements  
  
**Header:** PFCore.h
  
## See also  
[PFCore members](../pfcore_members.md)  

  
  
