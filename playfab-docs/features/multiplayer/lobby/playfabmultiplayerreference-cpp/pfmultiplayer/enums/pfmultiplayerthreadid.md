---
author: tomcoMSFT
title: "PFMultiplayerThreadId"
description: "Threads that Multiplayer library uses for internal purposes."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/09/2021
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
  
  
