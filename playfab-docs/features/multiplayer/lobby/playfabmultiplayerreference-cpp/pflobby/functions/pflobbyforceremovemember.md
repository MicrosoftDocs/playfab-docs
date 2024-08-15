---
author: ScottMunroMS
title: "PFLobbyForceRemoveMember"
description: "Forcibly remove an entity from the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/14/2022
---

# PFLobbyForceRemoveMember  

Forcibly remove an entity from the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyForceRemoveMember(  
    PFLobbyHandle lobby,  
    const PFEntityKey* targetMember,  
    bool preventRejoin,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`targetMember`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The member to forcibly remove.  
  
**`preventRejoin`** &nbsp; bool  
  
A flag indicating whether `targetMember` will be prevented from rejoining the lobby after being removed.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberRemovedStateChange](../structs/pflobbymemberremovedstatechange.md) followed by a [PFLobbyForceRemoveMemberCompletedStateChange](../structs/pflobbyforceremovemembercompletedstatechange.md) with the [PFLobbyForceRemoveMemberCompletedStateChange::result](../structs/pflobbyforceremovemembercompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyForceRemoveMemberCompletedStateChange](../structs/pflobbyforceremovemembercompletedstatechange.md) with the [PFLobbyForceRemoveMemberCompletedStateChange::result](../structs/pflobbyforceremovemembercompletedstatechange.md) field set to a failure hresult. <br /><br /> One of the local PlayFab entities present in this lobby must be the owner for this operation to succeed. If the local owning entity who initiated this operation loses their ownership status while the operation is in progress, the operation will fail asynchronously.   <br /><br /> This is an asynchronous operation. The member removed via this method will not be removed from the lists returned by [PFLobbyGetMembers](pflobbygetmembers.md) until the asynchronous operation successfully completes and a ```PFLobbyMemberRemovedStateChange``` struct is provided by [PFMultiplayerStartProcessingLobbyStateChanges](pfmultiplayerstartprocessinglobbystatechanges.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
