---
author: jdeweyMSFT
title: "PartyManager::DeserializeNetworkDescriptor"
description: Deserializes a network descriptor structure from an opaque string serialized via a prior call to [SerializeNetworkDescriptor()](partymanager_serializenetworkdescriptor.md).
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::DeserializeNetworkDescriptor  

Deserializes a network descriptor structure from an opaque string serialized via a prior call to [SerializeNetworkDescriptor()](partymanager_serializenetworkdescriptor.md).  

## Syntax  
  
```cpp
PartyError DeserializeNetworkDescriptor(  
    PartyString serializedNetworkDescriptorString,  
    PartyNetworkDescriptor* networkDescriptor  
)  
```  
  
### Parameters  
  
**`serializedNetworkDescriptorString`** &nbsp; [PartyString](../../../typedefs.md)  
  
The serialized network descriptor string.  
  
**`networkDescriptor`** &nbsp; [PartyNetworkDescriptor*](../../../structs/partynetworkdescriptor.md)  
*output*  
  
The output network descriptor. `serializedNetworkDescriptorString`.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the descriptor string is a valid serialized network descriptor string and was successfully deserialized, or an error code otherwise.
  
## Remarks  
  
The resulting `networkDescriptor` can be used to connect to a network via [ConnectToNetwork()](partymanager_connecttonetwork.md). <br /><br /> This method can be called prior to the [Initialize()](partymanager_initialize.md) method.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::SerializeNetworkDescriptor](partymanager_serializenetworkdescriptor.md)  
[PartyManager::ConnectToNetwork](partymanager_connecttonetwork.md)
  
  
