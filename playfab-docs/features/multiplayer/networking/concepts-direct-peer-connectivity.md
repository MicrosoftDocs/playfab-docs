---
title: Using direct peer-to-peer connections
description: How to use direct peer connectivity with PlayFab Party
author: tomcoMSFT
ms.author: tomco
ms.date: 08/05/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, p2p, direct, peer, connectivity
---

# PlayFab Party and direct peer-to-peer connections

This page explains how you can enable and use direct peer-to-peer connections in PlayFab Party using example game code. It also includes considerations to help you evaluate when to use direct peer-to-peer connections in your games.

## When to use direct peer-to-peer connections

PlayFab Party supports a wide variety of communication topologies. Conceptually, all chat or data messages are from one peer device or user directly to others. However, Party will automatically leverage a transparent cloud relay service to avoid common environmental and security problems with actually establishing direct peer-to-peer connections. You can achieve low latency data transmission by leveraging its background quality of service (QoS) measurements. (For more info, see [PlayFab Party QoS measurements](concepts-regions.md).) You can optionally enable direct peer-to-peer connections to reduce data transmission latency further. 

### Platform support

Direct peer connectivity is supported in the Windows 10 and Microsoft Game Core versions of the Party library. Other versions of the library will always use the cloud relay for data transmission, regardless of the direct peer connectivity options specified through the client API.

