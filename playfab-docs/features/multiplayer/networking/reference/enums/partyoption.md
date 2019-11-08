---
author: jdeweyMSFT
title: "PartyOption"
description: "Additional options that can be set to fine-tune Party library functionality."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 10/30/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyOption  

Additional options that can be set to fine-tune Party library functionality.    

## Syntax  
  
```cpp
enum class PartyOption  : uint32_t  
{  
    LocalUdpSocketBindAddress,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| LocalUdpSocketBindAddress | An option used to configure how the Party library binds to a UDP socket.<br/><br/> It is safe to override or query for this option prior to initializing the Party library. Overriding the local UDP socket bind address configuration will take effect the next time the Party library is initialized. <br /><br /> To override this option, call [PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md) passing null for the object parameter, this value for the option parameter, and an optional pointer to a PartyLocalUdpSocketBindAddressConfiguration structure for the value.   <br /><br /> To query this option, call [PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md) passing null for the object parameter, this value for the option parameter, and a pointer to an output PartyLocalUdpSocketBindAddressConfiguration structure for the value. |  
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyManager::GetOption](../classes/PartyManager/methods/partymanager_getoption.md)  
[PartyLocalUdpSocketBindAddressConfiguration](../structs/partylocaludpsocketbindaddressconfiguration.md)
  
  
