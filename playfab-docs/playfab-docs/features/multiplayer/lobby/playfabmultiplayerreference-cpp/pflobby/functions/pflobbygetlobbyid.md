---
author: ScottMunroMS
title: "PFLobbyGetLobbyId"
description: "Gets the ID of the Lobby."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyGetLobbyId  

Gets the ID of the Lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetLobbyId(  
    PFLobbyHandle lobby,  
    const char** id  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`id`** &nbsp; char**  
*library-allocated output*  
  
The output lobby ID.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object was created by calling [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a successful [PFLobbyCreateAndJoinLobbyCompletedStateChange](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) or [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) respectively.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
