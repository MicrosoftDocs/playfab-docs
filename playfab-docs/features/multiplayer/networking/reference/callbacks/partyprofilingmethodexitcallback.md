---
author: jdeweyMSFT
title: "PartyProfilingMethodExitCallback"
description: "A callback invoked every time the Party library is about to exit an instrumented method."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/22/2021
---

# PartyProfilingMethodExitCallback  

A callback invoked every time the Party library is about to exit an instrumented method.  

## Syntax  
  
```cpp
typedef
void (*PartyProfilingMethodExitCallback)(  
    const PartyProfilingMethodExitEventData* eventData  
)  
```  
  
### Parameters  
  
**`eventData`** &nbsp; [PartyProfilingMethodExitEventData*](../structs/partyprofilingmethodexiteventdata.md)  
  
A constant pointer to a structure containing additional information which may be of use when profiling this event. The data referenced by this pointer is guaranteed to be valid only for the duration the callback.  
  
  
### Return value
Type: void
  
The callback does not return a value.  
  
## Remarks  
  
This callback is optionally installed using the [PartyManager::SetProfilingCallbacksForMethodEntryExit()](../classes/PartyManager/methods/partymanager_setprofilingcallbacksformethodentryexit.md) method, which also details the types of profiled events available to a caller. <br /><br /> In order to minimize the impact of profiling on title performance, callbacks should be kept as lightweight as possible as they are expected to fire hundreds or thousands of times per second.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyProfilingMethodExitEventData](../structs/partyprofilingmethodexiteventdata.md)  
[PartyManager::SetProfilingCallbacksForMethodEntryExit](../classes/PartyManager/methods/partymanager_setprofilingcallbacksformethodentryexit.md)  
[PartyManager::GetProfilingCallbacksForMethodEntryExit](../classes/PartyManager/methods/partymanager_getprofilingcallbacksformethodentryexit.md)
  
  
