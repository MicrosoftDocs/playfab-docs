---
author: ScottMunroMS
title: "PFLobbyServerPostUpdate"
description: "Post an update to the lobby as the server-owner."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyServerPostUpdate  

Post an update to the lobby as the server-owner.  

## Syntax  
  
```cpp
HRESULT PFLobbyServerPostUpdate(  
    PFLobbyHandle lobby,  
    const PFLobbyDataUpdate* lobbyUpdate,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`lobbyUpdate`** &nbsp; [PFLobbyDataUpdate*](../structs/pflobbydataupdate.md)  
  
An update to apply to the shared portion of the lobby on behalf of the server owner.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyServerPostUpdateCompletedStateChange](../structs/pflobbyserverpostupdatecompletedstatechange.md) with the [PFLobbyServerPostUpdateCompletedStateChange::result](../structs/pflobbyserverpostupdatecompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyServerPostUpdateCompletedStateChange](../structs/pflobbyserverpostupdatecompletedstatechange.md) with the [PFLobbyServerPostUpdateCompletedStateChange::result](../structs/pflobbyserverpostupdatecompletedstatechange.md) field set to a failure. If applying the update would change the state of the lobby, the title will be provided a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) sometime afterwards.   <br /><br /> This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state will not reflect this update until a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) is provided to the title with the updated state.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  
[PFLobbyPostUpdate](pflobbypostupdate.md)
  
  
