---
author: jdeweyMSFT
title: "PartyProfilingMethodExitEventData"
description: "Information specific to the *MethodExit* type of profiling event."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyProfilingMethodExitEventData  

Information specific to the *MethodExit* type of profiling event.  

## Syntax  
  
```cpp
struct PartyProfilingMethodExitEventData {  
    PartyString methodName;  
}  
```
  
### Members  
  
**`methodName`** &nbsp; [PartyString](../typedefs.md)  
  
A string containing the fully qualified name of the method responsible for the callback.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyProfilingMethodExitCallback](../callbacks/partyprofilingmethodexitcallback.md)
  
  
