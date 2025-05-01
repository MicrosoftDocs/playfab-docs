---
author: jdeweyMSFT
title: "PartyManager::GetNetworks"
description: Gets an array of all networks to which the local device is connected or connecting.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyManager::GetNetworks  

Gets an array of all networks to which the local device is connected or connecting.  

## Syntax  
  
```cpp
PartyError GetNetworks(  
    uint32_t* networkCount,  
    PartyNetworkArray* networks  
)  
```  
  
### Parameters  
  
**`networkCount`** &nbsp; uint32_t*  
*output*  
  
The output number of networks to which the local device is connected or connecting provided in `networks`.  
  
**`networks`** &nbsp; [PartyNetworkArray*](../../../typedefs.md)  
*library-allocated output array of size `*networkCount`*  
  
A library-allocated output array containing the networks to which the local device is connected or connecting.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [GetErrorMessage()](partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](partymanager_startprocessingstatechanges.md), the network will no longer be present in the array returned by this method. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges() or [ConnectToNetwork()](partymanager_connecttonetwork.md) returns success.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyManager](../partymanager.md)  
[PartyManager::ConnectToNetwork](partymanager_connecttonetwork.md)  
[PartyNetwork::LeaveNetwork](../../PartyNetwork/methods/partynetwork_leavenetwork.md)  
[PartyNetworkDestroyedStateChange](../../../structs/partynetworkdestroyedstatechange.md)
  
  
