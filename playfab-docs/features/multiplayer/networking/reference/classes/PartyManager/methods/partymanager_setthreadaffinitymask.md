---
author: jdeweyMSFT
title: "PartyManager::SetThreadAffinityMask"
description: Optionally configures the processor on which internal Party library threads will run.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
---

# PartyManager::SetThreadAffinityMask  

Optionally configures the processor on which internal Party library threads will run.  

## Syntax  
  
```cpp
PartyError SetThreadAffinityMask(  
    PartyThreadId threadId,  
    uint64_t threadAffinityMask  
)  
```  
  
### Parameters  
  
**`threadId`** &nbsp; [PartyThreadId](../../../enums/partythreadid.md)  
  
The type of internal Party library thread to configure processor affinity.  
  
**`threadAffinityMask`** &nbsp; uint64_t  
  
The affinity mask for this type of Party library thread.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
This method enables the title to configure the processor affinity for internal Party library threads of a given type. The ``Audio`` type controls both the internal audio thread and the XAudio2 thread. Refer to [PartyThreadId](../../../enums/partythreadid.md) for more information.<br /><br /> This method may be called at any time before or after [Initialize()](partymanager_initialize.md) and will take effect immediately. Thread processor settings are persisted across calls to [Cleanup()](partymanager_cleanup.md) and Initialize(). When there are more than 64 cores present, this method always applies to processor group 0.   <br /><br /> In order to specify any processor, pass ```c_anyProcessor``` as the `threadAffinityMask` parameter. This is also the default value the Party library will use if this method is never called.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyThreadId](../../../enums/partythreadid.md)  
[PartyManager::GetThreadAffinityMask](partymanager_getthreadaffinitymask.md)
  
  
