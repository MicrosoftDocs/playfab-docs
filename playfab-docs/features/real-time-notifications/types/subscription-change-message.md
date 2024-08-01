---
author: WarrenAlpert
title: SubscriptionChangeMessage real-time notifications type
description: SubscriptionChangeMessage real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# SubscriptionChangeMessage

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

```json
{
    "entityType": "title_player_account",
    "entityId": "6C6B908A2B5B9A4",
    "topic": "Opaque~Topic~String~6183258",
    "status": "SubscribeSuccess",
    "unsubscribeReason": "ResourceOwningServiceDefinedReason",
    "traceId": "4bf92f3577b34da6a3ce929d0e0e4736"
}
```

## Members

**`entityType`** &nbsp; string

The [type of the
entity](../../data/entities/available-built-in-entity-types.md#title_player_account)
whose subscription changed. Clients may only care about this field if they
[added multiple entities](../server-methods/add-entity-to-session.md) to the
same session.

Example: `title_player_account`

**`entityId`** &nbsp; string

The [ID of the
entity](../../data/entities/available-built-in-entity-types.md#title_player_account)
whose subscription changed. Clients may only care about this field if they
[added multiple entities](../server-methods/add-entity-to-session.md) to the
same session.

Example: `6C6B908A2B5B9A4`

**`topic`** &nbsp; string

A topic string, matching the topic string returned when [subscribing to
resources](../subscribing-to-resources.md). This field allows the client to keep
track of which messages are for which resources they subscribed to.

Example: `Opaque~Topic~String~6183258`

**`status`** &nbsp; string

The status of the subscription change.

| Possible Values | Description |
| --- | --- |
| `SubscribeSuccess` | The subscription succeeded. The client can assume they'll receive all messages for the topic from this point on. |
| `SubscribeFailure` | The subscription failed. The client can retry [subscribing to the resource](../subscribing-to-resources.md). |
| `AlreadySubscribed` | The client is already subscribed to the resource it attempted to subscribe to again. |
| `UnsubscribeSuccess` | The unsubscription succeeded. |
| `UnsubscribeFailure` | The unsubscription failed. The client can retry [unsubscribing from the resource](../subscribing-to-resources.md). |
| `NoSubscription` | The client isn't subscribed to the resource it attempted to unsubscribe from. |

**`unsubscribeReason`** &nbsp; string *optional*

A reason for unsubscription, that can be optionally provided by the service
handling the unsubscribe request.

Example: `ResourceOwningServiceDefinedReason`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Client method
  [ReceiveSubscriptionChangeMessage](../client-methods/receive-subscription-change-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
