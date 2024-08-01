---
author: jasonsandlin
title: "PFHCSettingsGetTraceLevel"
description: "Gets the trace level for the library."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCSettingsGetTraceLevel  

Gets the trace level for the library.  

## Syntax  
  
```cpp
HRESULT PFHCSettingsGetTraceLevel(  
    PFHCTraceLevel* traceLevel  
)  
```  
  
### Parameters  
  
**`traceLevel`** &nbsp; [PFHCTraceLevel*](../enums/pfhctracelevel.md)  
*output*  
  
Trace level.  
  
  
### Return value
Type: HRESULT
  
Result code for this API operation. Possible values are S_OK, E_INVALIDARG, or E_FAIL.
  
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
