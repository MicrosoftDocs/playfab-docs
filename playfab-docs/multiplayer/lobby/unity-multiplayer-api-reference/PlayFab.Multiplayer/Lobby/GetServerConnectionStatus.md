---
author: raymondcha
title: Lobby.GetServerConnectionStatus
description: Lobby.GetServerConnectionStatus
ms.author: raymondcha
ms.topic: reference
ms.service: azure-playfab
ms.date: 4/19/2024
---

# Lobby.GetServerConnectionStatus method

Retrieves the lobby server's connection status to the notification service.

```csharp
public LobbyServerConnectionStatus GetServerConnectionStatus()
```

## Return Value

The connection status of the lobby.

## Remarks

When joining a lobby, the library establishes a WebSocket connection to the PlayFab PubSub notification service. This connection is used to provide real-time updates to the library about the lobby. This method can be used to determine the lobby server's connection status, which is useful for diagnosing the lobby server's ability to receive updates about the lobby.

Nonowning Lobby servers can only join client-owned lobbies. If no server is joined to the client-owned lobby, this method returns an appropriate error code.

A lobby server, which is still in the process of asynchronously joining the lobby, via a call to [PlayFabMultiplayer.JoinLobbyAsServer()](../PlayFabMultiplayer.PlayFabMultiplayerServer/JoinLobbyAsServer.md) sees its connection status as NotConnected until the connection is established.

A change to a lobby server's connection status is indicated to the title via a [LobbyUpdatedStateChange](../../../../lobby/playfabmultiplayerreference-cpp/pflobby/structs/pflobbyupdatedstatechange.md) with the `LobbyUpdatedStateChange.serverConnectionStatusUpdated` field set to true.

## See Also

* enum [LobbyServerConnectionStatus](../LobbyServerConnectionStatus.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

