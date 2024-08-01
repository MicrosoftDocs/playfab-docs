---
author: ScottMunroMS
title: "PFLobbyServerLeaveAsServer"
description: "Requests that the server leave the client-owned lobby it's currently in."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyServerLeaveAsServer  

Requests that the server leave the client-owned lobby it's currently in.  

## Syntax  
  
```cpp
HRESULT PFLobbyServerLeaveAsServer(  
    PFLobbyHandle lobby,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This method queues an asynchronous operation to exit the client-owned lobby. On completion, a [PFLobbyServerLeaveLobbyAsServerCompletedStateChange](../structs/pflobbyserverleavelobbyasservercompletedstatechange.md) is provided indicating that the operation completed.   <br /><br /> This operation is restricted to client-owned lobbies that are using connections.   <br /><br /> Any server-owned data previously added to the lobby is NOT automatically deleted when the server leaves the lobby. If there's a desire to also delete the serverData, it should be explicitly done by calling [PFLobbyServerPostUpdateAsServer()](pflobbyserverpostupdateasserver.md) before leaving the lobby.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
