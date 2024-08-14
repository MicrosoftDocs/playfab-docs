---
author: jdeweyMSFT
title: "PartyNetwork::GetNetworkConfiguration"
description: Gets the network configuration which was set when creating the network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetNetworkConfiguration  

Gets the network configuration which was set when creating the network.  

## Syntax  
  
```cpp
PartyError GetNetworkConfiguration(  
    const PartyNetworkConfiguration** networkConfiguration  
)  
```  
  
### Parameters  
  
**`networkConfiguration`** &nbsp; [PartyNetworkConfiguration**](../../../structs/partynetworkconfiguration.md)  
*library-allocated output*  
  
The output network configuration.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
This method returns an error until [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) provides a [PartyNetworkConfigurationMadeAvailableStateChange](../../../structs/partynetworkconfigurationmadeavailablestatechange.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyNetworkConfigurationMadeAvailableStateChange](../../../structs/partynetworkconfigurationmadeavailablestatechange.md)
  
  
