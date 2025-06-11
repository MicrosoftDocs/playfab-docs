---
author: ScottMunroMS
title: "PFMultiplayerConnectToLobby"
description: "Connect to a lobby in which the local PlayFab entity was already added as a member."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 06/10/2025
---

# PFMultiplayerConnectToLobby  

Connect to a lobby in which the local PlayFab entity was already added as a member.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerConnectToLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* newMember,  
    const char* lobbyId,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`newMember`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local entity connecting to the lobby.  
  
**`lobbyId`** &nbsp; char*  
*is null-terminated*  
  
The ID of the Lobby to connect.  
  
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
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) and [PFLobbyConnectToLobbyCompletedStateChange](../structs/pflobbyconnecttolobbycompletedstatechange.md) with the [PFLobbyConnectToLobbyCompletedStateChange::result](../structs/pflobbyconnecttolobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyConnectToLobbyCompletedStateChange](../structs/pflobbyconnecttolobbycompletedstatechange.md) with the [PFLobbyConnectToLobbyCompletedStateChange::result](../structs/pflobbyconnecttolobbycompletedstatechange.md) field set to a failure.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
