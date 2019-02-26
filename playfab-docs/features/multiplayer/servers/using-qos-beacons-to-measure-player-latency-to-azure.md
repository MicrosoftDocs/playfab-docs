---
title: Using quality-of-service (QoS) beacons to measure player latency to Azure
author: v-thopra
description: Describes how to use QoS data to inform the ranking of Azure regions used while requesting a multiplayer server.
ms.author: v-thopra
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer servers, thunderhead, azure, qos, c++ sdk
ms.localizationpriority: medium
---

# Using Quality-of-Service (QoS) beacons to measure player latency to Azure

You can deploy PlayFab multiplayer servers to more than a dozen **Azure** regions. There are two reasons to do this:

1. Additional regions provide redundancy, so if a single **Azure** region fails, players can access servers on other regions.
2. Additional regions allow players to access servers that are “nearby” and deliver low-latency connectivity.

When you call [RequestMultiplayerServer](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.requestmultiplayerserver), you specify a ranked list of **Azure** regions that PlayFab uses to fulfill the request. PlayFab will attempt to fulfill the request using the #1 ranked region, but if there aren't servers standing by in that region, or the region has some other fault, a sub-optimal region further down the list will be attempted.

Whenever possible, you should use player latency data to inform the ranking of **Azure** regions used while requesting a multiplayer server. PlayFab provides services and tools to help with this task.

## Quality-of-service beacons

PlayFab operates beacons in every **Azure** region in use by PlayFab multiplayer servers. These beacons will reflect **UDP** traffic and can be used to measure latency with **UDP** transport.

The usage of **UDP** is important, because most multiplayer games use **UDP** transport for their most performance-critical game traffic. Internet service providers and other elements of the Internet ecosystem may deliver differentiated performance for **UDP** vs. **TCP** vs. **ICMP** flows.

This is the typical flow for using these beacons in the context of a player device:

1. Log-in the player to PlayFab. This is typically done with a [LoginWithCustomID](xref:titleid.playfabapi.com.client.authentication.loginwithcustomid) or another login **API**.
2. Call [ListQoSServers](xref:titleid.playfabapi.com.multiplayer.multiplayerserver.listqosservers). This provides hostnames to PlayFab’s QoS beacons. A typical implementation might have this procedure occur on the **Multiplayer Menu** page for the game.
3. Create a **UDP** socket.
4. Send a single **UDP** datagram to port 3075 on the QoS server. The message content must start with 2 bytes of 255 (1111 1111 1111 1111).  
5. The server will reply with a single datagram, with the message contents having the first 2 bytes "flipped" to **0** (**0000 0000 0000 0000**). The rest of the datagram contents will be copied from the initial ping.
6. Measure the time between sending the **UDP** message and receiving a response.

## Using the quality-of-service C++ SDK

PlayFab provides **Windows C++** sub-routines demonstrating this QoS flow in the [C++ quickstart for Windows](../../../sdks/xplatcpp/quickstart-windows.md). You can build the **SDK** and use it as a helper library in your PC games, or use the code as an example for other platforms.

These are the two [QoS APIs available in the SDK](https://github.com/PlayFab/XPlatCppSdk/blob/master/cppsdk/include/playfab/QoS/PlayFabQoSApi.h), as noted below.

```cpp
  // Runs a QoS operation asynchronously. The operation pings a set of datacenters and returns a result with average response times.
  std::future<QoSResult> GetQoSResultAsync(unsigned int numThreads, unsigned int timeoutMs = DEFAULT_TIMEOUT_MS);

  // Runs a QoS operation synchronously. The operation pings a set of datacenters and returns a result with average response times.
  QoSResult GetQoSResult(unsigned int numThreads, unsigned int timeoutMs = DEFAULT_TIMEOUT_MS);
```