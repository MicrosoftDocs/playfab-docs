---
author: ScottMunroMS
title: "PartyXblManager::SetThreadAffinityMask"
description: Optionally configures the processor on which internal Party XBOX Live Helper library threads will run.
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblManager::SetThreadAffinityMask  

Optionally configures the processor on which internal Party XBOX Live Helper library threads will run.  

## Syntax  
  
```cpp
static PartyError SetThreadAffinityMask(  
    PartyXblThreadId threadId,  
    uint64_t threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyXblThreadId](../../../enums/partyxblthreadid.md)  
  
The type of internal library thread for which processor affinity should be retrieved.  
  
**`threadAffinityMask`** &nbsp; uint64_t  
  
The affinity mask for this type of Party thread.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partyxblmanager_geterrormessage.md).
  
## Remarks  
  
This method enables the application to configure the processor affinity for internal Party Xbox Live Helper library thread of a given type. <br /><br /> This method may be called at any time before or after [Initialize()](partyxblmanager_initialize.md) and will take effect immediately. Thread processor settings are persisted across calls to [Cleanup()](partyxblmanager_cleanup.md) and Initialize(). When there are more than 64 cores present, this method always applies to processor group 0.   <br /><br /> In order to specify any processor, pass ```c_anyProcessor``` as the `threadAffinityMask` parameter. This is also the default value the Party Xbox Live Helper library will use if this method is never called.
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../../../party-sdks.md).
  
## See also  
[PartyXblManager](../partyxblmanager.md)  
[PartyXblThreadId](../../../enums/partyxblthreadid.md)  
[PartyXblManager::GetThreadAffinityMask](partyxblmanager_getthreadaffinitymask.md)
  
  
