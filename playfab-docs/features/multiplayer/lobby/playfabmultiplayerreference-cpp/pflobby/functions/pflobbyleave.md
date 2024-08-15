---
author: ScottMunroMS
title: "PFLobbyLeave"
description: "Request one or all local users to leave the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyLeave  

Request one or all local users to leave the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyLeave(  
    PFLobbyHandle lobby,  
    const PFEntityKey* localUser,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`localUser`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*optional*  
  
An optional value to indicate if a specific local user should leave the lobby. If this value is nullptr, all local users will leave the lobby.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This method queues an asynchronous operation to remove one or all local users from the lobby. On completion, a [PFLobbyLeaveLobbyCompletedStateChange](../structs/pflobbyleavelobbycompletedstatechange.md) will be provided indicating that the operation has completed. <br /><br /> This method does not guarantee the leave will succeed. The operation may fail due to networking or service errors. If the leave attempt fails but is retriable, the library will continue to retry the leave operation. Otherwise, the local client will disconnect the requested local members from the lobby, but leave them as members. They will remain as disconnected members until they rejoin.   <br /><br /> This method cannot be called by a game_server entity.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
