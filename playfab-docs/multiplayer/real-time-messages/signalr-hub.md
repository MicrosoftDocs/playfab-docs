---
author: WarrenAlpert
title: Real-time messages SignalR Hub
description: Real-time messages SignalR Hub
ms.author: waralp
ms.topic: reference
ms.service: azure-playfab
ms.date: 03/10/2022
---

# Real-time messages SignalR Hub

> [!NOTE]
> The REST and SignalR APIs documented here are more complex than the client
> SDKs. Consider using the
> [Lobby C++ SDK](../lobby/playfabmultiplayerreference-cpp/pflobby/pflobby_members.md)
> or [Matchmaking C++ SDK](../lobby/playfabmultiplayerreference-cpp/pfmatchmaking/pfmatchmaking_members.md)
> instead, unless those SDKs don't meet your needs.

The real-time messages feature for [Lobby and Matchmaking
services](../lobby/lobby-and-matchmaking.md) works through a
[SignalR service](/aspnet/core/signalr), which exposes
a [SignalR Hub](/aspnet/core/signalr/introduction#hubs). This
SignalR Hub can be used by game clients to receive messages about [resources
they subscribed to](subscribing-to-resources.md).

## Connecting to the SignalR Hub

The first step in receiving real-time messages is to create a [SignalR
client](/aspnet/core/signalr/client-features). The
client can create a connection to the SignalR Hub by [instantiating a
HubConnection](/aspnet/core/signalr/dotnet-client#connect-to-a-hub)
with the following API: [SignalR Negotiate REST
API](/rest/api/playfab/multiplayer/pub-sub/negotiate).
This API implements the Negotiate API described [in the SignalR
documentation](https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/TransportProtocols.md#post-endpoint-basenegotiate-request).

> [!Warning]
> Using [MessagePack (MsgPack)
> encoding](https://github.com/dotnet/aspnetcore/blob/main/src/SignalR/docs/specs/HubProtocol.md#messagepack-msgpack-encoding)
> when connecting to the SignalR Hub is strongly recommended, and will be
> enforced as the only supported encoding in the future.

> [!IMPORTANT]
> The client **must** set `KeepAliveInterval` to **5 seconds** when building the
> `HubConnection`. The backend service will time out and close connections that
> do not receive a keep-alive ping within **10 seconds**. The default SignalR
> `KeepAliveInterval` of 15 seconds is too slow and will cause disconnections.
>
> ```csharp
> var connection = new HubConnectionBuilder()
>     .WithUrl(hubUrl, options => { /* auth headers */ })
>     .WithKeepAliveInterval(TimeSpan.FromSeconds(5))
>     .Build();
> ```
>
> For more details on SignalR client configuration, see the
> [SignalR configuration documentation](/aspnet/core/signalr/configuration#configure-client-options).

> [!NOTE]
> 1. SignalR client implementations expect the URL to omit the `/negotiate`
>    portion of this path (for example, HubConnection should be created to a URL that ends
>    in `...playfabapi.com/pubsub`).
> 1. The auth headers required to call this API can be passed to the SignalR
>    client via `HttpConnectionOptions` as [seen on this
>    method](/dotnet/api/microsoft.aspnetcore.signalr.client.hubconnectionbuilderhttpextensions.withurl#microsoft-aspnetcore-signalr-client-hubconnectionbuilderhttpextensions-withurl(microsoft-aspnetcore-signalr-client-ihubconnectionbuilder-system-string-system-action((microsoft-aspnetcore-http-connections-client-httpconnectionoptions)))).

## Implementing client methods to receive messages

See the SignalR Client [documentation about implementing client
methods](/aspnet/core/signalr/dotnet-client#call-client-methods-from-hub)
that will be invoked to receive messages. Clients should implement all of the
methods listed in [Client methods](#client-methods) below.

## Starting and ending a session by calling server methods

See the SignalR Client [documentation about calling server
methods](/aspnet/core/signalr/dotnet-client#call-hub-methods-from-client)
to manage your session. For example, once connected to the hub, you must call
[StartOrRecoverSession](server-methods/start-or-recover-session.md) to receive a
`connection handle` that you can use to [subscribe to
resources](subscribing-to-resources.md). Similarly, once you're done with the
session, call [EndSession](server-methods/end-session.md).

## Subscribing to resources

Once a session has been started with
[StartOrRecoverSession](server-methods/start-or-recover-session.md), you can use
the `connection handle` returned to start [subscribing to
resources](subscribing-to-resources.md) and receiving messages.

## APIs

### Client methods

| Name |  Description  |
| --- | --- |
| [ReceiveMessage](client-methods/receive-message.md) | Receive a message. |
| [ReceiveSubscriptionChangeMessage](client-methods/receive-subscription-change-message.md) | Receive a SubscriptionChangeMessage to track current subscriptions. |

### Server methods

| Name |  Description  |
| --- | --- |
| [StartOrRecoverSession](server-methods/start-or-recover-session.md) | Start or recover a session. |
| [EndSession](server-methods/end-session.md) | End the session. |

#### Shared session methods

| Name |  Description  |
| --- | --- |
| [AddEntityToSession](server-methods/add-entity-to-session.md) | For scenarios where multiple entities are signed in to the same device. Add an extra entity to the session, to receive messages for multiple local entities on a shared session. |
| [RemoveEntityFromSession](server-methods/remove-entity-from-session.md) | Remove an entity from the session. |


## See also

- [Subscribing to resources](subscribing-to-resources.md)
- [Real-time messages for Lobby and Matchmaking APIs](overview.md)
