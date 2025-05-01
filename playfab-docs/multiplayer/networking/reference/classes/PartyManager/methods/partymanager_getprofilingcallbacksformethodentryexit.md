---
author: jdeweyMSFT
title: "PartyManager::GetProfilingCallbacksForMethodEntryExit"
description: Retrieves the profiling event callbacks the Party library is configured to use when entering or exiting instrumented methods.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyManager::GetProfilingCallbacksForMethodEntryExit  

Retrieves the profiling event callbacks the Party library is configured to use when entering or exiting instrumented methods.  

## Syntax  
  
```cpp
PartyError GetProfilingCallbacksForMethodEntryExit(  
    PartyProfilingMethodEntranceCallback* profilingMethodEntranceCallback,  
    PartyProfilingMethodExitCallback* profilingMethodExitCallback  
)  
```  
  
### Parameters  
  
**`profilingMethodEntranceCallback`** &nbsp; [PartyProfilingMethodEntranceCallback*](../../../callbacks/partyprofilingmethodentrancecallback.md)  
*library-allocated output, may return nullptr*  
  
A pointer to the callback made when the Party library enters an internal method which is instrumented for profiling.  
  
**`profilingMethodExitCallback`** &nbsp; [PartyProfilingMethodExitCallback*](../../../callbacks/partyprofilingmethodexitcallback.md)  
*library-allocated output, may return nullptr*  
  
A pointer to the callback made when the Party library is about to exit an internal method which is instrumented for profiling.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method retrieves the profiling callback functions the Party library is calling for the instrumented event types. <br /><br /> A callback equal to ```nullptr``` indicates that the Party library will not make any profiling callbacks for that event type.   <br /><br /> This method is only supported on the Windows and Microsoft Game Core versions of the library. Calls on other platforms will fail.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyProfilingMethodEntranceCallback](../../../callbacks/partyprofilingmethodentrancecallback.md)  
[PartyProfilingMethodExitCallback](../../../callbacks/partyprofilingmethodexitcallback.md)  
[PartyManager::SetProfilingCallbacksForMethodEntryExit](partymanager_setprofilingcallbacksformethodentryexit.md)
  
  
