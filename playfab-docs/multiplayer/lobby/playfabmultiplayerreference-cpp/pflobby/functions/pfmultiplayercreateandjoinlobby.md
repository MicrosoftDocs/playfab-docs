---
author: ScottMunroMS
title: "PFMultiplayerCreateAndJoinLobby"
description: "Create a new lobby and add the creating PlayFab entity to it."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/15/2022
---

# PFMultiplayerCreateAndJoinLobby  

Create a new lobby and add the creating PlayFab entity to it.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerCreateAndJoinLobby(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* creator,  
    const PFLobbyCreateConfiguration* createConfiguration,  
    const PFLobbyJoinConfiguration* joinConfiguration,  
    void* asyncContext,  
    PFLobbyHandle* lobby  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`creator`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local PlayFab entity creating the lobby.  
  
**`createConfiguration`** &nbsp; [PFLobbyCreateConfiguration*](../structs/pflobbycreateconfiguration.md)  
  
The initial configuration data used when creating the lobby.  
  
**`joinConfiguration`** &nbsp; [PFLobbyJoinConfiguration*](../structs/pflobbyjoinconfiguration.md)  
  
The initial configuration data for the member creating and joining the lobby.  
  
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
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyCreateAndJoinLobbyCompletedStateChange](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) with the [PFLobbyCreateAndJoinLobbyCompletedStateChange::result](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyCreateAndJoinLobbyCompletedStateChange](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) with the [PFLobbyCreateAndJoinLobbyCompletedStateChange::result](../structs/pflobbycreateandjoinlobbycompletedstatechange.md) field set to a failure.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
