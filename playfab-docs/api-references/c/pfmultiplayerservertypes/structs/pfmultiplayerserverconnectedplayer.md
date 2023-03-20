---
author: jasonsandlin
title: "PFMultiplayerServerConnectedPlayer"
description: "PFMultiplayerServerConnectedPlayer data model."
ms.author: jasonsa
ms.topic: reference
ms.service: playfab
ms.date: 03/09/2023
---

# PFMultiplayerServerConnectedPlayer  

PFMultiplayerServerConnectedPlayer data model.  

## Syntax  
  
```cpp
typedef struct PFMultiplayerServerConnectedPlayer {  
    const char* playerId;  
} PFMultiplayerServerConnectedPlayer;  
```
  
### Members  
  
**`playerId`** &nbsp; const char*  
*is null-terminated*  
  
(Optional) The player ID of the player connected to the multiplayer server.
  
  
## Requirements  
  
**Header:** PFMultiplayerServerTypes.h
  
## See also  
[PFMultiplayerServerTypes members](../pfmultiplayerservertypes_members.md)  

  
  
