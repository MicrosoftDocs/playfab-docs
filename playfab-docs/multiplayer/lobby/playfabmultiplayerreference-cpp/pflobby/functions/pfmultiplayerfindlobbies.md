---
author: ScottMunroMS
title: "PFMultiplayerFindLobbies"
description: "Search for lobbies on behalf of the local user."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 07/14/2023
---

# PFMultiplayerFindLobbies  

Search for lobbies on behalf of the local user.  

## Syntax  
  
```cpp
HRESULT PFMultiplayerFindLobbies(  
    PFMultiplayerHandle handle,  
    const PFEntityKey* searchingEntity,  
    const PFLobbySearchConfiguration* searchConfiguration,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`handle`** &nbsp; PFMultiplayerHandle  
  
The handle of the PFMultiplayer API instance.  
  
**`searchingEntity`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The playfab entity performing the search.  
  
**`searchConfiguration`** &nbsp; [PFLobbySearchConfiguration*](../structs/pflobbysearchconfiguration.md)  
  
The configuration used to filter and sort the searched lobbies.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyFindLobbiesCompletedStateChange](../structs/pflobbyfindlobbiescompletedstatechange.md) with the [PFLobbyFindLobbiesCompletedStateChange::result](../structs/pflobbyfindlobbiescompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyFindLobbiesCompletedStateChange](../structs/pflobbyfindlobbiescompletedstatechange.md) with the [PFLobbyFindLobbiesCompletedStateChange::result](../structs/pflobbyfindlobbiescompletedstatechange.md) field set to a failure.
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
