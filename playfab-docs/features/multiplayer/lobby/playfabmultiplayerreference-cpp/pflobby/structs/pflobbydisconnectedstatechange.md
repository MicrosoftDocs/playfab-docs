---
author: ScottMunroMS
title: "PFLobbyDisconnectedStateChange"
description: "Information specific to the *Disconnected* type of state change."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFLobbyDisconnectedStateChange  

Information specific to the *Disconnected* type of state change.  

## Syntax  
  
```cpp
struct PFLobbyDisconnectedStateChange : PFLobbyStateChange {  
    PFLobbyHandle lobby;  
}  
```
  
### Members  
  
**`lobby`** &nbsp; PFLobbyHandle  
*must not be null*  
  
The lobby that has disconnected.
  
## Remarks  
  
This state change signals that the lobby has completed disconnecting. This is the last state change that will be provided for this lobby object. Once this state change is returned to [PFMultiplayerFinishProcessingLobbyStateChanges()](../functions/pfmultiplayerfinishprocessinglobbystatechanges.md), the Lobby object memory will become invalid.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
