---
author: ScottMunroMS
title: "PFMultiplayerJoinLobbyAsServer"
description: "Join a client-owned lobby as a server."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFMultiplayerJoinLobbyAsServer  

Join a client-owned lobby as a server.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerJoinLobbyAsServer(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* server,  
    const char* connectionString,  
    const PFLobbyServerJoinConfiguration* configuration,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`server`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key of the server joining the lobby. Its entity type must be "game_server".  
  
**`connectionString`** &nbsp; char*  
*is null-terminated*  
  
The connection string used by the server to join the lobby.  
  
**`configuration`** &nbsp; [PFLobbyServerJoinConfiguration*](../structs/pflobbyserverjoinconfiguration.md)  
  
The initial server-owned data to be stored when joining the lobby.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`lobby`** &nbsp; PFLobbyHandle*  
*optional, library-allocated output*  
  
The optional, output lobby object, which can be used to queue operations for immediate execution of this operation completes.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This is an asynchronous operation. Completion of this method's execution isn't necessarily completion of the operation.   <br /><br /> Upon successful completion, the title is provided a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with the [PFLobbyUpdatedStateChange::serverUpdate](../structs/pflobbyupdatedstatechange.md) member appropriately populated, and a [PFLobbyJoinLobbyAsServerCompletedStateChange](../structs/pflobbyjoinlobbyasservercompletedstatechange.md) with the [PFLobbyJoinLobbyAsServerCompletedStateChange::result](../structs/pflobbyjoinlobbyasservercompletedstatechange.md) field set to ```S_OK```.   <br /><br /> Upon a failed completion, the title is provided a [PFLobbyJoinLobbyAsServerCompletedStateChange](../structs/pflobbyjoinlobbyasservercompletedstatechange.md) with the [PFLobbyJoinLobbyAsServerCompletedStateChange::result](../structs/pflobbyjoinlobbyasservercompletedstatechange.md) field set to a failure.   <br /><br /> This operation is restricted to client-owned lobbies that are using connections.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