> [!NOTE]
> For the security of the Xbox Live and Xbox console ecosystem, direct peer connectivity isn't supported when using the library on Xbox console or using Xbox Live for authentication unless approved by your studio's Microsoft Representative. For more information, see [Security and platform policy considerations](#security-and-platform-policy-considerations).

### Security and platform policy considerations

Successful direct peer connectivity may provide lower latency between some devices, though attempting to establish it also requires users to disclose their devices' IP addresses to others, which may be a concern for privacy or for enabling malicious users to potentially attack peers' devices and Internet connections outside of the title. It also may not be permitted on certain platforms for policy reasons. Be sure to use the appropriate direct peer connectivity options for your performance and security goals.

If your game runs on PC and doesn't use Xbox Live for authentication, you can use direct peer-to-peer connectivity immediately without going through the approval process. 

If your game runs on Xbox console or uses Xbox Live for authentication, please contact your studio's Microsoft Representative to submit a request to use peer-to-peer. For security and privacy concerns, we are only providing this option to Xbox Managed Partners at this time. Because enabling peer-to-peer in your game code is as simple as changing a field in your network configuration, you can continue developing against the API and testing with the default cloud relay service while your request is processed. Before approval, the library will continue to use the cloud relay service, regardless of the direct peer connectivity options specified through the client API.

### LAN scenarios

Direct peer connectivity in Party can be used to enable extremely low latency in LAN scenarios. Even in these scenarios, however, limited Internet connectivity is required to support user authentication, LiveOps data and insights, and voice chat accessibility features.

### Upstream bandwidth considerations

Using direct peer-to-peer connectivity may increase your game's upstream bandwidth usage. When transmitting a game or voice message through the cloud relay service, Party sends a single message to the service; the service then replicates and forwards the message to each target device. When transmitting a game or voice message through direct peer-to-peer connections, Party replicates and sends the message through a direct connection for each target device to which a direct peer-to-peer connection has been established. Therefore, your game's upstream bandwidth usage will scale proportionally with the number of devices to which a direct peer-to-peer connection has been established. Consider whether this increase in upstream bandwidth is acceptable for your game before enabling direct peer-to-peer connections. 

## How to use direct peer-to-peer connections in your game

### Enabling direct peer-to-peer connections in your network

When creating a network via [`PartyManager::CreateNewNetwork()`](reference\classes\PartyManager\methods\partymanager_createnewnetwork.md), you can specify various network configuration parameters through the [`PartyNetworkConfiguration`](reference\structs\partynetworkconfiguration.md) provided to the call. You can use the `PartyNetworkConfiguration::directPeerConnectivityOptions` field to specify whether and how direct peer-to-peer connectivity is supported for devices in the network.

The following example shows a network configuration that specifies direct peer-to-peer connections should be attempted among all devices in the network, regardless of platform type or login provider.

```cpp
PartyNetworkConfiguration configuration = {};
configuration.directPeerConnectivityOptions = PartyDirectPeerConnectivityOptions::AnyPlatformType | PartyDirectPeerConnectivityOptions::AnyEntityLoginProvider;
// Initialize the rest of the network configuration parameters appropriately for your game before using.
```

As part of successfully authenticating an initial user into a network, a device may attempt to establish direct peer-to-peer connections with other devices already participating in the network when permitted by the network configuration. For attempts that are successful, endpoint messages and chat data between the devices will be transmitted using those direct connections. For attempts that fail due to environmental incompatibilities between the devices, all communication between those devices will be transmitted via transparent cloud relay servers instead. If the devices aren't permitted to attempt direct peer connections by the network configuration, then they never exchange IP address information and will always transmit endpoint messages and chat data via transparent cloud relay servers.

> [!NOTE]
> Establishing direct peer connectivity is best effort and may not be possible due to environmental factors, per-device connectivity options, or platform policy. For more information about evaluating whether a direct peer-to-peer connection was established to a particular device, see [Evaluating the connection type and latency](#evaluating-the-connection-type-and-latency).

### Constraining direct peer connectivity per device

Besides the direct peer connectivity options in the network configuration, direct peer connectivity may be further constrained by a device for all networks into which it authenticates by using [`PartyManager::SetOption()`](reference\classes\PartyManager\methods\partymanager_setoption.md) to set [`PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask`](reference/enums/partyoption.md). All flags are evaluated using a bitwise AND operation. That is, a particular flag is actually only in effect for a given network's pair of devices if it's enabled in three places: the network configuration, and both devices' respective local mask options. Even if the network configuration permits direct peer connectivity of the relevant form, either device can independently opt out of the IP address disclosure and direct connection attempts between them by not enabling the flag in its local device mask option. In versions of the library that support direct peer connectivity, the `PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask` value defaults to permitting all direct peer connections enabled by networks. Therefore, you only need to configure it if you have device-specific requirements to prevent some or all direct peer connectivity involving the local device.

The following example shows how to constrain direct peer connectivity for the local device so that it will only attempt to establish direct peer connectivity to devices of the same platform.

```cpp
PartyDirectPeerConnectivityOptions localDeviceMask = PartyDirectPeerConnectivityOptions::SamePlatformType | PartyDirectPeerConnectivityOptions::AnyEntityLoginProvider;
PartyError error = PartyManager::GetSingleton().SetOption(nullptr, PartyOption::LocalDeviceDirectPeerConnectivityOptionsMask, &localDeviceMask);
if (PARTY_FAILED(error))
{
    printf("Failed to set local device direct peer connectivity options mask! error = 0x%08x\n", error);
}
```

### Evaluating the connection type and latency

You can determine whether the local device actually established a direct peer-to-peer connection to a specific remote device by calling [`PartyNetwork::GetDeviceConnectionType()`](reference\classes\PartyNetwork\methods\partynetwork_getdeviceconnectiontype.md).

We recommend that you don't actively enforce the availability of a direct peer-to-peer connection for any given pair of devices (i.e., don't call [`PartyNetwork::LeaveNetwork()`](reference\classes\PartyNetwork\methods\partynetwork_leavenetwork.md) if PartyNetwork::GetDeviceConnectionType() reports a value other than [`PartyDeviceConnectionType::DirectPeerConnection`](reference/enums/partydeviceconnectiontype.md)) since the specific underlying transmission method in use doesn't alter the overall logical ability to communicate. If your game design has stringent requirements for maximum message latency that encourage direct peer connectivity, it's better to take action on the current concrete observations of that latency as reported by the [`PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds`](reference/enums/partyendpointstatistic.md) statistic rather than make abstract assumptions based on transmission mechanism. Otherwise you might continually hinder users trying to play with the same set of friends who always need to use nearby transparent cloud relay servers due to environmental factors beyond their control.

The following example shows how to inspect the round trip latency from a `localEndpoint` to a `remoteEndpoint` in a `network`.

```cpp
// A helper for inspecting the connection type and average round trip latency between a local endpoint and a remote
// endpoint in a network.
void PrintConnectionTypeAndLatency(
    PartyNetwork* network,
    PartyLocalEndpoint* localEndpoint,
    PartyEndpoint* remoteEndpoint
    )
{
    // Retrieve the device associated with the remote endpoint.
    PartyDevice* remoteDevice;
    PartyError error = remoteEndpoint->GetDevice(&remoteDevice);
    if (PARTY_FAILED(error))
    {
        printf("Failed to get the remote device! error = 0x%08x\n", error);
        return;
    }

    // Get the device connection type.
    PartyDeviceConnectionType connectionType;
    PartyError error = network->GetDeviceConnectionType(remoteDevice, &connectionType);
    if (PARTY_FAILED(error))
    {
        printf("Failed to get device connection type! error = 0x%08x\n", error);
        return;
    }

    // Retrieve the latency statistic.
    PartyEndpointStatistic latencyStatistic = PartyEndpointStatistic::AverageDeviceRoundTripLatencyInMilliseconds;
    uint64_t latencyStatisticValue;
    error = localEndpoint->GetEndpointStatistics(
        1,                       // targetEndpointCount
        &remoteEndpoint,         // targetEndpoints
        1,                       // statisticCount
        &latencyStatistic,       // statisticTypes
        &latencyStatisticValue); // statisticValues
    if (PARTY_FAILED(error))
    {
        printf("Failed to get latency statistic! error = 0x%08x\n", error);
        return;
    }

    // Print the results.
    printf("Local endpoint 0x%p and remote endpoint 0x%p in network 0x%p have average round trip latency %llu ms and device connection type %i\n",
        localEndpoint,
        remoteEndpoint,
        network,
        latencyStatisticValue,
        static_cast<int32_t>(connectionType));
}
```

## Billing meters

The same [billing meters](pricing.md) are applied in networks that use direct peer-to-peer connections as in networks that use the cloud relay service. However, only game or voice data that goes through the cloud relay service count toward the **Network egress** and **Party voice** meters.

