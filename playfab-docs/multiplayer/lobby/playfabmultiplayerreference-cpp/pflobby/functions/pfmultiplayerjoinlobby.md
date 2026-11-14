---
author: ScottMunroMS
title: "PFMultiplayerJoinLobby"
description: "Join a lobby as the local PlayFab entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: "11/13/2026"
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
  
**`newMember`** &nbsp; [const PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The local entity joining the lobby.  
  
**`connectionString`** &nbsp; const char*  
*is null-terminated*  
  
The connection string used by the entity to join the lobby.  
  
**`configuration`** &nbsp; [const PFLobbyJoinConfiguration*](../structs/pflobbyjoinconfiguration.md)  
  
The initial configuration data used when joining the lobby.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
**`lobby`** &nbsp; PFLobbyHandle*  
*optional, library-allocated output*  
  
An optional output lobby handle. If the call succeeds, the handle is available immediately, before the asynchronous operation completes, and you can use it to queue other operations on the lobby.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) and [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) with the [PFLobbyJoinLobbyCompletedStateChange::result](../structs/pflobbyjoinlobbycompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md) with the [PFLobbyJoinLobbyCompletedStateChange::result](../structs/pflobbyjoinlobbycompletedstatechange.md) field set to a failure.
  
Before you call this function, call [PFMultiplayerSetEntityToken](../../pfmultiplayer/functions/pfmultiplayersetentitytoken.md) for `newMember`. If no token is set for that entity, the call fails synchronously with `0x89236402` and no state change is provided. The call also fails synchronously with `0x89236404` if the `id` or `type` field of `newMember` is null or empty, and with `E_POINTER` if `newMember`, `connectionString` or `configuration` is null. If this call fails synchronously and you supplied the optional `lobby` output, `*lobby` is null. For all error codes, see [PlayFab Multiplayer C++ SDK error codes](../../pfmultiplayererrors.md).
  
## Requirements  
  
**Header:** PFLobby.h  
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
