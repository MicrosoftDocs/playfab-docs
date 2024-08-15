---
author: WarrenAlpert
title: SharedSessionResponse real-time notifications type
description: SharedSessionResponse real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# SharedSessionResponse

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
    "entityCount": "2",
    "status": "Success",
    "traceId": "4bf92f3577b34da6a3ce929d0e0e4736"
}
```

## Members

**`entityCount`** &nbsp; number *optional*

The number of entities currently in the shared session. This number can't exceed
`8`.

Example: `2`

**`status`** &nbsp; string

The status of the response. See all [possible ResponseStatus values here](response-status.md).

Example: `Success`

**`traceId`** &nbsp; string

A [W3C TraceContext trace-id](https://www.w3.org/TR/trace-context/#trace-id).
The client should log this field so it can be included if you need to send a bug
report to the PlayFab team.

Example: `4bf92f3577b34da6a3ce929d0e0e4736`

## See also

- Type [SharedSessionRequest](shared-session-request.md)
- Server method [AddEntityToSession](../server-methods/add-entity-to-session.md)
- Server method
  [RemoveEntityFromSession](../server-methods/remove-entity-from-session.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
