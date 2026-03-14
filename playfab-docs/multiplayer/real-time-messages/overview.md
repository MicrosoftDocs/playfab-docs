---
author: WarrenAlpert
title: Real-time messages for Lobby and Matchmaking APIs
description: Real-time messages for Lobby and Matchmaking APIs
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# Real-time messages for Lobby and Matchmaking APIs

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

The [Lobby and Matchmaking
services](../lobby/lobby-and-matchmaking.md) offer a real-time
messages feature, which enables individual game clients to subscribe to
receive messages from these services. Game clients subscribe for
messages over a persistent [SignalR WebSocket
connection](/aspnet/core/signalr/introduction). To learn more about
the scenario as a whole, see the [conceptual documentation for Lobby and
Matchmaking real-time
messages](../lobby/lobby-and-matchmaking-real-time-messages.md).

To use this feature, game clients will first need to [implement a SignalR client
that connects to the SignalR Hub](signalr-hub.md) for real-time messages.
Once connected, the clients can [subscribe to
resources](subscribing-to-resources.md) they would like to receive messages
for.

## See also

- [Real-time messages SignalR Hub](signalr-hub.md)
- [Subscribing to resources](subscribing-to-resources.md)
