---
author: ScottMunroMS
title: "PFMultiplayerJoinArrangedLobby"
description: "Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMultiplayerJoinArrangedLobby  

Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerJoinArrangedLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* newMember,  
    const char* arrangementString,  
    const PFLobbyArrangedJoinConfiguration* configuration,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`newMember`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local PlayFab entity joining the lobby.  
  
**`arrangementString`** &nbsp; char*  
*is null-terminated*  
  
The arrangement string used by the entity to join the lobby.  
  
**`configuration`** &nbsp; [PFLobbyArrangedJoinConfiguration*](../structs/pflobbyarrangedjoinconfiguration.md)  
  
The initial configuration data used to initialize the lobby, if no one has joined the lobby yet.  
  
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
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyJoinArrangedLobbyCompletedStateChange](../structs/pflobbyjoinarrangedlobbycompletedstatechange.md) with the [PFLobbyJoinArrangedLobbyCompletedStateChange::result](../structs/pflobbyjoinarrangedlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyJoinArrangedLobbyCompletedStateChange](../structs/pflobbyjoinarrangedlobbycompletedstatechange.md) with the [PFLobbyJoinArrangedLobbyCompletedStateChange::result](../structs/pflobbyjoinarrangedlobbycompletedstatechange.md) field set to a failure. <br /><br /> When using matchmaking through this library, the [PFMatchmakingMatchDetails::lobbyArrangementString](../../pfmatchmaking/structs/pfmatchmakingmatchdetails.md) can be used with this method to join a lobby with all of the users that have been matched together.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
