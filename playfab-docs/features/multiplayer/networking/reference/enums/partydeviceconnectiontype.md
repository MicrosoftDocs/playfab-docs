---
author: jdeweyMSFT
title: "PartyDeviceConnectionType"
description: "The type of connection used for transmitting endpoint message or chat data to a device."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/05/2020
---

# PartyDeviceConnectionType  

The type of connection used for transmitting endpoint message or chat data to a device.    

## Syntax  
  
```cpp
enum class PartyDeviceConnectionType    
{  
    RelayServer,  
    DirectPeerConnection,  
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
  
  
