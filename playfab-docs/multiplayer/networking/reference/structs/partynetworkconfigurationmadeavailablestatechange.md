---
author: jdeweyMSFT
title: "PartyNetworkConfigurationMadeAvailableStateChange"
description: "Information specific to the *NetworkConfigurationMadeAvailable* type of state change."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 04/21/2022
---

# PartyNetworkConfigurationMadeAvailableStateChange  

Information specific to the *NetworkConfigurationMadeAvailable* type of state change.  

## Syntax  
  
```cpp
struct PartyNetworkConfigurationMadeAvailableStateChange : PartyStateChange {  
    PartyNetwork* network;  
    PartyNetworkConfiguration* networkConfiguration;  
}  
```
  
### Members  
  
**`network`** &nbsp; [PartyNetwork](../classes/PartyNetwork/partynetwork.md)*  
  
The network where the network configuration was made available.
  
**`networkConfiguration`** &nbsp; [PartyNetworkConfiguration](partynetworkconfiguration.md)*  
  
The newly available network configuration.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::GetNetworkConfiguration](../classes/PartyNetwork/methods/partynetwork_getnetworkconfiguration.md)
  
  
