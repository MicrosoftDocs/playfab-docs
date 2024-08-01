---
author: WarrenAlpert
title: Message real-time notifications type
description: Message real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
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
    // payload is binary data, but when the message is serialized as JSON it will look like a base64 encoded string
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

**`payload`** &nbsp; binary

The payload of the message.

Example:  
`7b 22 6c 6f 62 62 79 49 64 22 3a 22 38 31 32 34 36 66 63 62 2d 31 65 66 37 2d 34 66 65 35 2d 39 62 63 37 2d 65 38 37 32 30 62 36 61 63 35 62 31 22 2c 22 6c 6f 62 62 79 43 68 61 6e 67 65 73 22 3a 5b 7b 22 63 68 61 6e 67 65 4e 75 6d 62 65 72 22 3a 31 2c 22 6d 65 6d 62 65 72 54 6f 4d 65 72 67 65 22 3a 7b 22 6d 65 6d 62 65 72 45 6e 74 69 74 79 22 3a 7b 22 54 79 70 65 22 3a 22 74 69 74 6c 65 5f 70 6c 61 79 65 72 5f 61 63 63 6f 75 6e 74 22 2c 22 49 64 22 3a 22 39 38 31 44 35 39 31 37 30 45 32 38 34 41 37 32 22 7d 7d 7d 5d 7d`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Client method [ReceiveMessage](../client-methods/receive-message.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
