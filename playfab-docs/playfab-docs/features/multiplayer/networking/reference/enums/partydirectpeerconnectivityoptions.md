---
author: jdeweyMSFT
title: "PartyDirectPeerConnectivityOptions"
description: "Flags controlling the attempted use of direct peer-to-peer connectivity among devices in a network."
ms.author: jdewey
ms.topic: reference
ms.prod: playfab
ms.date: 08/05/2020
---

# PartyDirectPeerConnectivityOptions  

Flags controlling the attempted use of direct peer-to-peer connectivity among devices in a network.    

## Syntax  
  
```cpp
enum class PartyDirectPeerConnectivityOptions  : int32_t  
{  
    None = 0x0,  
    SamePlatformType = 0x1,  
    DifferentPlatformType = 0x2,  
    AnyPlatformType = SamePlatformType | DifferentPlatformType,  
    SameEntityLoginProvider = 0x4,  
    DifferentEntityLoginProvider = 0x8,  
    AnyEntityLoginProvider = SameEntityLoginProvider | DifferentEntityLoginProvider,  
}  
```  
  
## Constants  
  
| Constant | Description |
| --- | --- |
| None | No flags are specified.<br/><br/> The absence of flags means that no direct peer connectivity attempts are permitted. All endpoint messages and chat data between devices will always be transmitted via transparent cloud relay servers, and no IP address information will ever be exchanged. |  
| SamePlatformType | Direct peer-to-peer connections may be attempted between devices of the same platform type.<br/><br/> A pair of devices will attempt to establish direct peer-to-peer connections if they're identified as having the same type of hardware and/or OS platform (e.g., Windows PCs, Xbox gaming consoles, iOS-based mobile devices) associated with the specific Party library they use. <br /><br /> Note that this flag does not permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```SameEntityLoginProvider``` and ```DifferentEntityLoginProvider``` flags. <br /><br /> |  
| DifferentPlatformType | Direct peer-to-peer connections may be attempted between devices with differing platform types.<br/><br/> A pair of devices will attempt to establish direct peer-to-peer connections if they're identified as having different types of hardware and/or OS platforms (e.g., Windows PCs, Xbox gaming consoles, iOS-based mobile devices) associated with the specific Party libraries each device uses. <br /><br /> Note that this flag does not permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```SameEntityLoginProvider``` and ```DifferentEntityLoginProvider``` flags. <br /><br /> |  
| AnyPlatformType | Direct peer-to-peer connections may be attempted between devices regardless of their platform types.<br/><br/> This flag is equivalent to ```SamePlatformType | DifferentPlatformType```. |  
| SameEntityLoginProvider | Direct peer-to-peer connections may be attempted between devices that have authenticated user PlayFab Entity IDs that were logged in using the same provider.<br/><br/> A device that's initially authenticating a local user into the network will attempt to establish direct peer-to- peer connections with remote devices that have at least one authenticated user PlayFab Entity ID that was logged in using the same provider (e.g., Xbox Live, Facebook, iOS, Google) as the newly authenticating user. <br /><br /> Note that this flag does not permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```SamePlatformType``` and ```DifferentPlatformType``` flags. <br /><br /> |  
| DifferentEntityLoginProvider | Direct peer-to-peer connections may be attempted between devices with authenticated user PlayFab Entity IDs that that were logged in using different providers.<br/><br/> A device that's initially authenticating a local user into the network will attempt to establish direct peer-to- peer connections with remote devices that do not have any authenticated user PlayFab Entity IDs that were logged in using the same provider (e.g., Xbox Live, Facebook, iOS, Google) as the newly authenticating user. <br /><br /> Note that this flag does not permit any direct peer-to-peer connectivity attempts by itself. It must be combined with one or both of the ```SamePlatformType``` and ```DifferentPlatformType``` flags. <br /><br /> |  
| AnyEntityLoginProvider | Direct peer-to-peer connections may be attempted between devices regardless of the provider used to login authenticated user PlayFab Entity IDs.<br/><br/> This flag is equivalent to ```SameEntityLoginProvider | DifferentEntityLoginProvider```. |  
  
