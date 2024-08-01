---
author: ScottMunroMS
title: "PFMultiplayerGetLobbyInviteListenerStatus"
description: "Retrieve the status of the entity's invite listener."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/14/2022
---

# PFMultiplayerGetLobbyInviteListenerStatus  

Retrieve the status of the entity's invite listener.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerGetLobbyInviteListenerStatus(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* listeningEntity,  
    PFLobbyInviteListenerStatus* status  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`listeningEntity`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which is listening for invites.  
  
**`status`** &nbsp; [PFLobbyInviteListenerStatus*](../enums/pflobbyinvitelistenerstatus.md)  
*output*  
  
The output status value.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This value is used to understand the state of an entity's invite listener. If the invite listener encounters a fatal error, non-fatal error, or diagnostic change, the listener's status value will reflect it. <br /><br /> When the invite listener's status changes, a [PFLobbyInviteListenerStatusChangedStateChange](../structs/pflobbyinvitelistenerstatuschangedstatechange.md) struct will be provided by [PFMultiplayerStartProcessingLobbyStateChanges](pfmultiplayerstartprocessinglobbystatechanges.md). This method can then be called to retrieve the latest status and act accordingly.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
