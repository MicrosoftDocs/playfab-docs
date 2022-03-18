---
author: WarrenAlpert
title: Subscribing to resources for real-time notifications
description: Subscribing to resources for real-time notifications
ms.author: waralp
ms.topic: reference
ms.prod: playfab
ms.date: 03/10/2022
---

# Subscribing to resources

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an
> early look at an upcoming feature, and to allow you to provide feedback while
> it is still in development.

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

After the client [connects to the SignalR
Hub](signalr-hub.md#connecting-to-the-signalr-hub), and calls
[StartOrRecoverSession](server-methods/start-or-recover-session.md) to receive a
`Connection Handle`, it's ready to subscribe to topics and receive messages.
When subscribing to Lobby or Matchmaking resources, the client will need to
provide the `Connection Handle` that they received when starting the session.
For more information about starting and managing a session, see the [SignalR
Hub](signalr-hub.md) overview.

To manage resource subscriptions with the services that publish notifications,
see:

| Service | Subscription API | Unsubscription API |
| --- | --- | --- |
| Lobby service | [SubscribeToLobbyResource](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/subscribetolobbyresource) | [UnsubscribeFromLobbyResource](https://docs.microsoft.com/rest/api/playfab/multiplayer/lobby/unsubscribefromlobbyresource) |
| Matchmaking service | [SubscribeToMatchmakingResource](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/subscribetomatchmakingresource) | [UnsubscribeFromMatchmakingResource](https://docs.microsoft.com/rest/api/playfab/multiplayer/matchmaking/unsubscribefrommatchmakingresource) |

## See also

- [Real-time notifications SignalR Hub](signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](overview.md)
