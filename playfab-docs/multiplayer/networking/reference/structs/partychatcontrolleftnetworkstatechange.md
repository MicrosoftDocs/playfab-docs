---
author: jdeweyMSFT
title: "PartyChatControlLeftNetworkStateChange"
description: "Information specific to the *ChatControlLeftNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyChatControlLeftNetworkStateChange  

Information specific to the *ChatControlLeftNetwork* type of state change.  

## Syntax  
  
```cpp
struct PartyChatControlLeftNetworkStateChange : PartyStateChange {  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyChatControl* chatControl;  
}  
```
  
### Members  
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
The reason the chat control left the network.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network left.
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control that left the network.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::DisconnectChatControl](../classes/PartyNetwork/methods/partynetwork_disconnectchatcontrol.md)
  
  
