---
author: jdeweyMSFT
title: "PartyProfilingMethodExitEventData"
description: "Information specific to the *MethodExit* type of profiling event."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 06/23/2021
---

# PartyProfilingMethodExitEventData  

Information specific to the *MethodExit* type of profiling event.  

## Syntax  
  
```cpp
typedef struct PartyProfilingMethodExitEventData {  
    PartyString methodName;  
} PartyProfilingMethodExitEventData  
```
  
### Members  
  
**`methodName`** &nbsp; [PartyString](../typedefs.md)  
  
A string containing the fully qualified name of the method responsible for the callback.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyProfilingMethodExitCallback](../callbacks/partyprofilingmethodexitcallback.md)
  
  