## Remarks  
  
As part of successfully authenticating an initial user into a network, a device may attempt to establish direct peer-to-peer connections with other devices already participating in the network when permitted by these flags declared in the network's [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md) structure. For attempts that are successful, endpoint messages and chat data between the devices will be transmitted using those direct connections. For attempts that fail due to environmental incompatibilities between the devices, all communication between those devices will be transmitted via transparent cloud relay servers instead. If the devices aren't permitted to attempt direct peer connections by these flags, then they never exchange IP address information and will always transmit endpoint messages and chat data via transparent cloud relay servers. <br /><br /> You can determine whether the local device actually established a direct peer-to-peer connection to a specific remote device by calling [PartyNetwork::GetDeviceConnectionType()](../classes/PartyNetwork/methods/partynetwork_getdeviceconnectiontype.md).   <br /><br /> Successful direct peer connectivity may provide lower latency between some devices, though attempting to establish it also requires users to disclose their devices' IP addresses to others, which may be a concern for privacy or for enabling malicious users to potentially attack peers' devices and Internet connections outside of the title. It also may not be permitted on certain platforms for policy reasons. Be sure to use the appropriate flags for your performance and security goals.   <br /><br /> Besides a specific network's [PartyNetworkConfiguration::directPeerConnectivityOptions](../structs/partynetworkconfiguration.md) value, the flags may optionally be further constrained by a device for all networks into which it authenticates by using [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) to set [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](partyoption.md). All flags are evaluated using a bitwise AND operation. That is, a particular flag is actually only in effect for a given network's pair of devices if it's enabled in three places: the network's [PartyNetworkConfiguration](../structs/partynetworkconfiguration.md) structure, and *both* devices' respective local mask options. Even if the Party network permits direct peer connectivity of the relevant form, either device can unilaterally opt out of the IP address disclosure and direct connection attempts between them by not enabling the flag. The [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](partyoption.md) value defaults to permitting all direct peer connections enabled by networks, so you only need to configure it if you have device-specific requirements to prevent some or all direct peer connectivity involving it.   <br /><br /> To avoid excessive resource consumption, the Party library will also internally prevent any given device from attempting to establish more than ```c_maxDirectPeerConnectionsPerDevice``` direct peer connections across all networks in which it's currently participating, even if permitted by these flags. This doesn't affect the device's ability to participate in large or multiple networks with additional remote devices. Communication with additional devices will simply be transmitted via transparent cloud relay servers.   <br /><br /> It's recommended that you don't actively enforce the availability of a direct peer-to-peer connection for any given pair of devices (i.e., don't call [PartyNetwork::LeaveNetwork()](../classes/PartyNetwork/methods/partynetwork_leavenetwork.md) if [PartyNetwork::GetDeviceConnectionType()](../classes/PartyNetwork/methods/partynetwork_getdeviceconnectiontype.md) reports a value other than [PartyDeviceConnectionType::DirectPeerConnection](partydeviceconnectiontype.md)) since the specific underlying transmission method in use doesn't alter the overall logical ability to communicate. If your game design has stringent requirements for maximum message latency that encourage direct peer connectivity, it's better to take action on the current concrete observations of that latency as reported by the [PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds](partyendpointstatistic.md) statistic rather than make abstract assumptions based on transmission mechanism. Otherwise you might continually hinder users trying to play with the same set of friends who always need to use nearby transparent cloud relay servers due to environmental factors beyond their control.
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetworkConfiguration](../structs/partynetworkconfiguration.md)  
[PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](partyoption.md)  
[PartyManager::SetOption](../classes/PartyManager/methods/partymanager_setoption.md)  
[PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds](partyendpointstatistic.md)  
[PartyLocalEndpoint::GetEndpointStatistics](../classes/PartyLocalEndpoint/methods/partylocalendpoint_getendpointstatistics.md)
  
  
