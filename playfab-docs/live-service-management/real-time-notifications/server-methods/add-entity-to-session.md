---
author: WarrenAlpert
title: AddEntityToSession SignalR server method
description: AddEntityToSession SignalR server method
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# AddEntityToSession

> [!NOTE]
> Using Lobby, Matchmaking, and real-time notifications directly with REST and
> SignalR APIs is significantly more complex than using client SDKs such as the
> [Lobby C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> and [Matchmaking C++
> SDK](../../multiplayer/lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md),
> and should only be done if the SDKs don't meet your needs.

For scenarios where multiple entities are signed in to the same device. Add an
additional entity to the session, other than the entity that started the
session. This will allow the client to receive messages for multiple local
entities on a shared session.

```text
SharedSessionResponse AddEntityToSession(SharedSessionRequest request)
```

> [!TIP]
> This is a SignalR server method. See [documentation on calling server
> methods](/aspnet/core/signalr/dotnet-client#call-hub-methods-from-client)
> from a SignalR client.

## Parameters

[**`SharedSessionRequest`**](../types/shared-session-request.md)

## Return value

[**`SharedSessionResponse`**](../types/shared-session-response.md)

## See also

- Server method [RemoveEntityFromSession](remove-entity-from-session.md).
- [Real-time notifications SignalR Hub](../signalr-hub.md)
- [Real-time notifications for Lobby and Matchmaking APIs](../overview.md)
