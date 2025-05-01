---
author: jdeweyMSFT
title: "PartyChatControl::GetNetworks"
description: Gets the networks to which this chat control is connected.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyChatControl::GetNetworks  

Gets the networks to which this chat control is connected.  

## Syntax  
  
```cpp
PartyError GetNetworks(  
    uint32_t* networkCount,  
    PartyNetworkArray* networks  
)  
```  
  
### Parameters  
  
**`networkCount`** &nbsp; uint32_t*  
*output*  
  
The output number of networks to which this chat control is connected.  
  
**`networks`** &nbsp; [PartyNetworkArray*](../../../typedefs.md)  
*library-allocated output array of size `*networkCount`*  
  
A library-allocated output array containing the networks to which this chat control is connected.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the network will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges() or [PartyNetwork::ConnectChatControl()](../../PartyNetwork/methods/partynetwork_connectchatcontrol.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  
[PartyNetwork::ConnectChatControl](../../PartyNetwork/methods/partynetwork_connectchatcontrol.md)  
[PartyNetwork::DisconnectChatControl](../../PartyNetwork/methods/partynetwork_disconnectchatcontrol.md)  
[PartyChatControlLeftNetworkStateChange](../../../structs/partychatcontrolleftnetworkstatechange.md)
  
  
