---
author: jdeweyMSFT
title: "PartyLocalUdpSocketBindAddressConfiguration"
description: "The configuration used by the Party library to bind to a UDP socket."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 01/30/2024
---

# PartyLocalUdpSocketBindAddressConfiguration  

The configuration used by the Party library to bind to a UDP socket.  

## Syntax  
  
```cpp
struct PartyLocalUdpSocketBindAddressConfiguration {  
    PartyLocalUdpSocketBindAddressOptions options;  
    uint16_t port;  
}  
```
  
### Members  
  
**`options`** &nbsp; [PartyLocalUdpSocketBindAddressOptions](../enums/partylocaludpsocketbindaddressoptions.md)  
  
Optional flags describing how to interpret this UDP socket configuration.
  
**`port`** &nbsp; uint16_t  
  
The specific port number to which the local UDP socket will be bound the next time Party is initialized.
  
In the Microsoft Game Core version of the Party library, a port value of 0 means that the Party library selects the Game Core preferred local UDP multiplayer port unless the PartyLocalUdpSocketBindAddressOptions::ExcludeGameCorePreferredUdpMultiplayerPort option flag is specified in the *options* field. On all other versions of the Party library, a port value of 0 means the Party library lets the system dynamically select a port that's available on all local IP address interfaces. <br /><br /> If this port value can't be bound when the Party library is initialized, [PartyManager::Initialize()](../classes/PartyManager/methods/partymanager_initialize.md) synchronously returns an error. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).   <br /><br /> The port should be specified in native host byte order. If your application also directly uses or is porting from its own socket API calls, be aware that this natural byte ordering may therefore differ from the network byte order used by socket address port numbers.   <br /><br /> The default value is 0 when [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) hasn't been configured.
  
## Remarks  
  
This structure can be used together with [PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md) to either override or query the Party library's current configuration via [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) or [PartyManager::GetOption()](../classes/PartyManager/methods/partymanager_getoption.md) respectively.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyOption::LocalUdpSocketBindAddress](../enums/partyoption.md)  
[PartyLocalUdpSocketBindAddressOptions](../enums/partylocaludpsocketbindaddressoptions.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md)
  
  
