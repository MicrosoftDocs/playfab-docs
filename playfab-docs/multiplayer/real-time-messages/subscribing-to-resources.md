---
author: WarrenAlpert
title: Subscribing to resources for real-time messages
description: Subscribing to resources for real-time messages
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# Subscribing to resources

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

After the client [connects to the SignalR
Hub](signalr-hub.md#connecting-to-the-signalr-hub), and calls
[StartOrRecoverSession](server-methods/start-or-recover-session.md) to receive a
`Connection Handle`, it's ready to subscribe to topics and receive messages.
When subscribing to Lobby or Matchmaking resources, the client will need to
provide the `Connection Handle` that they received when starting the session.
For more information about starting and managing a session, see the [SignalR
Hub](signalr-hub.md) overview.

To manage resource subscriptions with the services that publish messages,
see:

| Service | Subscription API | Unsubscription API |
| --- | --- | --- |
| Lobby service | [SubscribeToLobbyResource](/rest/api/playfab/multiplayer/lobby/subscribe-to-lobby-resource) | [UnsubscribeFromLobbyResource](/rest/api/playfab/multiplayer/lobby/unsubscribe-from-lobby-resource) |
| Matchmaking service | [SubscribeToMatchmakingResource](/rest/api/playfab/multiplayer/matchmaking/subscribe-to-matchmaking-resource) | [UnsubscribeFromMatchmakingResource](/rest/api/playfab/multiplayer/matchmaking/unsubscribe-from-matchmaking-resource) |

## See also

- [Real-time messages SignalR Hub](signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](overview.md)
