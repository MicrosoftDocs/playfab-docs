---
author: WarrenAlpert
title: Response Status Values
description: Response Status Values
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# Response Status

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

Possible values for the **status** member of [SignalR server
method](../signalr-hub.md#server-methods) responses.

## Values

| Value | Description |
| --- | --- |
| **`Success`** |  |
| **`InternalServerError`** | An error occurred in the service. The request can be retried a few times with exponential backoff. |
| **`SharedSessionEntityLimitExceeded`** | An [AddEntityToSession](../server-methods/add-entity-to-session.md) request attempted to add more than `8` entities to the connection. |
| **`UnsupportedEntityType`** | An [AddEntityToSession](../server-methods/add-entity-to-session.md) request attempted to add an entity type other than [title_player_account](../../data/entities/available-built-in-entity-types.md#title_player_account) to the session. |
| **`InvalidRequest`** | Fields in the request were invalid. |
| **`Unavailable`** | The service is temporarily unavailable. The request can be retried a few times with exponential backoff. |
| **`TooManyRequests`** | The individual client or title all-up has exceeded its request rate limit, and the request was throttled. The request can be retried a few times with exponential backoff. |

## See also

- Type [EndSessionResponse](end-session-response.md)
- Type [SharedSessionResponse](shared-session-response.md)
- Type [StartOrRecoverSessionResponse](start-or-recover-session-response.md)
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
