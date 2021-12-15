---
author: jdeweyMSFT
title: "PartyRemoteDeviceJoinedNetworkStateChange"
description: "Information specific to the *RemoteDeviceJoinedNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyRemoteDeviceJoinedNetworkStateChange  

Information specific to the *RemoteDeviceJoinedNetwork* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyRemoteDeviceJoinedNetworkStateChange {  
    PartyDevice* device;  
    PartyNetwork* network;  
} PartyRemoteDeviceJoinedNetworkStateChange  
```
  
### Members  
  
**`device`** &nbsp; [PartyDevice](../classes/PartyDevice/partydevice.md)*  
  
The device that joined.
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network that was joined.
  
## Remarks  
  
This state change indicates that the device has just joined the network.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
