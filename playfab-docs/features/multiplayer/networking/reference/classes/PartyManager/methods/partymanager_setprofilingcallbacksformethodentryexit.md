---
author: jdeweyMSFT
title: "PartyManager::SetProfilingCallbacksForMethodEntryExit"
description: Optionally configures the profiling event callbacks the Party library will make when entering or exiting instrumented methods.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyManager::SetProfilingCallbacksForMethodEntryExit  

Optionally configures the profiling event callbacks the Party library will make when entering or exiting instrumented methods.  

## Syntax  
  
```cpp
PartyError SetProfilingCallbacksForMethodEntryExit(  
    PartyProfilingMethodEntranceCallback profilingMethodEntranceCallback,  
    PartyProfilingMethodExitCallback profilingMethodExitCallback  
)  
```  
  
### Parameters  
  
**`profilingMethodEntranceCallback`** &nbsp; [PartyProfilingMethodEntranceCallback](../../../callbacks/partyprofilingmethodentrancecallback.md)  
*optional*  
  
The callback to be made when the Party library enters an internal method which is instrumented for profiling.  
  
**`profilingMethodExitCallback`** &nbsp; [PartyProfilingMethodExitCallback](../../../callbacks/partyprofilingmethodexitcallback.md)  
*optional*  
  
The callback to be made when the Party library is about to exit an internal method which is instrumented for profiling.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method allows the title to install custom profiling callback functions in order to record and visualize Party library performance metrics in external profiling tools. <br /><br /> This method can only be called when the Party library is uninitialized. Calling while Party is initialized will fail and return an error.   <br /><br /> Setting an optional callback equal to ```nullptr``` will cause the Party library to not make any profiling callbacks for that event type.   <br /><br /> In order to minimize the impact of profiling on title performance, callbacks for these events should be kept as lightweight as possible, as they are expected to fire hundreds or thousands of times per second.   <br /><br /> This method is only supported on the Windows and Microsoft Game Core versions of the library. Calls on other platforms will fail.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyProfilingMethodEntranceCallback](../../../callbacks/partyprofilingmethodentrancecallback.md)  
[PartyProfilingMethodExitCallback](../../../callbacks/partyprofilingmethodexitcallback.md)  
[PartyManager::GetProfilingCallbacksForMethodEntryExit](partymanager_getprofilingcallbacksformethodentryexit.md)
  
  
