---
author: WarrenAlpert
title:  ReceiveMessage SignalR client method
description:  ReceiveMessage SignalR client method
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# ReceiveMessage

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

Receives messages from [real-time notifications
subscriptions](../subscribing-to-resources.md).

```text
ReceiveMessage(Message message)
```

> [!TIP]
> This is a SignalR client method. See [documentation on exposing client
> methods](/aspnet/core/signalr/dotnet-client#call-client-methods-from-hub)
> in a SignalR client, which will be invoked by the server.

## Parameters

[**`Message`**](../types/message.md)

## See also

- Type [Message](../types/message.md)
- Client method
  [ReceiveSubscriptionChangeMessage](receive-subscription-change-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
