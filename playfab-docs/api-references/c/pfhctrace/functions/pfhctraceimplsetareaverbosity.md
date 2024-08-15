---
author: jasonsandlin
title: "PFHCTraceImplSetAreaVerbosity"
description: "Set the verbosity level of an trace area."
ms.author: jasonsa
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/22/2024
---

# PFHCTraceImplSetAreaVerbosity  

Set the verbosity level of an trace area.  

## Syntax  
  
```cpp
void PFHCTraceImplSetAreaVerbosity(  
    PFHCTraceImplArea* area,  
    PFHCTraceLevel verbosity  
)  
```  
  
### Parameters  
  
**`area`** &nbsp; PFHCTraceImplArea*  
  
The trace area.  
  
**`verbosity`** &nbsp; [PFHCTraceLevel](../enums/pfhctracelevel.md)  
  
The verbosity level.  
  
  
### Return value
Type: void
  
This should be accessed through macros, such as HC_TRACE_SET_VERBOSITY, rather than called directly.
  
## Remarks  
  

  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
