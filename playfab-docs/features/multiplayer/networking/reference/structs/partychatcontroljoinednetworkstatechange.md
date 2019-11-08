---
author: jdeweyMSFT
title: "PartyChatControlJoinedNetworkStateChange"
description: "Information specific to the *ChatControlJoinedNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyChatControlJoinedNetworkStateChange  

Information specific to the *ChatControlJoinedNetwork* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyChatControlJoinedNetworkStateChange {  
    PartyNetwork* network;  
    PartyChatControl* chatControl;  
} PartyChatControlJoinedNetworkStateChange  
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
  
  
