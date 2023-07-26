---
author: jasonsandlin
title: "PFHCTraceImplMessage"
description: "Send a trace message."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 06/20/2023
---

# PFHCTraceImplMessage  

Send a trace message.  

## Syntax  
  
```cpp
void PFHCTraceImplMessage(  
    uint64_t PFHCTraceImplScopeId  
)  
```  
  
### Parameters  
  
**`PFHCTraceImplScopeId`** &nbsp; uint64_t  
  
TBD    
  
  
### Return value
Type: void
  

  
## Remarks  
  
This should be accessed through macros, such as HC_TRACE_MESSAGE, rather than called directly.
  
## Requirements  
  
**Header:** PFHCTrace.h
  
## See also  
[PFHCTrace members](../pfhctrace_members.md)  

  
  
