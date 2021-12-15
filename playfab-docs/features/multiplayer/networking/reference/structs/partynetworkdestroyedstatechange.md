---
author: jdeweyMSFT
title: "PartyNetworkDestroyedStateChange"
description: "Information specific to the *NetworkDestroyed* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyNetworkDestroyedStateChange  

Information specific to the *NetworkDestroyed* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyNetworkDestroyedStateChange {  
    PartyDestroyedReason reason;  
    PartyError errorDetail;  
    PartyNetwork* network;  
} PartyNetworkDestroyedStateChange  
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

  
  
