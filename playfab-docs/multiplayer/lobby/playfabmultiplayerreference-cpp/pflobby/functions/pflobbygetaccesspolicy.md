---
author: ScottMunroMS
title: "PFLobbyGetAccessPolicy"
description: "Gets the access policy of the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/03/2022
---

# PFLobbyGetAccessPolicy  

Gets the access policy of the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetAccessPolicy(  
    PFLobbyHandle lobby,  
    PFLobbyAccessPolicy* accessPolicy  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`accessPolicy`** &nbsp; [PFLobbyAccessPolicy*](../enums/pflobbyaccesspolicy.md)  
*output*  
  
The output access policy.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::accessPolicyUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md). <br /><br /> If this lobby object was created by calling [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::accessPolicyUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If claiming the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyClaimServerLobbyCompletedStateChange](../structs/pflobbyclaimserverlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
