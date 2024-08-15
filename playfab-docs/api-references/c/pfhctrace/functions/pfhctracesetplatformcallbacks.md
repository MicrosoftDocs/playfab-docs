---
author: jasonsandlin
title: "PFHCTraceSetPlatformCallbacks"
description: "Sets the Platform Callbacks."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCTraceSetPlatformCallbacks  

Sets the Platform Callbacks.  

## Syntax  
  
```cpp
HRESULT PFHCTraceSetPlatformCallbacks(  
    PFHCTracePlatformThisThreadIdCallback* threadIdCallback,  
    void* threadIdContext,  
    PFHCTracePlatformWriteMessageToDebuggerCallback* writeToDebuggerCallback,  
    void* writeToDebuggerContext  
)  
```  
  
### Parameters  
  
**`threadIdCallback`** &nbsp; PFHCTracePlatformThisThreadIdCallback*  
  
The thread ID callback.  
  
**`threadIdContext`** &nbsp; void*  
*optional*  
  
The thread ID context.  
  
**`writeToDebuggerCallback`** &nbsp; PFHCTracePlatformWriteMessageToDebuggerCallback*  
  
The write to debbugger callback.  
  
**`writeToDebuggerContext`** &nbsp; void*  
*optional*  
  
The write to debbugger context.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, or E_HC_NOT_INITIALISED.
  
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
