---
author: jdeweyMSFT
title: "PartyChatControlJoinedNetworkStateChange"
description: "Information specific to the *ChatControlJoinedNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyChatControlJoinedNetworkStateChange  

Information specific to the *ChatControlJoinedNetwork* type of state change.  

## Syntax  
  
```cpp
struct PartyChatControlJoinedNetworkStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyChatControl* chatControl;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network joined.
  
**`chatControl`** &nbsp; [PartyChatControl](../classes/PartyChatControl/partychatcontrol.md)*  
  
The chat control that joined the network.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::ConnectChatControl](../classes/PartyNetwork/methods/partynetwork_connectchatcontrol.md)
  
  
