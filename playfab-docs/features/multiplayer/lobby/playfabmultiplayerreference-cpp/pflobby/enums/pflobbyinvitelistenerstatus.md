---
author: ScottMunroMS
title: "PFLobbyInviteListenerStatus"
description: "Values representing the current status of an invite listener."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbyInviteListenerStatus  

Values representing the current status of an invite listener.    

## Syntax  
  
```cpp
enum class PFLobbyInviteListenerStatus  : uint32_t  
{  
    NotListening = 0,  
    Listening = 1,  
    NotAuthorized = 2,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| NotListening | The invite listener has not been started or has been stopped and is not listening for invites. |  
| Listening | The invite listener has been established and is listening for invites. |  
| NotAuthorized | The listening entity was not authorized to establish an invite listener.<br/><br/> This status is fatal. The title should clear the invite listener with [PFMultiplayerStopListeningForLobbyInvites](../functions/pfmultiplayerstoplisteningforlobbyinvites.md). No invites will be received on the corresponding listener after this status update. <br /><br /> Receiving this status likely represents a programming error where an invalid entity has been passed to ```PFMultiplayerStopListeningForLobbyInvites```. |  
  
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
