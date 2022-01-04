---
author: ScottMunroMS
title: "PFLobbyGetMembers"
description: "Gets the list of PlayFab entities currently joined to the lobby as members."
ms.author: scmunro
ms.topic: reference
ms.prod: playfab
ms.date: 01/03/2022
---

# PFLobbyGetMembers  

Gets the list of PlayFab entities currently joined to the lobby as members.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetMembers(  
    PFLobbyHandle lobby,  
    uint32_t* memberCount,  
    const PFEntityKey** members  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`memberCount`** &nbsp; uint32_t*  
*output*  
  
The output member count.  
  
**`members`** &nbsp; PFEntityKey**  
*library-allocated output array of size `*memberCount`*  
  
The output member array.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object is still in the process of asynchronously being created or joined, via a call to either [PFMultiplayerCreateAndJoinLobby()](pfmultiplayercreateandjoinlobby.md) or [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md) respectively, this method will return no members.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
