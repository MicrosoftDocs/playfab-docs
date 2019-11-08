---
author: jdeweyMSFT
title: "PartyThreadId"
description: "Types of threads that Party library uses for internal purposes."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 10/30/2019
---

# PartyThreadId  

Types of threads that Party library uses for internal purposes.    

## Syntax  
  
```cpp
enum class PartyThreadId    
{  
    Audio,  
    Networking,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Audio | Represents Party library internal audio threads. |  
| Networking | Represents Party library internal networking threads. |  
  
## Remarks  
  
Party library internal audio threads are high priority, frequently-running threads with real-time requirements. <br /><br /> On Windows, these audio threads interact directly with XAudio2 every 40 milliseconds. The Party library's instance(s) of XAudio2 will be initialized with a processor affinity that corresponds to the processor affinity configured for the audio thread type via [PartyManager::SetThreadAffinityMask()](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md). If no processor affinity is specified for the audio thread type, the instance(s) of XAudio2 will be initialized with a processor affinity of XAUDIO2_DEFAULT_PROCESSOR.   <br /><br /> Party library internal networking threads are driven from both network I/O and polling mechanisms. These wake every 50 to 100 milliseconds or whenever network traffic is received.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::GetThreadAffinityMask](../classes/PartyManager/methods/partymanager_getthreadaffinitymask.md)  
[PartyManager::SetThreadAffinityMask](../classes/PartyManager/methods/partymanager_setthreadaffinitymask.md)
  
  
