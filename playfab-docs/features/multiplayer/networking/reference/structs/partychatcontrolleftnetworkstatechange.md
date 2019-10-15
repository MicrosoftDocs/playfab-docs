---
author: jdeweyMSFT
title: "PartyChatControlLeftNetworkStateChange"
description: "Information specific to the *ChatControlLeftNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyChatControlLeftNetworkStateChange  

Information specific to the *ChatControlLeftNetwork* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyChatControlLeftNetworkStateChange {  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
    PartyNetwork* network;  
    PartyChatControl* chatControl;  
} PartyChatControlLeftNetworkStateChange  
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
  
  
