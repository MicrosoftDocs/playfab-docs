---
author: jdeweyMSFT
title: "PartyThreadId"
description: "High-level categorization of internal processing tasks."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/29/2024
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
  
When used with [PartyManager::GetWorkMode()](../classes/PartyManager/methods/partymanager_getworkmode.md) and [PartyManager::SetWorkMode()](../classes/PartyManager/methods/partymanager_setworkmode.md), allows the title to read and write (respectively) the work mode for the associated internal processing task. Title interaction with the internal processing task differs greatly depending on the currently configured work mode. <br /><br /> When the PartyThreadId::Audio work mode is set to [PartyWorkMode::Automatic](partyworkmode.md), the Party library performs the task using internally managed, high priority, frequently running threads with real-time requirements. On Windows and Xbox consoles, these audio threads interact directly with XAudio2 every 40 milliseconds. Party library instances of XAudio2 are initialized with a processor affinity that corresponds to the processor affinity configured for PartyThreadId::Audio via [PartyManager::SetThreadAffinityMask()](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md). If no processor affinity is specified for the audio thread type, the instance(s) of XAudio2 is initialized with a processor affinity of XAUDIO2_DEFAULT_PROCESSOR.   <br /><br /> When the PartyThreadId::Networking work mode is set to [PartyWorkMode::Automatic](partyworkmode.md), networking threads are created and managed internally. These threads are driven from both network I/O and polling mechanisms, waking every 16 milliseconds to 100 milliseconds or whenever network traffic is received. The processor affinity for these PartyThreadId::Networking threads is optionally configured via [PartyManager::SetThreadAffinityMask()](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md).   <br /><br /> For any PartyThreadId type work mode set to [PartyWorkMode::Manual](partyworkmode.md), the Party library doesn't create internal worker threads and instead it's the title's responsibility to perform the required processing via periodic calls to [PartyManager::DoWork()](../classes/PartyManager/methods/partymanager_dowork.md). The periodicity of those title calls should match or exceed the minimum polling frequencies used by the internal threads when the work mode is [PartyWorkMode::Automatic](partyworkmode.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetThreadAffinityMask](../classes/PartyManager/methods/partymanager_getthreadaffinitymask.md)  
[PartyManager::SetThreadAffinityMask](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md)  
[PartyManager::SetWorkMode](../classes/PartyManager/methods/partymanager_setworkmode.md)  
[PartyManager::GetWorkMode](../classes/PartyManager/methods/partymanager_getworkmode.md)  
[PartyManager::DoWork](../classes/PartyManager/methods/partymanager_dowork.md)
  
  
