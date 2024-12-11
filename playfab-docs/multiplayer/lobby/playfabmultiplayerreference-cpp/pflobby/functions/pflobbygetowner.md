---
author: ScottMunroMS
title: "PFLobbyGetOwner"
description: "Gets the current owner of the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/07/2023
---

# PFLobbyGetOwner  

Gets the current owner of the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetOwner(  
    PFLobbyHandle lobby,  
    const PFEntityKey** owner  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`owner`** &nbsp; [PFEntityKey**](../../pfmultiplayer/pfentitykey_clientsdk.md)  
*library-allocated output, may return nullptr*  
  
The output owner. This value may be null if the owner has left or disconnected from the lobby while the owner migration policy is [PFLobbyOwnerMigrationPolicy::Manual](../enums/pflobbyownermigrationpolicy.md) or [PFLobbyOwnerMigrationPolicy::None](../enums/pflobbyownermigrationpolicy.md).  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::ownerUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md). <br /><br /> If this lobby object was created by calling [PFMultiplayerClaimServerLobby()](pfmultiplayerclaimserverlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::ownerUpdated](../structs/pflobbyupdatedstatechange.md) set to true. If claiming the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyClaimServerLobbyCompletedStateChange](../structs/pflobbyclaimserverlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
