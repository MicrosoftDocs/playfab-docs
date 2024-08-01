---
author: WarrenAlpert
title: ReceiveSubscriptionChangeMessage SignalR client method
description: ReceiveSubscriptionChangeMessage SignalR client method
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# ReceiveSubscriptionChangeMessage

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

Receives [SubscriptionChangeMessages](../types/subscription-change-message.md),
so the client will know when its [subscription](../subscribing-to-resources.md)
status changes. This message indicates that a request to subscribe or
unsubscribe has finished processing. It is possible that the service will fail
to perform a subscription update in a way where the client will never receive
this message. Because of this, clients should implement a timer so they can
retry the subscription call if no
[SubscriptionChangeMessage](../types/subscription-change-message.md) is received
by this method after 5 seconds. This timer-based retry can be performed a few
times with exponential backoff for subsequent attempts.

```text
ReceiveSubscriptionChangeMessage(SubscriptionChangeMessage subscriptionChangeMessage)
```

> [!TIP]
> This is a SignalR client method. See [documentation on exposing client
> methods](/aspnet/core/signalr/dotnet-client#call-client-methods-from-hub)
> in a SignalR client, which will be invoked by the server.

## Parameters

[**`SubscriptionChangeMessage`**](../types/subscription-change-message.md)

## See also

- Type [SubscriptionChangeMessage](../types/subscription-change-message.md)
- Client method [ReceiveMessage](receive-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
