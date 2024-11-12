---
title: Quality-of-service (QoS) beacons to measure player latency to Azure
author: joannaleecy
description: Describes how to use QoS data to inform the ranking of Azure regions used while requesting a multiplayer server.
ms.author: joanlee
ms.date: 01/17/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer servers, thunderhead, azure, qos, c++ sdk
ms.localizationpriority: medium
---

# Using Quality-of-Service (QoS) beacons to measure player latency to Azure

You can deploy PlayFab multiplayer servers to more than a dozen Azure regions. There are two reasons to do this:

1. Additional regions provide redundancy. If a single Azure region fails, players can access servers in other regions.
2. Additional regions allow players to access servers that are "nearby" and deliver low-latency connectivity.

When you call [RequestMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver), you specify a ranked list of Azure regions that PlayFab uses to fulfill the request. PlayFab will attempt to fulfill the request using the #1 ranked region, but if there aren't servers standing by in that region, or the region has some other fault, a sub-optimal region further down the list will be attempted.

Whenever possible, you should use player latency data to inform the ranking of Azure regions used while requesting a multiplayer server. PlayFab provides services and tools to help with this task.

## Quality-of-service beacons

PlayFab operates beacons in every Azure region in use by PlayFab multiplayer servers. These beacons will reflect UDP traffic and can be used to measure latency with UDP transport.

The usage of UDP is important, because most multiplayer games use UDP transport for their most performance-critical game traffic. Internet service providers and other elements of the Internet ecosystem may deliver differentiated performance for UDP vs. TCP vs. ICMP flows.

This is the typical flow for using these beacons in the context of a player device:

1. Login the player to PlayFab. This is typically done with a [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid) or another login API.
2. Call [ListQoSServersForTitle](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listqosserversfortitle). This provides hostnames to PlayFab's QoS beacons. A typical implementation might have this procedure occur on the **Multiplayer Menu** page for the game.
3. Create a UDP socket.
4. Send a single UDP datagram to port 3075 on the QoS server. The message content must start with 0xFFFF (1111 1111 1111 1111).  
5. The server will reply with a single datagram, with the message contents having the first 2 bytes "flipped" to **0x0000** (0000 0000 0000 0000). The rest of the datagram contents will be copied from the initial ping.
6. Measure the time between sending the UDP message and receiving a response.

## Using the quality-of-service SDK
The PlayFab [C# SDK](https://github.com/PlayFab/CSharpSDK) and [cross-platform (CPP) SDK](https://github.com/PlayFab/XPlatCppSdk) provide an implementation of the QoS ping code. You can build an SDK and use it as a helper library in your PC games, reference the C# NuGet package, or use the code as an example for other platforms.

Each API returns a `QosResult` which contains a sorted list of regions along with the average ping time to each region.

### C#
There is a QoS APIs available in the [C# SDK](https://github.com/PlayFab/CSharpSDK). A sample implementation, [WindowsRunnerCSharpClient](https://github.com/PlayFab/gsdkSamples/tree/master/WindowsRunnerCSharp#running-the-client), is available in the [gsdkSamples repository](https://github.com/PlayFab/gsdkSamples).

The code is located in [*PlayFabQosApi.cs*](https://github.com/PlayFab/CSharpSDK/blob/master/PlayFabSDK/source/Qos/PlayFabQosApi.cs).

Parameters:
* `timeoutMs` - The timeout (in milliseconds) applied to each ping attempt (Default: 250ms). 
* `pingsPerRegion` - The number of ping attempts to make against each region (Default: 10). Increasing this number will increase execution time, but reduce the chance of inaccurate results.
* `degreeOfParallelism` - The maximum number of pings to make in parallel (Default: 4). Increasing this number will reduce execution time, but network contention can cause inaccurate results if this number is too large.

```csharp
        public async Task<QosResult> GetQosResultAsync(
            int timeoutMs = DefaultTimeoutMs,
            int pingsPerRegion = DefaultPingsPerRegion,
            int degreeOfParallelism = DefaultDegreeOfParallelism)
        {
```

### C++
There are the two QoS APIs available in the [PlayFab cross-platform (CPP) SDK](https://github.com/PlayFab/XPlatCppSdk).

The code is located in [*PlayFabQosApi.cpp*](https://github.com/PlayFab/XPlatCppSdk/blob/master/code/source/playfab/QoS/PlayFabQoSApi.cpp). 

Parameters:
* `numThreads` - The maximum number of pings to make in parallel. Increasing this number will reduce execution time, but network contention can cause inaccurate results if this number is too big.
* `timeoutMs` - The timeout (in milliseconds) applied to each ping attempt (Default: 250ms). 

```cpp
  // Runs a QoS operation asynchronously. The operation pings a set of datacenters and returns a result with average response times.
  std::future<QoSResult> GetQoSResultAsync(unsigned int numThreads, unsigned int timeoutMs = DEFAULT_TIMEOUT_MS);

  // Runs a QoS operation synchronously. The operation pings a set of datacenters and returns a result with average response times.
  QoSResult GetQoSResult(unsigned int numThreads, unsigned int timeoutMs = DEFAULT_TIMEOUT_MS);
```
