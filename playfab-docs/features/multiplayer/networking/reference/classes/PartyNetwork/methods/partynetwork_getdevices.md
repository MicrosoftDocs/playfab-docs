---
author: jdeweyMSFT
title: "PartyNetwork::GetDevices"
description: Gets the devices in this network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/08/2019
---

# PartyNetwork::GetDevices  

Gets the devices in this network.  

## Syntax  
  
```cpp
PartyError GetDevices(  
    uint32_t* deviceCount,  
    PartyDeviceArray* devices  
)  
```  
  
### Parameters  
  
**`deviceCount`** &nbsp; uint32_t*  
*output*  
  
The output number of devices in this network.  
  
**`devices`** &nbsp; [PartyDeviceArray*](../../../typedefs.md)  
*library-allocated output array of size `*deviceCount`*  
  
A library-allocated output array containing the devices in this network.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if the call succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Once a [PartyRemoteDeviceLeftNetworkStateChange](../../../structs/partyremotedeviceleftnetworkstatechange.md) has been provided by [PartyManager::StartProcessingStateChanges()](../../PartyManager/methods/partymanager_startprocessingstatechanges.md), the remote device will no longer be present in the array returned by this method. The local device is always in the array. <br /><br /> The memory for the returned array is invalidated whenever the title calls PartyManager::StartProcessingStateChanges().
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyRemoteDeviceLeftNetworkStateChange](../../../structs/partyremotedeviceleftnetworkstatechange.md)
  
  
