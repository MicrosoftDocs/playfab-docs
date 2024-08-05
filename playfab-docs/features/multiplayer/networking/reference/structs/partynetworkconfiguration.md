---
author: jdeweyMSFT
title: "PartyNetworkConfiguration"
description: "Network configuration data."
ms.author: jdewey
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/11/2022
---

# PartyNetworkConfiguration  

Network configuration data.  

## Syntax  
  
```cpp
struct PartyNetworkConfiguration {  
    uint32_t maxUserCount;  
    uint32_t maxDeviceCount;  
    uint32_t maxUsersPerDeviceCount;  
    uint32_t maxDevicesPerUserCount;  
    uint32_t maxEndpointsPerDeviceCount;  
    PartyDirectPeerConnectivityOptions directPeerConnectivityOptions;  
}  
```
  
### Members  
  
**`maxUserCount`** &nbsp; uint32_t  
  
The maximum number of unique users allowed in the network.
  
This value must be greater than 0. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxDeviceCount`** &nbsp; uint32_t  
  
The maximum number of devices allowed to connect to the network.
  
This value must be between 1 and ```c_maxNetworkConfigurationMaxDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyManager::ConnectToNetwork()](../classes/PartyManager/methods/partymanager_connecttonetwork.md), the operation will fail asynchronously and [PartyConnectToNetworkCompletedStateChange::result](partyconnecttonetworkcompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxUsersPerDeviceCount`** &nbsp; uint32_t  
  
The maximum number of users allowed per device.
  
This value must be between 1 and ```c_maxLocalUsersPerDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxDevicesPerUserCount`** &nbsp; uint32_t  
  
The maximum number of devices allowed per user.
  
This value must be greater than 0. <br /><br /> If a client would violate this limit by calling [PartyNetwork::AuthenticateLocalUser()](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md), the operation will fail asynchronously and [PartyAuthenticateLocalUserCompletedStateChange::result](partyauthenticatelocalusercompletedstatechange.md) will be set to [PartyStateChangeResult::NetworkLimitReached](../enums/partystatechangeresult.md).
  
**`maxEndpointsPerDeviceCount`** &nbsp; uint32_t  
  
The maximum number of endpoints allowed per device.
  
This value must be between 0 and ```c_maxNetworkConfigurationMaxEndpointsPerDeviceCount``` inclusive. <br /><br /> If a client would violate this limit by calling [PartyNetwork::CreateEndpoint()](../classes/PartyNetwork/methods/partynetwork_createendpoint.md) after the network configuration was made available, the call to PartyNetwork::CreateEndpoint() will fail synchronously. If the client had already queued a violating number of endpoint creations when the network configuration became available, the client will be kicked from the network and a [PartyNetworkDestroyedStateChange](partynetworkdestroyedstatechange.md) will be generated.
  
**`directPeerConnectivityOptions`** &nbsp; [PartyDirectPeerConnectivityOptions](../enums/partydirectpeerconnectivityoptions.md)  
  
Whether and how to support direct peer-to-peer connection attempts among devices in the network.
  
As part of successfully authenticating an initial user into a network, a device may attempt to establish direct peer-to-peer connections with other devices already participating in the network when permitted by these flags. For attempts that are successful, endpoint messages and chat data between the devices will be transmitted using those direct connections. For attempts that fail due to environmental incompatibilities between the devices, all communication between those devices will be transmitted via transparent cloud relay servers instead. If the devices aren't permitted to attempt direct peer connections by these flags, then they never exchange IP address information and will always transmit endpoint messages and chat data via transparent cloud relay servers. <br /><br /> You can determine whether the local device actually established a direct peer-to-peer connection to a specific remote device by calling [PartyNetwork::GetDeviceConnectionType()](../classes/PartyNetwork/methods/partynetwork_getdeviceconnectiontype.md).   <br /><br /> Successful direct peer connectivity may provide lower latency between some devices, though attempting to establish it also requires users to disclose their devices' IP addresses to others, which may be a concern for privacy or for enabling malicious users to potentially attack peers' devices and Internet connections outside of the title. It also may not be permitted on certain platforms for policy reasons. Be sure to use the appropriate flags for your performance and security goals.   <br /><br /> Besides the specific network's value configured here, the flags may optionally be further constrained by a device for all networks into which it authenticates by using [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) to set [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](../enums/partyoption.md). All flags are evaluated using a bitwise AND operation. That is, a particular flag is actually only in effect for a given network's pair of devices if it's enabled in three places: this field for the network, and *both* devices' respective local mask options. Even if this field permits direct peer connectivity of the relevant form, either device can unilaterally opt out of the IP address disclosure and direct connection attempts between them by not enabling the flag in its local device mask option. The [PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask](../enums/partyoption.md) value defaults to permitting all direct peer connections enabled by networks, so you only need to configure it if you have device-specific requirements to prevent some or all direct peer connectivity involving it.   <br /><br /> To avoid excessive resource consumption, the Party library will also internally prevent any given device from attempting to establish more than a configured maximum number of direct peer connections across all networks in which it's currently participating, even if permitted by these flags. This doesn't affect the device's ability to participate in large or multiple networks with additional remote devices. Communication with additional devices will simply be transmitted via transparent cloud relay servers. To modify that maximum number of direct peer connections, use [PartyManager::SetOption()](../classes/PartyManager/methods/partymanager_setoption.md) to set [PartyOption::LocalDeviceMaxDirectPeerConnections](../enums/partyoption.md).   <br /><br /> It's recommended that you don't actively enforce the availability of a direct peer-to-peer connection for any given pair of devices (i.e., don't call [PartyNetwork::LeaveNetwork()](../classes/PartyNetwork/methods/partynetwork_leavenetwork.md) if [PartyNetwork::GetDeviceConnectionType()](../classes/PartyNetwork/methods/partynetwork_getdeviceconnectiontype.md) reports a value other than [PartyDeviceConnectionType::DirectPeerConnection](../enums/partydeviceconnectiontype.md)) since the specific underlying transmission method in use doesn't alter the overall logical ability to communicate. If your game design has stringent requirements for maximum message latency that encourage direct peer connectivity, it's better to take action on the current concrete observations of that latency as reported by the [PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds](../enums/partyendpointstatistic.md) statistic rather than make abstract assumptions based on transmission mechanism. Otherwise you might continually hinder users trying to play with the same set of friends who always need to use nearby transparent cloud relay servers due to environmental factors beyond their control.
  
  
## Requirements  
  
**Header:** Party.h
  
## See also  
[Party members](../party_members.md)  
[PartyNetwork::AuthenticateLocalUser](../classes/PartyNetwork/methods/partynetwork_authenticatelocaluser.md)  
[PartyAuthenticateLocalUserCompletedStateChange](partyauthenticatelocalusercompletedstatechange.md)  
[PartyManager::ConnectToNetwork](../classes/PartyManager/methods/partymanager_connecttonetwork.md)  
[PartyConnectToNetworkCompletedStateChange](partyconnecttonetworkcompletedstatechange.md)  
[PartyNetwork::CreateEndpoint](../classes/PartyNetwork/methods/partynetwork_createendpoint.md)  
[PartyNetworkDestroyedStateChange](partynetworkdestroyedstatechange.md)  
[PartyStateChangeResult](../enums/partystatechangeresult.md)  
[PartyDirectPeerConnectivityOptions](../enums/partydirectpeerconnectivityoptions.md)
  
  
