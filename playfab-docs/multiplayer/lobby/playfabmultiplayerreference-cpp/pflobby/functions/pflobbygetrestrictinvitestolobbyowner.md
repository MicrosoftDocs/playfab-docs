---
author: ScottMunroMS
title: "PFLobbyGetRestrictInvitesToLobbyOwner"
description: "Gets the lobby's current policy for whether only the lobby owner can send invites to join the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/24/2026
---

# PFLobbyGetRestrictInvitesToLobbyOwner  

Gets the lobby's current policy for whether only the lobby owner can send invites to join the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetRestrictInvitesToLobbyOwner(  
    PFLobbyHandle lobby,  
    bool* restrictInvitesToLobbyOwner  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`restrictInvitesToLobbyOwner`** &nbsp; bool*  
*output*  
  
The output value indicating whether the current policy only the lobby owner can send invites to join the lobby.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
When true, only the lobby owner can send invites. When false, any member can send invites. Can only be true for client-owned lobbies. <br /><br /> If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method returns an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::restrictInvitesToLobbyOwnerUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md).   <br /><br /> If this lobby object was created by calling [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md), this method returns an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::restrictInvitesToLobbyOwnerUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If claiming the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyClaimServerLobbyCompletedStateChange](../structs/pflobbyclaimserverlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
