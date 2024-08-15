---
author: jasonsandlin
title: "PFMemGetFunctions"
description: "Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This method allows the application get the default memory allocation routines. This can be used along with PFMemSetFunctions() to monitor all memory allocations."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFMemGetFunctions  

Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager. This method allows the application get the default memory allocation routines. This can be used along with PFMemSetFunctions() to monitor all memory allocations.  

## Syntax  
  
```cpp
HRESULT PFMemGetFunctions(  
    PFMemoryHooks* hooks  
)  
```  
  
### Parameters  
  
**`hooks`** &nbsp; [PFMemoryHooks*](../structs/pfmemoryhooks.md)  
*output*  
  
Struct to be populated with the current memory hooks. Defaults will be returned if custom hooks weren't previously set.  
  
  
### Return value
Type: HRESULT
  
HRESULT return code for this API operation.
  
  
## Requirements  
  
**Header:** PFPlatform.h
  
## See also  
[PFPlatform members](../pfplatform_members.md)  

  
  
