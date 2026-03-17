---
author: WarrenAlpert
title: EndSession SignalR server method
description: EndSession SignalR server method
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# EndSession

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

End the session.

```text
EndSessionResponse EndSession(EndSessionRequest request)
```

> [!TIP]
> This is a SignalR server method. See [documentation on calling server
> methods](/aspnet/core/signalr/dotnet-client#call-hub-methods-from-client)
> from a SignalR client.

## Parameters

[**`EndSessionRequest`**](../types/end-session-request.md)

## Return value

[**`EndSessionResponse`**](../types/end-session-response.md)

## See also

- Server method [StartOrRecoverSession](start-or-recover-session.md).
- [Real-time messages SignalR Hub](../signalr-hub.md)
- [Real-time messages for Lobby and Matchmaking APIs](../overview.md)
