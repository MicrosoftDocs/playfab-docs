---
author: WarrenAlpert
title: Message real-time notifications type
description: Message real-time notifications type
ms.author: waralp
ms.topic: reference
ms.prod: playfab
ms.date: 03/10/2022
---

# Message

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
    "topic": "Opaque~Topic~String~6183258",
    "payload": "eyJsb2JieUlkIjoiODEyNDZmY2ItMWVmNy00ZmU1LTliYzctZTg3MjBiNmFjNWIxIiwibG9iYnlDaGFuZ2VzIjpbeyJjaGFuZ2VOdW1iZXIiOjEsIm1lbWJlclRvTWVyZ2UiOnsibWVtYmVyRW50aXR5Ijp7IlR5cGUiOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCIsIklkIjoiOTgxRDU5MTcwRTI4NEE3MiJ9fX1dfQ==",
    "traceId": "4bf92f3577b34da6a3ce929d0e0e4736"
}
```

## Members

**`topic`** &nbsp; string

A topic string, matching the topic string returned when [subscribing to
resources](../subscribing-to-resources.md). This field allows the client to keep
track of which messages are for which resources they subscribed to.

Example: `Opaque~Topic~String~6183258`

**`payload`** &nbsp; string

The payload of the message.

Example:
`eyJsb2JieUlkIjoiODEyNDZmY2ItMWVmNy00ZmU1LTliYzctZTg3MjBiNmFjNWIxIiwibG9iYnlDaGFuZ2VzIjpbeyJjaGFuZ2VOdW1iZXIiOjEsIm1lbWJlclRvTWVyZ2UiOnsibWVtYmVyRW50aXR5Ijp7IlR5cGUiOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCIsIklkIjoiOTgxRDU5MTcwRTI4NEE3MiJ9fX1dfQ==`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Client method [ReceiveMessage](../client-methods/receive-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
