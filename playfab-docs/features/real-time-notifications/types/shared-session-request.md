---
author: WarrenAlpert
title: SharedSessionRequest real-time notifications type
description: SharedSessionRequest real-time notifications type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# SharedSessionRequest

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
    "traceParent": "00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01"
}
```

## Members

**`entityType`** &nbsp; string

The [type of the
entity](../../data/entities/available-built-in-entity-types.md#title_player_account)
to add to the session. Currently we only accept `title_player_account`.

Example: `title_player_account`

**`entityId`** &nbsp; string

The [ID of the
entity](../../data/entities/available-built-in-entity-types.md#title_player_account)
to add to the session.

Example: `6C6B908A2B5B9A4`

**`traceParent`** &nbsp; string

A valid [W3C TraceContext TraceParent
Header](https://www.w3.org/TR/trace-context/#traceparent-header).

Example: `00-84678fd69ae13e41fce1333289bcf482-22d157fb94ea4827-01`

## See also

- Type [SharedSessionResponse](shared-session-response.md)
- Server method [AddEntityToSession](../server-methods/add-entity-to-session.md)
- Server method
  [RemoveEntityFromSession](../server-methods/remove-entity-from-session.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
