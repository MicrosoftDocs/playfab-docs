---
author: ScottMunroMS
title: "PFLobbyServerDeleteLobby"
description: "Delete a lobby on behalf of the game_server entity that owns the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 02/25/2023
---

# PFLobbyServerDeleteLobby  

Delete a lobby on behalf of the game_server entity that owns the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyServerDeleteLobby(  
    PFLobbyHandle lobby,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
TBD    
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
TBD    
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
To use this feature, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h. <br /><br /> This method queues an asynchronous operation to delete the lobby on behalf of the game_server entity. On completion, a [PFLobbyServerDeleteLobbyCompletedStateChange](../structs/pflobbyserverdeletelobbycompletedstatechange.md) will be provided indicating that the operation has completed.   <br /><br /> This method does not guarantee the delete will succeed. The operation may fail due to networking or service errors. If the delete attempt fails but is retriable, the library will continue to retry the delete operation. Once the operation can no longer be retried, the operation will complete and a [PFLobbyServerDeleteLobbyCompletedStateChange](../structs/pflobbyserverdeletelobbycompletedstatechange.md) will be provided.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
