---
author: ScottMunroMS
title: "PFLobbyPostUpdate"
description: "Post an update to the lobby."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyPostUpdate  

Post an update to the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyPostUpdate(  
    PFLobbyHandle lobby,  
    const PFEntityKey* localUser,  
    const PFLobbyDataUpdate* lobbyUpdate,  
    const PFLobbyMemberDataUpdate* memberUpdate,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`localUser`** &nbsp; PFEntityKey*  
  
The local user posting the update.  
  
**`lobbyUpdate`** &nbsp; [PFLobbyDataUpdate*](../structs/pflobbydataupdate.md)  
*optional*  
  
An optional update to apply to the shared portion of the lobby on behalf of `localUser`. If this is not provided, `memberUpdate` must be provided.  
  
**`memberUpdate`** &nbsp; [PFLobbyMemberDataUpdate*](../structs/pflobbymemberdataupdate.md)  
*optional*  
  
An optional update to apply to the portion of the lobby owned by `localUser`. If this is not provided, `lobbyUpdate` must be provided.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyPostUpdateCompletedStateChange](../structs/pflobbypostupdatecompletedstatechange.md) with the [PFLobbyPostUpdateCompletedStateChange::result](../structs/pflobbypostupdatecompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyPostUpdateCompletedStateChange](../structs/pflobbypostupdatecompletedstatechange.md) with the [PFLobbyPostUpdateCompletedStateChange::result](../structs/pflobbypostupdatecompletedstatechange.md) field set to a failure. If applying the update would change the state of the lobby, the title will be provided a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) sometime afterwards. <br /><br /> This operation completing successfully only indicates that the Lobby service has accepted the update. The title's local view of the Lobby state will not reflect this update until a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) is provided to the title with the updated state.   <br /><br /> The `lobbyUpdate` contains fields that can only be modified by the owner of the lobby. This method will return an error if one of those fields is specified and `localUser` is not the owner of the lobby.   <br /><br /> If both a `lobbyUpdate` and `memberUpdate` are supplied to this method on behalf of a single entity, both updates will happpen atomically.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
