---
author: ScottMunroMS
title: "PartyXblThreadId"
description: "Threads that Party Xbox Live Helper library uses for internal purposes."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/14/2023
---

# PartyXblThreadId  

Threads that Party Xbox Live Helper library uses for internal purposes.    

## Syntax  
  
```cpp
enum class PartyXblThreadId    
{  
    WebRequest = 0,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| WebRequest | Represents the Party Xbox Live Helper library internal web request threads.<br/><br/> The internal networking thread is driven from both network I/O and polling mechanisms. It wakes every 50 to 100 milliseconds or whenever network traffic is received. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  
[PartyXblManager::GetThreadAffinityMask](../classes/PartyXblManager/methods/partyxblmanager_getthreadaffinitymask.md)  
[PartyXblManager::SetThreadAffinityMask](../classes/PartyXblManager/methods/partyxblmanager_setthreadaffinitymask.md)
  
  
