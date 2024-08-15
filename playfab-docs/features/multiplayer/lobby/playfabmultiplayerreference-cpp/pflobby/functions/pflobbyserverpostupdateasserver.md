---
author: ScottMunroMS
title: "PFLobbyServerPostUpdateAsServer"
description: "Post an update to a client-owned lobby as a joined server."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyServerPostUpdateAsServer  

Post an update to a client-owned lobby as a joined server.  

## Syntax  
  
```cpp
HRESULT PFLobbyServerPostUpdateAsServer(  
    PFLobbyHandle lobby,  
    const PFLobbyServerDataUpdate* serverUpdate,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`serverUpdate`** &nbsp; [PFLobbyServerDataUpdate*](../structs/pflobbyserverdataupdate.md)  
  
An update to apply to the portion of the lobby data owned by the joined server.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This is an asynchronous operation. Upon successful completion, the title is provided a [PFLobbyServerPostUpdateAsServerCompletedStateChange](../structs/pflobbyserverpostupdateasservercompletedstatechange.md) with the [PFLobbyServerPostUpdateAsServerCompletedStateChange::result](../structs/pflobbyserverpostupdateasservercompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title is provided a [PFLobbyServerPostUpdateAsServerCompletedStateChange](../structs/pflobbyserverpostupdateasservercompletedstatechange.md) with the [PFLobbyServerPostUpdateAsServerCompletedStateChange::result](../structs/pflobbyserverpostupdateasservercompletedstatechange.md) field set to a failure. If applying the update would change the state of the lobby, the title is provided a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) sometime afterwards.   <br /><br /> This operation completing successfully only indicates that the Lobby service accepted the update. The title's local view of the Lobby state doesn't reflect this update until a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) is provided to the title with the updated state.   <br /><br /> This operation is restricted to client-owned lobbies that are using connections.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyPostUpdate](pflobbypostupdate.md)
  
  
