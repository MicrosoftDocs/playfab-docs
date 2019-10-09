---
author: jdeweyMSFT
title: "PartyNetwork::GetNetworkConfiguration"
description: Gets the network configuration which was set when creating the network.
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 09/25/2019
ROBOTS: NOINDEX,NOFOLLOW
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
*output*  
  
The output network configuration.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Returns nullptr until a call to [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md) returns a [PartyNetworkConfigurationMadeAvailableStateChange](../../../structs/partynetworkconfigurationmadeavailablestatechange.md).
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  

  
  
