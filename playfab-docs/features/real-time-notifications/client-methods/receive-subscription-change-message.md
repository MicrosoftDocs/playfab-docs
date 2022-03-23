---
author: WarrenAlpert
title: ReceiveSubscriptionChangeMessage SignalR client method
description: ReceiveSubscriptionChangeMessage SignalR client method
ms.author: waralp
ms.topic: reference
ms.prod: playfab
ms.date: 03/10/2022
---

# ReceiveSubscriptionChangeMessage

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an
> early look at an upcoming feature, and to allow you to provide feedback while
> it is still in development.

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
unsubscribe has finished processing.

```text
ReceiveSubscriptionChangeMessage(SubscriptionChangeMessage subscriptionChangeMessage)
```

> [!TIP]
> This is a SignalR client method. See [documentation on exposing client
> methods](https://docs.microsoft.com/aspnet/core/signalr/dotnet-client#call-client-methods-from-hub)
> in a SignalR client, which will be invoked by the server.

## Parameters

[**`SubscriptionChangeMessage`**](../types/subscription-change-message.md)

## See also

- Type [SubscriptionChangeMessage](../types/subscription-change-message.md)
- Client method [ReceiveMessage](receive-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
