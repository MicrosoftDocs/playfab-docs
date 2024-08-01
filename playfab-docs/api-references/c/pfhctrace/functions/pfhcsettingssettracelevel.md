---
author: jasonsandlin
title: "PFHCSettingsSetTraceLevel"
description: "Sets the trace level for the library. Traces are sent the debug output."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCSettingsSetTraceLevel  

Sets the trace level for the library. Traces are sent the debug output.  

## Syntax  
  
```cpp
HRESULT PFHCSettingsSetTraceLevel(  
    PFHCTraceLevel traceLevel  
)  
```  
  
### Parameters  
  
**`traceLevel`** &nbsp; [PFHCTraceLevel](../enums/pfhctracelevel.md)  
  
Trace level.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
