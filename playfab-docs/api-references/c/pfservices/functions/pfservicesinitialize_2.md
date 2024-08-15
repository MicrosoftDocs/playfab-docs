---
author: jasonsandlin
title: "PFServicesInitialize"
description: "Initializes PlayFab Services global state"
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFServicesInitialize  

Initializes PlayFab Services global state. This version is specifically used for Android.

## Syntax  
  
```cpp
HRESULT PFServicesInitialize(  
    XTaskQueueHandle backgroundQueue,  
    HCInitArgs* initArgs  
)  
```  
  
### Parameters  
  
**`backgroundQueue`** &nbsp; XTaskQueueHandle  
*optional*  
  
An XTaskQueue that should be used for background work. If no queue is provided then a default (threadpool) queue will be used.  
  
**`initArgs`** &nbsp; HCInitArgs*  

Arguments for initializing libHttpClient. It contains a Java VM and an application context, both can be retrieved through an Android app activity.

### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This will internally call PFInitialize(nullptr) if it hasn't been called already by the title. If control of PFCore background work is needed, the title should explicitly call PFInitialize and PFUninitialize.
  
## Requirements  
  
**Header:** PFServices.h
  
## See also  
[PFServices members](../pfservices_members.md)  

  
  
