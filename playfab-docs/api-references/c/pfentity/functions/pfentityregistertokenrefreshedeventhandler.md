---
author: jasonsandlin
title: "PFEntityRegisterTokenRefreshedEventHandler"
description: "Register a handler for EntityToken refreshed events."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityRegisterTokenRefreshedEventHandler  

Register a handler for EntityToken refreshed events.  

## Syntax  
  
```cpp
HRESULT PFEntityRegisterTokenRefreshedEventHandler(  
    XTaskQueueHandle queue,  
    void* context,  
    PFEntityTokenRefreshedEventHandler* handler,  
    PFRegistrationToken* token  
)  
```  
  
### Parameters  
  
**`queue`** &nbsp; XTaskQueueHandle  
  
The async queue the callback should be invoked on.  
  
**`context`** &nbsp; void*  
*optional*  
  
Optional pointer to data used by the callback.  
  
**`handler`** &nbsp; PFEntityTokenRefreshedEventHandler*  
  
TBD    
  
**`token`** &nbsp; PFRegistrationToken*  
*output*  
  
The token for unregistering the callback.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
