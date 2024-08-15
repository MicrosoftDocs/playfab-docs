---
author: jasonsandlin
title: "PFEntityRegisterTokenExpiredEventHandler"
description: "Register a handler for EntityToken expired events."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFEntityRegisterTokenExpiredEventHandler  

Register a handler for EntityToken expired events.  

## Syntax  
  
```cpp
HRESULT PFEntityRegisterTokenExpiredEventHandler(  
    XTaskQueueHandle queue,  
    void* context,  
    PFEntityTokenExpiredEventHandler* handler,  
    PFRegistrationToken* token  
)  
```  
  
### Parameters  
  
**`queue`** &nbsp; XTaskQueueHandle  
*optional*  
  
The async queue the callback should be invoked on.  
  
**`context`** &nbsp; void*  
*optional*  
  
Optional pointer to data used by the event handler.  
  
**`handler`** &nbsp; PFEntityTokenExpiredEventHandler*  
  
The event handler, XUserRegisterForChangeEvent.  
  
**`token`** &nbsp; PFRegistrationToken*  
*output*  
  
The token for unregistering this callback  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_PF_NOT_INITIALIZED, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFEntity.h
  
## See also  
[PFEntity members](../pfentity_members.md)  

  
  
