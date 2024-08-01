---
author: WarrenAlpert
title: EndSessionResponse real-time notifications type
description: EndSessionResponse real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# EndSessionResponse

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
    "status": "Success",
    "traceId": "00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01"
}
```

## Members

**`status`** &nbsp; string

The status of the response. See all [possible ResponseStatus values
here](response-status.md).

Example: `Success`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Type [EndSessionRequest](end-session-request.md)
- Server method [EndSession](../server-methods/end-session.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
