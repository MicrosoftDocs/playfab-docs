---
author: jdeweyMSFT
title: "PartyLocalUdpSocketBindAddressOptions"
description: "Additional options to control how the Party library binds to the UDP socket specified by the [PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md) structure."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/05/2020
---

# PartyLocalUdpSocketBindAddressOptions  

Additional options to control how the Party library binds to the UDP socket specified by the [PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md) structure.    

## Syntax  
  
```cpp
enum class PartyLocalUdpSocketBindAddressOptions    
{  
    None = 0x0,  
    ExcludeGameCorePreferredUdpMultiplayerPort = 0x1,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No flags are specified.<br/><br/> This value is the default if a [PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md) structure has not been explicitly set. |  
| ExcludeGameCorePreferredUdpMultiplayerPort | Don't default to using the Microsoft Game Core preferred UDP multiplayer port when the port is unspecified.<br/><br/> In the Microsoft Game Core version of the Party library, when the *port* field of the [PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md) structure is 0, this flag informs the Party library to not use the Game Core preferred UDP multiplayer port. In other versions of the Party library or if the *port* port is non-zero, this flag must not be set. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md)
  
  
