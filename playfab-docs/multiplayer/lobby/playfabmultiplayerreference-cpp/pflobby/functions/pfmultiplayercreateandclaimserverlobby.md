---
author: ScottMunroMS
title: "PFMultiplayerCreateAndClaimServerLobby"
description: "Create a new lobby as a game_server entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFMultiplayerCreateAndClaimServerLobby  

Create a new lobby as a game_server entity.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerCreateAndClaimServerLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* server,  
    const PFLobbyCreateConfiguration* createConfiguration,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`server`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key of the game server creating the lobby. It's entity type must be "game_server".  
  
**`createConfiguration`** &nbsp; [PFLobbyCreateConfiguration*](../structs/pflobbycreateconfiguration.md)  
  
The initial configuration data used when creating the lobby.  
  
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
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyCreateAndClaimServerLobbyCompletedStateChange](../structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) with the [PFLobbyCreateAndClaimServerLobbyCompletedStateChange::result](../structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyCreateAndClaimServerLobbyCompletedStateChange](../structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) with the [PFLobbyCreateAndClaimServerLobbyCompletedStateChange::result](../structs/pflobbycreateandclaimserverlobbycompletedstatechange.md) field set to a failure.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
