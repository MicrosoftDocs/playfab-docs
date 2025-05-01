---
author: jdeweyMSFT
title: "PartyNetworkDescriptor"
description: "A descriptor containing the data required for a device to connect to a network."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyNetworkDescriptor  

A descriptor containing the data required for a device to connect to a network.  

## Syntax  
  
```cpp
struct PartyNetworkDescriptor {  
    char networkIdentifier[c_networkIdentifierStringLength + 1];  
    char regionName[c_maxRegionNameStringLength + 1];  
    uint8_t opaqueConnectionInformation[c_opaqueConnectionInformationByteCount];  
}  
```
  
### Members  
  
**`networkIdentifier`** &nbsp; char[c_networkIdentifierStringLength + 1]  
  
A unique identifier for the network.
  
This identifier can be used to correlate locally observed PartyNetwork behavior with remote telemetry gathered by the Party service and transparent cloud relay. It is recommended that this identifier be recorded alongside any other information the title records to diagnose network behavior.
  
**`regionName`** &nbsp; char[c_maxRegionNameStringLength + 1]  
  
The Azure region in which the network was created.
  
**`opaqueConnectionInformation`** &nbsp; uint8_t[c_opaqueConnectionInformationByteCount]  
  
Connection information for the network used internally by the Party library.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  

  
  
