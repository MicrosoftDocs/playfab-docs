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
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

Receives messages from [real-time messages
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
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
