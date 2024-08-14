---
author: jdeweyMSFT
title: "PartyDeviceConnectionType"
description: "The type of connection used for transmitting endpoint message or chat data to a device."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/07/2021
---

# PartyDeviceConnectionType  

The type of connection used for transmitting endpoint message or chat data to a device.    

## Syntax  
  
```cpp
enum class PartyDeviceConnectionType    
{  
    RelayServer = 0,  
    DirectPeerConnection = 1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| RelayServer | All communication is transmitted via a transparent cloud relay server. |  
| DirectPeerConnection | All communication is transmitted using a direct peer-to-peer connection. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::GetDeviceConnectionType](../classes/PartyNetwork/methods/partynetwork_getdeviceconnectiontype.md)
  
  
