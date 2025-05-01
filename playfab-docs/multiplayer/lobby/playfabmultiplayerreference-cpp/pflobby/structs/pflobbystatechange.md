---
author: ScottMunroMS
title: "PFLobbyStateChange"
description: "A generic, base structure representation of an event or change in state in the Lobby library."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/11/2023
---

# PFLobbyStateChange  

A generic, base structure representation of an event or change in state in the Lobby library.  

## Syntax  
  
```cpp
struct PFLobbyStateChange {  
    PFLobbyStateChangeType stateChangeType;  
}  
```
  
### Members  
  
**`stateChangeType`** &nbsp; [PFLobbyStateChangeType](../enums/pflobbystatechangetype.md)  
  
The specific type of the state change represented.
  
Use this field to determine which corresponding derived structure is represented by this PFLobbyStateChange structure header.
  
## Remarks  
  
PFLobbyStateChange structures are reported by [PFMultiplayerStartProcessingLobbyStateChanges()](../functions/pfmultiplayerstartprocessinglobbystatechanges.md) for the title to handle and then promptly pass back via the [PFMultiplayerFinishProcessingLobbyStateChanges()](../functions/pfmultiplayerfinishprocessinglobbystatechanges.md) method. <br /><br /> The ```stateChangeType``` field indicates which kind of state change occurred, and this base structure should then be cast to a more specific derived structure to retrieve additional event-specific information.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFMultiplayerStartProcessingLobbyStateChanges](../functions/pfmultiplayerstartprocessinglobbystatechanges.md)  
[PFMultiplayerFinishProcessingLobbyStateChanges](../functions/pfmultiplayerfinishprocessinglobbystatechanges.md)
  
  
