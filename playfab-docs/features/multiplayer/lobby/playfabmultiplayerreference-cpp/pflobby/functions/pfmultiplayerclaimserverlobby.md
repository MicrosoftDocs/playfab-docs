---
author: ScottMunroMS
title: "PFMultiplayerClaimServerLobby"
description: "Claim ownership of a pre-existing server lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFMultiplayerClaimServerLobby  

Claim ownership of a pre-existing server lobby.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerClaimServerLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* server,  
    const char* lobbyId,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`server`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key of the game server claiming the lobby. It's entity type must be "game_server".  
  
**`lobbyId`** &nbsp; char*  
*is null-terminated*  
  
The ID of the Lobby to claim.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`lobby`** &nbsp; PFLobbyHandle*  
*optional, library-allocated output*  
  
The optional, output lobby object which can be used to queue operations for immediate execution of this operation completes.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyClaimServerLobbyCompletedStateChange](../structs/pflobbyclaimserverlobbycompletedstatechange.md) with the [PFLobbyClaimServerLobbyCompletedStateChange::result](../structs/pflobbyclaimserverlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyClaimServerLobbyCompletedStateChange](../structs/pflobbyclaimserverlobbycompletedstatechange.md) with the [PFLobbyClaimServerLobbyCompletedStateChange::result](../structs/pflobbyclaimserverlobbycompletedstatechange.md) field set to a failure.   <br /><br /> This operation is primarily intended to support game_server entities taking ownership of server-owned lobbies who's owners have disconnected or will disconnect. Typically, this is interesting for game_server entities who want to migrate ownership to another game_server entity or game_server entities who need to recover ownership of their own servers after some fatal failure which causes them to lose access to the lobby handle such as a crash.   <br /><br /> A game server may not claim ownership of a lobby which another another game_server entity is currently connected to.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
