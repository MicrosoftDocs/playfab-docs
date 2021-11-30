---
author: tomcoMSFT
title: "PFLobbyGetOwnerMigrationPolicy"
description: "Gets the owner migration policy of the lobby."
ms.author: tomco
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PFLobbyGetOwnerMigrationPolicy  

Gets the owner migration policy of the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyGetOwnerMigrationPolicy(  
    PFLobbyHandle lobby,  
    PFLobbyOwnerMigrationPolicy* ownerMigrationPolicy  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`ownerMigrationPolicy`** &nbsp; [PFLobbyOwnerMigrationPolicy*](../enums/pflobbyownermigrationpolicy.md)  
*output*  
  
The output owner migration policy.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
The owner migration policy cannot change for the lifetime of the lobby. <br /><br /> If this lobby object was created by calling [PFMultiplayerJoinLobby()](pfmultiplayerjoinlobby.md), this method will return an error until [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md) provides a [PFLobbyUpdatedStateChange](../structs/pflobbyupdatedstatechange.md) with [PFLobbyUpdatedStateChange::ownerMigrationPolicy](../structs/pflobbyupdatedstatechange.md) set to true. If joining the lobby succeeds, this field is guaranteed to be populated by the time PFMultiplayerStartProcessingLobbyStateChanges() provides a [PFLobbyJoinLobbyCompletedStateChange](../structs/pflobbyjoinlobbycompletedstatechange.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
