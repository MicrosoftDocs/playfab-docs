---
author: WarrenAlpert
title: EndSessionRequest real-time notifications type
description: EndSessionRequest real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# EndSessionRequest

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
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
