---
author: tomcoMSFT
title: "PFLobbyGetConnectionString"
description: "Gets the default connection string associated with the lobby."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyGetConnectionString  

Gets the default connection string associated with the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetConnectionString(  
    PFLobbyHandle lobby,  
    const char** connectionString  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`connectionString`** &nbsp; char**  
*library-allocated output*  
  
The output connection string.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object was created by calling [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a successful [PFLobbyCreateAndJoinLobbyCompletedStateChange](../structs/pflobbycreateandjoinlobbycompletedstatechange.md). If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a successful [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
