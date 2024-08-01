---
author: ScottMunroMS
title: "PFLobbyAddMember"
description: "Add a local user as a member to the lobby."
ms.author: scmunro
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/16/2022
---

# PFLobbyAddMember  

Add a local user as a member to the lobby.  

## Syntax  
  
```cpp
HRESULT PFLobbyAddMember(  
    PFLobbyHandle lobby,  
    const PFEntityKey* localUser,  
    uint32_t memberPropertyCount,  
    const char* const* memberPropertyKeys,  
    const char* const* memberPropertyValues,  
    void* asyncContext  
)  
```  
  
### Parameters  
  
**`lobby`** &nbsp; PFLobbyHandle  
  
The handle of the lobby.  
  
**`localUser`** &nbsp; [PFEntityKey*](../../pfmultiplayer/pfentitykey_clientsdk.md)  
  
The PlayFab Entity Key of the local user to add to the lobby as a member.  
  
**`memberPropertyCount`** &nbsp; uint32_t  
*input in range `0,PFLobbyMaxMemberPropertyCount`*  
  
The number of initial member properties to set for this user when they join the lobby.  
  
**`memberPropertyKeys`** &nbsp; char* const*  
*input array of size `memberPropertyCount`*  
  
The keys of the initial member properties to set for this user when they join the lobby.  
  
**`memberPropertyValues`** &nbsp; char* const*  
*input array of size `memberPropertyCount`*  
  
The values of the initial member properties to set for this user when they join the lobby.  
  
**`asyncContext`** &nbsp; void*  
*optional*  
  
An optional, app-defined, pointer-sized context value that can be used to associate the completion state change with this call.  
  
  
### Return value
Type: HRESULT
  
```S_OK``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PFMultiplayerGetErrorMessage()](../../pfmultiplayer/functions/pfmultiplayergeterrormessage.md).
  
## Remarks  
  
This is an asynchronous operation. Upon successful completion, the title will be provided a [PFLobbyMemberAddedStateChange](../structs/pflobbymemberaddedstatechange.md) followed by a [PFLobbyAddMemberCompletedStateChange](../structs/pflobbyaddmembercompletedstatechange.md) with the [PFLobbyAddMemberCompletedStateChange::result](../structs/pflobbyaddmembercompletedstatechange.md) field set to ```S_OK```. Upon a failed completion, the title will be provided a [PFLobbyAddMemberCompletedStateChange](../structs/pflobbyaddmembercompletedstatechange.md) with the [PFLobbyAddMemberCompletedStateChange::result](../structs/pflobbyaddmembercompletedstatechange.md) field set to a failure hresult. <br /><br /> This method is used to add another local PlayFab entity to a pre-existing lobby object. Because the lobby object must have already been created either via a call to [PFMultiplayerCreateAndJoinLobby](pfmultiplayercreateandjoinlobby.md) or [PFMultiplayerJoinLobby](pfmultiplayerjoinlobby.md), this method is primarily useful for multiple local user scenarios.   <br /><br /> This is an asynchronous operation. The member added via this method will not be reflected in the lists returned by [PFLobbyGetMembers](pflobbygetmembers.md) until the asynchronous operation successfully completes and a ```PFLobbyMemberAddedStateChange``` struct is provided by [PFMultiplayerStartProcessingLobbyStateChanges](pfmultiplayerstartprocessinglobbystatechanges.md).
  
## Requirements  
  
**Header:** PFLobby.h
  
## See also  
[PFLobby members](../pflobby_members.md)  

  
  
