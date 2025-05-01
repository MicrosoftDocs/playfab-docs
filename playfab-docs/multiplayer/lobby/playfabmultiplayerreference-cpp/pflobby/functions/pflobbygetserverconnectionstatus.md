---
author: ScottMunroMS
title: "PFLobbyGetServerConnectionStatus"
description: "Retrieves the lobby server's connection status to the notification service."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/14/2024
---

# PFLobbyGetServerConnectionStatus  

Retrieves the lobby server's connection status to the notification service.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetServerConnectionStatus(  
    PFLobbyHandle lobby,  
    PFLobbyServerConnectionStatus* connectionStatus  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`connectionStatus`** &nbsp; [PFLobbyServerConnectionStatus*](../enums/pflobbyserverconnectionstatus.md)  
*output*  
  
The output connection status of the server.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
When joining a lobby, the library establishes a WebSocket connection to the PlayFab PubSub notification service. This connection is used to provide real-time updates to the library about the lobby. This method can be used to determine the lobby server's connection status, which is useful for diagnosing the lobby server's ability to receive updates about the lobby. <br /><br /> Non-owning Lobby servers can only join client-owned lobbies. If no server is joined to the client-owned lobby, this method returns an appropriate error code.   <br /><br /> A lobby server, which is still in the process of asynchronously joining the lobby, via a call to [PFMultiplayerJoinLobbyAsServer()](pfmultiplayerjoinlobbyasserver.md) sees its connection status as [PFLobbyServerConnectionStatus::NotConnected](../enums/pflobbyserverconnectionstatus.md) until the connection is established.   <br /><br /> A change to a lobby server's connection status is indicated to the title via a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with the ```PFLobbyUpdatedStateChange::serverConnectionStatusUpdated``` field set to true.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
