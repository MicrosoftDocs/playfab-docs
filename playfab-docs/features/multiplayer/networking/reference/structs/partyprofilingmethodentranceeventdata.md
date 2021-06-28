---
author: jdeweyMSFT
title: "PartyProfilingMethodEntranceEventData"
description: "Information specific to the *MethodEntrance* type of profiling event."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 06/23/2021
---

# PartyProfilingMethodEntranceEventData  

Information specific to the *MethodEntrance* type of profiling event.  

## Syntax  
  
```cpp
typedef struct PartyProfilingMethodEntranceEventData {  
    PartyString methodName;  
} PartyProfilingMethodEntranceEventData  
```
  
### Members  
  
**`methodName`** &nbsp; [PartyString](../typedefs.md)  
  
A string containing the fully qualified name of the method responsible for the callback.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyProfilingMethodEntranceCallback](../callbacks/partyprofilingmethodentrancecallback.md)
  
  

