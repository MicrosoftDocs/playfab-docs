---
author: ScottMunroMS
title: "PFLobbySendInvite"
description: "Send an invite to this lobby from the local user to the invited entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/14/2022
---

# PFLobbySendInvite  

Send an invite to this lobby from the local user to the invited entity.  

## Syntax  
  
```cpp
HRESULT PFLobbySendInvite(  
    PFLobbyHandle lobby,  
    const PFEntityKey* sender,  
    const PFEntityKey* invitee,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`sender`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local user sending the invite.  
  
**`invitee`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The invited entity.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbySendInviteCompletedStateChange](../structs/pflobbysendinvitecompletedstatechange.md) with the [PFLobbySendInviteCompletedStateChange::result](../structs/pflobbysendinvitecompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbySendInviteCompletedStateChange](../structs/pflobbysendinvitecompletedstatechange.md) with the [PFLobbySendInviteCompletedStateChange::result](../structs/pflobbysendinvitecompletedstatechange.md) field set to a failure. <br /><br /> The `sender` must be a local user of this lobby which joined from this client.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
