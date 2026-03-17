---
author: WarrenAlpert
title: EndSessionRequest real-time messages type
description: EndSessionRequest real-time messages type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# EndSessionRequest

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

```json
{
    "traceParent": "00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01"
}
```

## Members

**`traceParent`** &nbsp; string

A valid [W3C TraceContext TraceParent
Header](https://www.w3.org/TR/trace-context/#traceparent-header).

Example: `00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01`

## See also

- Type [EndSessionResponse](end-session-response.md)
- Server method [EndSession](../server-methods/end-session.md)
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
