---
author: ScottMunroMS
title: "PFMultiplayerStopListeningForLobbyInvites"
description: "Disables the Lobby invite listener for a given entity."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/14/2022
---

# PFMultiplayerStopListeningForLobbyInvites  

Disables the Lobby invite listener for a given entity.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerStopListeningForLobbyInvites(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* listeningEntity  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`listeningEntity`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The entity which is listening for invites.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This operation will synchronously stop listening for invites on behalf of the provided entity. <br /><br /> Invite notifications which have already been queued internally will still be provided via the next call to [PFMultiplayerStartProcessingLobbyStateChanges()](pfmultiplayerstartprocessinglobbystatechanges.md).   <br /><br /> Lobby invites and this invite listener are unrelated to and unaffected by platform invite mechanisms.   <br /><br /> This method may only be called if the Lobby invite listener is already enabled for the given entity.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
