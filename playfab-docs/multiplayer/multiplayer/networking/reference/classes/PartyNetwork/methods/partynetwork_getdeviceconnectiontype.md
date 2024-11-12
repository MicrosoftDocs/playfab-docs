---
author: jdeweyMSFT
title: "PartyNetwork::GetDeviceConnectionType"
description: Retrieves the type of connection used by the local device for transmitting messages or chat data to the specified target device in this network.
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 08/05/2020
---

# PartyNetwork::GetDeviceConnectionType  

Retrieves the type of connection used by the local device for transmitting messages or chat data to the specified target device in this network.  

## Syntax  
  
```cpp
PartyError GetDeviceConnectionType(  
    const PartyDevice* targetDevice,  
    PartyDeviceConnectionType* deviceConnectionType  
)  
```  
  
### Parameters  
  
**`targetDevice`** &nbsp; [PartyDevice*](../../PartyDevice/partydevice.md)  
  
The device whose connection type should be retrieved.  
  
**`deviceConnectionType`** &nbsp; [PartyDeviceConnectionType*](../../../enums/partydeviceconnectiontype.md)  
*output*  
  
The output device connection type.  
  
  
### Return value  
PartyError
  
```c_partyErrorSuccess``` if retrieving the connection type succeeded or an error code otherwise. The human-readable form of the error code can be retrieved via [PartyManager::GetErrorMessage()](../../PartyManager/methods/partymanager_geterrormessage.md).
  
## Remarks  
  
Connection types are determined when devices first authenticate an initial user into the network. If this network permitted direct peer-to-peer connectivity via the [PartyNetworkConfiguration::directPeerConnectivityOptions](../../../structs/partynetworkconfiguration.md) field, neither device had excluded such connectivity via the [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](../../../enums/partyoption.md) option, and a direct peer connection was successfully established at that time, then this function will report a value of [PartyDeviceConnectionType::DirectPeerConnection](../../../enums/partydeviceconnectiontype.md). Otherwise it will report [PartyDeviceConnectionType::RelayServer](../../../enums/partydeviceconnectiontype.md). The value won't change for as long as the target PartyDevice object remains in this network, even if [PartyNetwork::RemoveLocalUser()](partynetwork_removelocaluser.md) is called for that initially authenticating user. <br /><br /> If the target device is the local device, [PartyDeviceConnectionType::RelayServer](../../../enums/partydeviceconnectiontype.md) will always be reported regardless of [PartyNetworkConfiguration](../../../structs/partynetworkconfiguration.md) settings or [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](../../../enums/partyoption.md) option.   <br /><br /> If the target device object isn't participating in this network, an error is returned.   <br /><br /> If the local device is participating in more networks with the target device object, you shouldn't assume that calling this same function on those other network objects will report the same value.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[PartyNetwork](../partynetwork.md)  
[PartyDeviceConnectionType](../../../enums/partydeviceconnectiontype.md)  
[PartyNetworkConfiguration](../../../structs/partynetworkconfiguration.md)  
[PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](../../../enums/partyoption.md)
  
  
