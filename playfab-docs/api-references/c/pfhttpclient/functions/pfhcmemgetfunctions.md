---
author: jasonsandlin
title: "PFHCMemGetFunctions"
description: "Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCMemGetFunctions  

Gets the memory hook functions to allow callers to control route memory allocations to their own memory manager.  

## Syntax  
  
```cpp
HRESULT PFHCMemGetFunctions(  
    PFHCMemAllocFunction* memAllocFunc,  
    PFHCMemFreeFunction* memFreeFunc  
)  
```  
  
### Parameters  
  
**`memAllocFunc`** &nbsp; PFHCMemAllocFunction*  
*output*  
  
Set to the current allocation callback. Returns the default routine if not previously set.  
  
**`memFreeFunc`** &nbsp; PFHCMemFreeFunction*  
*output*  
  
Set to the to the current memory free callback. Returns the default routine if not previously set.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
## Remarks  
  
This method allows the application get the default memory allocation routines. This can be used along with PFHCMemSetFunctions() to monitor all memory allocations.
  
## Requirements  
  
**Header:** PFHttpClient.h
  
## See also  
[PFHttpClient members](../pfhttpclient_members.md)  

  
  
