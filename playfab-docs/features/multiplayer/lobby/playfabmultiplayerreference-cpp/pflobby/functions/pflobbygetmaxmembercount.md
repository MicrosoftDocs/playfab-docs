---
author: ScottMunroMS
title: "PFLobbyGetMaxMemberCount"
description: "Gets the max member count of the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: playfab
ms.date: 01/03/2022
---

# PFLobbyGetMaxMemberCount  

Gets the max member count of the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetMaxMemberCount(  
    PFLobbyHandle lobby,  
    uint32_t* maxMemberCount  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`maxMemberCount`** &nbsp; uint32_t*  
*output*  
  
The output max member count.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the result can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::maxMembersUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
