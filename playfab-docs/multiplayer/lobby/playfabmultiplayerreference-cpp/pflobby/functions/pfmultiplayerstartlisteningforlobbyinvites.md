---
author: ScottMunroMS
title: "PFMultiplayerStartListeningForLobbyInvites"
description: "Enables the Lobby invite listener for a given entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/14/2022
---

# PFMultiplayerStartListeningForLobbyInvites  

Enables the Lobby invite listener for a given entity.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerStartListeningForLobbyInvites(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* listeningEntity  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`listeningEntity`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which will listen for invites.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This operation will synchronously start listening for invites on behalf of the provided entity. When invites are received, they will be provided via [PFLobbyInviteReceivedStateChange](../structs/pflobbyinvitereceivedstatechange.md) structs. When the status of the invite listener changes, notifications will be provided via [PFLobbyInviteListenerStatusChangedStateChange](../structs/pflobbyinvitelistenerstatuschangedstatechange.md) structs. <br /><br /> Only invites sent after the listener has been started will be received on this client. Invites sent while this listener is not active will not be queued.   <br /><br /> Invite listening is, by default, disabled for all entities. This method should be called for each local entity that the title wants to receive Lobby invites.   <br /><br /> Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.   <br /><br /> This method may only be called if the Lobby invite listener is not already enabled for the given entity.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
