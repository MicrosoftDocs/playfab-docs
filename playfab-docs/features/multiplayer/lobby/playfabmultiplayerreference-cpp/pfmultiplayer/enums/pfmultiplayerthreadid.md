---
author: ScottMunroMS
title: "PFMultiplayerThreadId"
description: "Threads that Multiplayer library uses for internal purposes."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFMultiplayerThreadId  

Threads that Multiplayer library uses for internal purposes.    

## Syntax  
  
```cpp
enum class PFMultiplayerThreadId  : uint32_t  
{  
    Networking = 0,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| Networking | Represents Multiplayer library internal networking threads |  
  
  
## Requirements  
  
**Header:** PFMultiplayer.h
  
## See also  
[PFMultiplayer members](../pfmultiplayer_members.md)  
[PFMultiplayerSetThreadAffinityMask](../functions/pfmultiplayersetthreadaffinitymask.md)
  
  
