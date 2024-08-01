---
author: ScottMunroMS
title: "PartyXblManager::SetProfilingCallbacksForMethodEntryExit"
description: Optionally configures the profiling event callbacks the Party Xbox Live library will make when entering or exiting instrumented methods.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/14/2023
---

# PartyXblManager::SetProfilingCallbacksForMethodEntryExit  

Optionally configures the profiling event callbacks the Party Xbox Live library will make when entering or exiting instrumented methods.  

## Syntax  
  
```cpp
PartyError SetProfilingCallbacksForMethodEntryExit(  
    PartyProfilingMethodEntranceCallback profilingMethodEntranceCallback,  
    PartyProfilingMethodExitCallback profilingMethodExitCallback  
)  
```  
  
### Parameters  
  
**`profilingMethodEntranceCallback`** &nbsp; PartyProfilingMethodEntranceCallback  
*optional*  
  
The callback to be made when the Party Xbox Live library enters an internal method which is instrumented for profiling.  
  
**`profilingMethodExitCallback`** &nbsp; PartyProfilingMethodExitCallback  
*optional*  
  
The callback to be made when the Party Xbox Live library is about to exit an internal method which is instrumented for profiling.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method allows the title to install custom profiling callback functions in order to record and visualize Party Xbox Live library performance metrics in external profiling tools. <br /><br /> This method can only be called when the Party Xbox Live library is uninitialized. Calling while Party Xbox Live is initialized will fail and return an error.   <br /><br /> Setting an optional callback equal to ```nullptr``` will cause the Party Xbox Live library to not make any profiling callbacks for that event type.   <br /><br /> In order to minimize the impact of profiling on title performance, callbacks for these events should be kept as lightweight as possible, as they are expected to fire hundreds or thousands of times per second.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::GetProfilingCallbacksForMethodEntryExit](partyxblmanager_getprofilingcallbacksformethodentryexit.md)
  
  
