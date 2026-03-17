---
author: WarrenAlpert
title: StartOrRecoverSessionRequest real-time messages type
description: StartOrRecoverSessionRequest real-time messages type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# StartOrRecoverSessionRequest

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

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
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
