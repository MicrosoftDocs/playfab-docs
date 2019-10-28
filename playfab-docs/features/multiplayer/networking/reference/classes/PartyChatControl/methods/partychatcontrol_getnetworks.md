---
author: jdeweyMSFT
title: "PartyChatControl::GetNetworks"
description: Gets the networks to which this chat control is connected.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*library-allocated output*  
  
The output number of networks to which this chat control is connected.  
  
**`networks`** &nbsp; [PartyNetworkArray*](../../../typedefs.md)  
*library-allocated output array of size `*networkCount`*  
  
A library-allocated output array containing the networks to which this chat control is connected.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
The returned array is only valid until the next call to either [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) or [PartyNetwork::ConnectChatControl()](../../PartyNetwork/methods/partynetwork_connectchatcontrol.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyChatControl](../partychatcontrol.md)  

  
  
