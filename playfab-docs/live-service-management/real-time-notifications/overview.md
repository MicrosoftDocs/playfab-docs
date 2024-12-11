---
author: WarrenAlpert
title: Real-time notifications for Lobby and Matchmaking APIs
description: Real-time notifications for Lobby and Matchmaking APIs
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# Real-time notifications for Lobby and Matchmaking APIs

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

The [Lobby and Matchmaking
services](../multiplayer/lobby/lobby-and-matchmaking.md) offer a real-time
notifications feature, which enables individual game clients to subscribe to
receive notifications from these services. Game clients subscribe for
notifications over a persistent [SignalR WebSocket
connection](/aspnet/core/signalr/introduction). To learn more about
the scenario as a whole, see the [conceptual documentation for Lobby and
Matchmaking real-time
notifications](../multiplayer/lobby/lobby-and-matchmaking-real-time-notifications.md).

To use this feature, game clients will first need to [implement a SignalR client
that connects to the SignalR Hub](signalr-hub.md) for real-time notifications.
Once connected, the clients can [subscribe to
resources](subscribing-to-resources.md) they would like to receive notifications
for.

## See also

- [Real-time notifications SignalR Hub](signalr-hub.md)
- [Subscribing to resources](subscribing-to-resources.md)
