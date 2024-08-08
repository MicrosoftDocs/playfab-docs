---
author: jdeweyMSFT
title: "PartyNetworkDestroyedStateChange"
description: "Information specific to the *NetworkDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyNetworkDestroyedStateChange  

Information specific to the *NetworkDestroyed* type of state change.  

## Syntax  
  
```cpp
struct PartyNetworkDestroyedStateChange : PartyStateChange {  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
    PartyNetwork* network;  
}  
```
  
### Members  
  
**`reason`** &nbsp; [PartyDestroyedReason](../enums/partydestroyedreason.md)  
  
Indicates why the network was destroyed.
  
**`errorDetail`** &nbsp; PartyError  
  
A diagnostic value providing additional troubleshooting information regarding any potential error condition.
  
The human-readable form of this error detail can be retrieved via [PartyManager::GetErrorMessage()](../classes/PartyManager/methods/partymanager_geterrormessage.md).
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network that was destroyed.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
