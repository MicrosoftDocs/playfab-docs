---
author: WarrenAlpert
title: SharedSessionRequest real-time messages type
description: SharedSessionRequest real-time messages type
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# SharedSessionRequest

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

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
entity](../../../live-service-management/game-configuration/entities/available-built-in-entity-types.md#title_player_account)
to add to the session. Currently we only accept `title_player_account`.

Example: `title_player_account`

**`entityId`** &nbsp; string

The [ID of the
entity](../../../live-service-management/game-configuration/entities/available-built-in-entity-types.md#title_player_account)
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
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
