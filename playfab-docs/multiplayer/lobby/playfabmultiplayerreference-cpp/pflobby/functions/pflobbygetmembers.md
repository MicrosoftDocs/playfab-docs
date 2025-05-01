---
author: ScottMunroMS
title: "PFLobbyGetMembers"
description: "Gets the list of PlayFab entities currently joined to the lobby as members."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/07/2023
---

# PFLobbyGetMembers  

Gets the list of PlayFab entities currently joined to the lobby as members.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetMembers(  
    PFLobbyHandle lobby,  
    uint32_t* memberCount,  
    const PFEntityKey** members  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`memberCount`** &nbsp; uint32_t*  
*output*  
  
The output member count.  
  
**`members`** &nbsp; [PFEntityKey**](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*library-allocated output array of size `*memberCount`*  
  
The output member array.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object is still in the process of asynchronously being created, joined, or claimed, via a call to [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), [PFMultiplayerCreateAndClaimServerLobby()](pfmultiplayercreateandclaimserverlobby.md), or [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md), this method will return no members. <br /><br /> If this lobby is server-owned, the owning game_server entity will <b>not</b> be returned in this list of members.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
