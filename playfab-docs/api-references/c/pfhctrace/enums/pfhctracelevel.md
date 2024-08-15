---
author: jasonsandlin
title: "PFHCTraceLevel"
description: "Diagnostic level used by tracing."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCTraceLevel  

Diagnostic level used by tracing.    

## Syntax  
  
```cpp
enum class PFHCTraceLevel  : uint32_t  
{  
    Off = PFHC_PRIVATE_TRACE_LEVEL_OFF,  
    Error = PFHC_PRIVATE_TRACE_LEVEL_ERROR,  
    Warning = PFHC_PRIVATE_TRACE_LEVEL_WARNING,  
    Important = PFHC_PRIVATE_TRACE_LEVEL_IMPORTANT,  
    Information = PFHC_PRIVATE_TRACE_LEVEL_INFORMATION,  
    Verbose = PFHC_PRIVATE_TRACE_LEVEL_VERBOSE,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Off | No tracing. |  
| Error | Trace only errors. |  
| Warning | Trace warnings and errors. |  
| Important | Trace important, warnings and errors. |  
| Information | Trace info, important, warnings and errors. |  
| Verbose | Trace everything. |  
  
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
