---
author: jdeweyMSFT
title: "PartyNetwork::GetChatControls"
description: Gets the chat controls connected to this network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetChatControls  

Gets the chat controls connected to this network.  

## Syntax  
  
```cpp
PartyError GetChatControls(  
    uint32_t* chatControlCount,  
    PartyChatControlArray* chatControls  
)  
```  
  
### Parameters  
  
**`chatControlCount`** &nbsp; uint32_t*  
*output*  
  
The output number of chat controls in this network.  
  
**`chatControls`** &nbsp; [PartyChatControlArray*](../../../typedefs.md)  
*library-allocated output array of size `*chatControlCount`*  
  
A library-allocated output array containing the chat controls in this network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md) has been generated for a chat control by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the chat control will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges() or [ConnectChatControl()](partynetwork_connectchatcontrol.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetwork::ConnectChatControl](partynetwork_connectchatcontrol.md)  
[PartyNetwork::DisconnectChatControl](partynetwork_disconnectchatcontrol.md)  
[PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)
  
  
