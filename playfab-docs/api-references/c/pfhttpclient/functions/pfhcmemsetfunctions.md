---
author: jasonsandlin
title: "PFHCMemSetFunctions"
description: "Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCMemSetFunctions  

Optionally sets the memory hook functions to allow callers to control route memory allocations to their own memory manager.  

## Syntax  
  
```cpp
HRESULT PFHCMemSetFunctions(  
    PFHCMemAllocFunction memAllocFunc,  
    PFHCMemFreeFunction memFreeFunc  
)  
```  
  
### Parameters  
  
**`memAllocFunc`** &nbsp; PFHCMemAllocFunction  
*optional*  
  
A pointer to the custom allocation callback to use, or a null pointer to restore the default.  
  
**`memFreeFunc`** &nbsp; PFHCMemFreeFunction  
*optional*  
  
A pointer to the custom freeing callback to use, or a null pointer to restore the default.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_HC_ALREADY_INITIALIZED.
  
## Remarks  
  
This must be called before PFHCInitialize(). and can not be called again until PFHCCleanup(). This method allows the application to install custom memory allocation routines in order to service all requests for new memory buffers instead of using default allocation routines. The `memAllocFunc` and `memFreeFunc` parameters can be null pointers to restore the default routines. Both callback pointers must be null or both must be non-null. Mixing custom and default routines is not permitted.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
