---
author: jdeweyMSFT
title: "PartyRemoteDeviceLeftNetworkStateChange"
description: "Information specific to the *RemoteDeviceLeftNetwork* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyRemoteDeviceLeftNetworkStateChange  

Information specific to the *RemoteDeviceLeftNetwork* type of state change.  

## Syntax  
  
```cpp
struct PartyRemoteDeviceLeftNetworkStateChange : PartyStateChange {  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
    PartyDevice* device;  
    PartyNetwork* network;  
}  
```
  
### Members  
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
The reason the device left the network.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`device`** &nbsp; [PartyDevice](../classes/PartyDevice/partydevice.md)*  
  
The device that left.
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network that was left.
  
## Remarks  
  
This state change indicates that the device just left the network.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
