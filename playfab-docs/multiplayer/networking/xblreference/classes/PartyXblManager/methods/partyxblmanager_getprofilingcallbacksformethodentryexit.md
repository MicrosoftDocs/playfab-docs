---
author: ScottMunroMS
title: "PartyXblManager::GetProfilingCallbacksForMethodEntryExit"
description: Retrieves the profiling event callbacks the Party Xbox Live library is configured to use when entering or exiting instrumented methods.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/14/2023
---

# PartyXblManager::GetProfilingCallbacksForMethodEntryExit  

Retrieves the profiling event callbacks the Party Xbox Live library is configured to use when entering or exiting instrumented methods.  

## Syntax  
  
```cpp
PartyError GetProfilingCallbacksForMethodEntryExit(  
    PartyProfilingMethodEntranceCallback* profilingMethodEntranceCallback,  
    PartyProfilingMethodExitCallback* profilingMethodExitCallback  
)  
```  
  
### Parameters  
  
**`profilingMethodEntranceCallback`** &nbsp; PartyProfilingMethodEntranceCallback*  
*library-allocated output, may return nullptr*  
  
A pointer to the callback made when the Party Xbox Live library enters an internal method which is instrumented for profiling.  
  
**`profilingMethodExitCallback`** &nbsp; PartyProfilingMethodExitCallback*  
*library-allocated output, may return nullptr*  
  
A pointer to the callback made when the Party Xbox Live library is about to exit an internal method which is instrumented for profiling.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method retrieves the profiling callback functions the Party Xbox Live library is calling for the instrumented event types. <br /><br /> A callback equal to ```nullptr``` indicates that the Party Xbox Live library will not make any profiling callbacks for that event type.
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblManager::SetProfilingCallbacksForMethodEntryExit](partyxblmanager_setprofilingcallbacksformethodentryexit.md)
  
  
