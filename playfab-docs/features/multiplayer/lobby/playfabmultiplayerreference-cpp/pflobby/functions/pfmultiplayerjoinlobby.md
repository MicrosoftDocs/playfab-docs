---
author: ScottMunroMS
title: "PFMultiplayerJoinLobby"
description: "Join a lobby as the local PlayFab entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMultiplayerJoinLobby  

Join a lobby as the local PlayFab entity.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerJoinLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* newMember,  
    const char* connectionString,  
    const PFLobbyJoinConfiguration* configuration,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`newMember`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local entity joining the lobby.  
  
**`connectionString`** &nbsp; char*  
*is null-terminated*  
  
The connection string used by the entity to join the lobby.  
  
**`configuration`** &nbsp; [PFLobbyJoinConfiguration*](../structs/pflobbyjoinconfiguration.md)  
  
The initial configuration data used when joining the lobby.  
  
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
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) and [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) with the [PFLobbyJoinLobbyCompletedStateChange::result](../structs/pflobbyjoinlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) with the [PFLobbyJoinLobbyCompletedStateChange::result](../structs/pflobbyjoinlobbycompletedstatechange.md) field set to a failure.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
