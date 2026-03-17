---
author: WarrenAlpert
title: StartOrRecoverSession SignalR server method
description: StartOrRecoverSession SignalR server method
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# StartOrRecoverSession

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

Starts a session.

The client must call this method to start the session and obtain the `Connection
Handle` representing it. The client must store this `Connection Handle` to later
use to create subscriptions for the session.

```text
StartOrRecoverSessionResponse StartOrRecoverSession(StartOrRecoverSessionRequest request)
```

> [!TIP]
> This is a SignalR server method. See [documentation on calling server
> methods](/aspnet/core/signalr/dotnet-client#call-hub-methods-from-client)
> from a SignalR client.

## Parameters

[**`StartOrRecoverSessionRequest`**](../types/start-or-recover-session-request.md)

## Return value

[**`StartOrRecoverSessionResponse`**](../types/start-or-recover-session-response.md)

## See also

- Server method [EndSession](end-session.md)
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
