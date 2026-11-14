---
author: ScottMunroMS
title: "PartyXblThreadId"
description: "Threads that Party XBOX Live Helper library uses for internal purposes."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
---

# PartyXblThreadId  

Threads that Party XBOX Live Helper library uses for internal purposes.    

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
| WebRequest | Represents the Party XBOX Live Helper library internal web request threads.<br/><br/> The internal networking thread is driven from both network I/O and polling mechanisms. It wakes every 50 to 100 milliseconds or whenever network traffic is received. |  
  
  
## Requirements  
  
**Header:** PartyXboxLive.h

**Library:** PartyXboxLive.lib

**Supported platforms:** Windows PC, XBOX One family consoles, and XBOX Series X|S consoles, in the XBOX Game Development Kit (GDK). For the Party SDKs for other platforms, see [PlayFab Party SDKs](../../party-sdks.md).
  
## See also  
[PartyXboxLive members](../partyxboxlive_members.md)  
[PartyXblManager::GetThreadAffinityMask](../classes/PartyXblManager/methods/partyxblmanager_getthreadaffinitymask.md)  
[PartyXblManager::SetThreadAffinityMask](../classes/PartyXblManager/methods/partyxblmanager_setthreadaffinitymask.md)
  
  
