---
author: jasonsandlin
title: "PFMemSetFunctions"
description: "Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This must be called before PFInitialize() and can not be called again once memory hooks have been set. This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMemSetFunctions  

Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This must be called before PFInitialize() and can not be called again once memory hooks have been set. This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines.  

## Syntax  
  
```cpp
HRESULT PFMemSetFunctions(  
    PFMemoryHooks* hooks  
)  
```  
  
### Parameters  
  
**`hooks`** &nbsp; [PFMemoryHooks*](../structs/pfmemoryhooks.md)  
  
Custom memory hooks to be used by the SDK.  
  
  
### Return value
Type: HRESULT
  
HRESULT return code for this API operation.
  
## Remarks  
  
Must be called before PFInitialize.
  
## Requirements  
  
**Header:** PFPlatform.h
  
## See also  
[PFPlatform members](../pfplatform_members.md)  

  
  
