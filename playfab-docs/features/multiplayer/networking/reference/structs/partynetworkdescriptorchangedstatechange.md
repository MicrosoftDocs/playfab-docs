---
author: jdeweyMSFT
title: "PartyNetworkDescriptorChangedStateChange"
description: "Information specific to the *NetworkDescriptorChanged* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
ROBOTS: NOINDEX,NOFOLLOW
---

# PartyNetworkDescriptorChangedStateChange  

Information specific to the *NetworkDescriptorChanged* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyNetworkDescriptorChangedStateChange {  
    PartyNetwork* network;  
} PartyNetworkDescriptorChangedStateChange  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network where the network descriptor changed.
  
## Remarks  
  
This state change is generated when the network descriptor of a network changes due to migration from one server to another. Use [PartyNetwork::GetNetworkDescriptor()](../classes/PartyNetwork/methods/partynetwork_getnetworkdescriptor.md) to get the new network descriptor. The old network descriptor is no longer guaranteed to be usable for connecting to the network, so any outstanding external references to the old network descriptor (such as invitations sent over a social network) should be updated.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::GetNetworkDescriptor](../classes/PartyNetwork/methods/partynetwork_getnetworkdescriptor.md)
  
  
