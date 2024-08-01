---
author: jasonsandlin
title: "PFHCTraceImplGetAreaVerbosity"
description: "Get the trace verbosity level of an trace area."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCTraceImplGetAreaVerbosity  

Get the trace verbosity level of an trace area.  

## Syntax  
  
```cpp
PFHCTraceLevel PFHCTraceImplGetAreaVerbosity(  
    PFHCTraceImplArea* area  
)  
```  
  
### Parameters  
  
**`area`** &nbsp; PFHCTraceImplArea*  
  
The trace area.  
  
  
### Return value
Type: PFHCTraceLevel
  
The verbosity level of the area.
  
## Remarks  
  
This should be accessed through macros, such as HC_TRACE_GET_VERBOSITY, rather than called directly.
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
