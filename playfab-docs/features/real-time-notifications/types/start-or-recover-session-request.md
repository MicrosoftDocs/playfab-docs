---
author: WarrenAlpert
title: StartOrRecoverSessionRequest real-time notifications type
description: StartOrRecoverSessionRequest real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# StartOrRecoverSessionRequest

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
    "oldConnectionHandle": "1.Y2VudHJhbC11c35sb2NhbGhvc3R+QkxVV1pYSEwwZkF0b1o5WUR2MV9vQQ==",
    "traceParent": "00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01"
}
```

## Members

**`oldConnectionHandle`** &nbsp; string *optional*

If recovering a session due to unexpected disconnection, subscriptions can be
recovered by providing the `newConnectionHandle` from the last session's
[StartOrRecoverSessionResponse](start-or-recover-session-response.md).

Example: `1.Y2VudHJhbC11c35sb2NhbGhvc3R+QkxVV1pYSEwwZkF0b1o5WUR2MV9vQQ==`

**`traceParent`** &nbsp; string

A valid [W3C TraceContext TraceParent
Header](https://www.w3.org/TR/trace-context/#traceparent-header).

Example: `00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01`

## See also

- Type [StartOrRecoverSessionResponse](start-or-recover-session-response.md)
- Server method
  [StartOrRecoverSession](../server-methods/start-or-recover-session.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
