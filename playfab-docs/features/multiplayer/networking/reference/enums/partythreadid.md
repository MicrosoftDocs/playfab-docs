---
author: jdeweyMSFT
title: "PartyThreadId"
description: "High-level categorization of internal processing tasks."
ms.author: jdewey
ms.topic: reference
ms.service: playfab
ms.date: 03/11/2022
---

# PartyThreadId  

High-level categorization of internal processing tasks.    

## Syntax  
  
```cpp
enum class PartyThreadId    
{  
    Audio = 0,  
    Networking = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Audio | Represents the internal processing task related to audio. |  
| Networking | Represents the internal processing task related to networking. |  
  
## Remarks  
  
When used with [PartyManager::GetWorkMode()](../classes/PartyManager/methods/partymanager_getworkmode.md) and [PartyManager::SetWorkMode()](../classes/PartyManager/methods/partymanager_setworkmode.md), allows the title to read and write (respectively) the work mode for the associated internal processing task. Title interaction with the internal processing task differs greatly depending on the currently-configured work mode. <br /><br /> When the work mode of the processing task associated with [PartyThreadId::Audio](partythreadid.md) is set to [PartyWorkMode::Automatic](partyworkmode.md), the task is performed by the Party library using internally-managed, high priority, frequently-running threads with real-time requirements. On Windows and Xbox consoles, these audio threads interact directly with XAudio2 every 40 milliseconds. The Party library's instance(s) of XAudio2 will be initialized with a processor affinity that corresponds to the processor affinity configured for the audio thread type via [PartyManager::SetThreadAffinityMask()](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md). If no processor affinity is specified for the audio thread type, the instance(s) of XAudio2 will be initialized with a processor affinity of XAUDIO2_DEFAULT_PROCESSOR.   <br /><br /> Similarly, when the work mode of the processing task associated with [PartyThreadId::Networking](partythreadid.md) is set to [PartyWorkMode::Automatic](partyworkmode.md), networking threads are created and managed internally. These threads are driven from both network I/O and polling mechanisms, waking every 50 to 100 milliseconds or whenever network traffic is received.   <br /><br /> For all processing tasks, when the work mode is set to [PartyWorkMode::Automatic](partyworkmode.md), title interaction/responsibility is limited to specifying the processor affinity of associated internal worker threads via [PartyManager::SetThreadAffinityMask()](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md). Alternatively, when a processing task's work mode is set to [PartyWorkMode::Manual](partyworkmode.md), internal worker threads are no longer created and managed by the Party library. Instead, it becomes the title's responsibility to perform the required processing via periodic calls to [PartyManager::DoWork()](../classes/PartyManager/methods/partymanager_dowork.md). The periodicity of these calls should match that of the internal threads that are created when the work mode is [PartyWorkMode::Automatic](partyworkmode.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetThreadAffinityMask](../classes/PartyManager/methods/partymanager_getthreadaffinitymask.md)  
[PartyManager::SetThreadAffinityMask](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md)  
[PartyManager::SetWorkMode](../classes/PartyManager/methods/partymanager_setworkmode.md)  
[PartyManager::GetWorkMode](../classes/PartyManager/methods/partymanager_getworkmode.md)  
[PartyManager::DoWork](../classes/PartyManager/methods/partymanager_dowork.md)
  
  
