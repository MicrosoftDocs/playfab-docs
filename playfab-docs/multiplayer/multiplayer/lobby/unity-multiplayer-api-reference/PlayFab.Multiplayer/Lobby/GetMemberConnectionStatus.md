---
author: nassosterz-ms
title: GetMemberConnectionStatus
description: Retrieves a member's connection status to the notification service.
ms.author: aterzakis
ms.topic: reference
ms.service: azure-playfab
ms.date: 09/12/2022
---

# Lobby.GetMemberConnectionStatus method

Determines a member's connection status to the notification service.

```csharp
public LobbyMemberConnectionStatus GetMemberConnectionStatus(PFEntityKey member)
```

| parameter | description |
| --- | --- |
| member | The member being queried. |

## Return Value

The connection status of a member of the lobby.

## Remarks

When joining a lobby, the library establishes a WebSocket connection to the PlayFab PubSub notification service. This connection is used to provide real-time updates to the library about the lobby. This method can be used to determine a member's connection status, which is useful for diagnosing a member's ability to receive updates about the lobby.

A local member which is still in the process of asychronously joining the lobby, via a call to any of [`CreateAndJoinLobby`](../PlayFabMultiplayer/CreateAndJoinLobby.md), [`JoinLobby`](../PlayFabMultiplayer/JoinLobby.md), or [`AddMember`](./AddMember.md) will see their connection status as NotConnected until the connection is established. When a user's connection status changes from Connected to NotConnected, they may be experiencing connectivity issues - or their game may have crashed. The lobby owner can remove such users from the lobby via [`ForceRemoveMember`](./ForceRemoveMember.md)

## See Also

* enum [LobbyMemberConnectionStatus](../LobbyMemberConnectionStatus.md)
* class [PFEntityKey](../PFEntityKey.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

