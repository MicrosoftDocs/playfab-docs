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

Initializes PlayFab Services global state  

## Syntax  
  
```cpp
HRESULT PFServicesInitialize(  
    XTaskQueueHandle reserved  
)  
```  
  
### Parameters  
  
**`reserved`** &nbsp; XTaskQueueHandle  
*optional*  
  
Reserved for future use.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
## Remarks  
  
This will internally call PFInitialize(nullptr) if it hasn't been called already by the title. If control of PFCore background work is needed, the title should explicitly call PFInitialize and PFUninitialize.
  
## Requirements  
  
**Header:** PFServices.h
  
## See also  
[PFServices members](../pfservices_members.md)  

  
  
