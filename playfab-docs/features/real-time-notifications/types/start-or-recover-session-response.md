---
author: WarrenAlpert
title: StartOrRecoverSessionResponse real-time notifications type
description: StartOrRecoverSessionResponse real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# StartOrRecoverSessionResponse

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
    "newConnectionHandle": "1.Y2VudHJhbC11c35sb2NhbGhvc3R+QkxVV1pYSEwwZkF0b1o5WUR2MV9vQQ==",
    "recoveredTopics": ["Opaque~Topic~String~6183258", "Another~Opaque~Topic~String~843156"],
    "status": "Success",
    "traceId": "4bf92f3577b34da6a3ce929d0e0e4736"
}
```

## Members

**`newConnectionHandle`** &nbsp; string

An opaque string `Connection Handle`.

The client doesn't need to concern itself with the contents of the connection
handle. The client must acquire it when starting a new session and pass it in
[requests to subscribe to resources](../subscribing-to-resources.md).

If there's an unexpected disconnection with the SignalR server, subscriptions
can be recovered on a new connection by providing it as the
`oldConnectionHandle` when calling
[StartOrRecoverSessionRequest](start-or-recover-session-request.md).

Example: `1.Y2VudHJhbC11c35sb2NhbGhvc3R+QkxVV1pYSEwwZkF0b1o5WUR2MV9vQQ==`

**`recoveredTopics`** &nbsp; string[] *optional*

A list of topic strings, matching the topic strings returned when [subscribing
to resources](../subscribing-to-resources.md). This list only contains values if
a session was recovered from an old `Connection Handle` and subscriptions were
found to recover. It's possible that some subscriptions that are expected here
will not be recovered. If there are any missing subscriptions  the client should
resubscribe to those resources.

Example: `["Opaque~Topic~String~6183258", "Another~Opaque~Topic~String~843156"]`

**`status`** &nbsp; string

The status of the response. See all [possible ResponseStatus values here](response-status.md).

Example: `Success`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Type [StartOrRecoverSessionRequest](start-or-recover-session-request.md)
- Server method
  [StartOrRecoverSession](../server-methods/start-or-recover-session.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
