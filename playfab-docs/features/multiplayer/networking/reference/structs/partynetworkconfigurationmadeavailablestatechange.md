---
author: jdeweyMSFT
title: "PartyNetworkConfigurationMadeAvailableStateChange"
description: "Information specific to the *NetworkConfigurationMadeAvailable* type of state change."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/26/2019
---

# PartyNetworkConfigurationMadeAvailableStateChange  

Information specific to the *NetworkConfigurationMadeAvailable* type of state change.  

## Syntax  
  
```cpp
typedef struct PartyNetworkConfigurationMadeAvailableStateChange {  
    PartyNetwork* network;  
    PartyNetworkConfiguration* networkConfiguration;  
} PartyNetworkConfigurationMadeAvailableStateChange  
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
  
  
