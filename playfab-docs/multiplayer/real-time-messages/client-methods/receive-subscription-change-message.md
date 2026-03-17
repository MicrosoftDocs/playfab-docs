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
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

Receives [SubscriptionChangeMessages](../types/subscription-change-message.md),
so the client knows when its [subscription](../subscribing-to-resources.md)
status changes. This message indicates that a request to subscribe or
unsubscribe finished processing. It's possible that the service fails
to perform a subscription update in a way where the client never receives
this message. For this reason, clients should implement a timer so they can
retry the subscription call if this method doesn't receive a
[SubscriptionChangeMessage](../types/subscription-change-message.md)
after 5 seconds. This timer-based retry can be performed a few
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
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
