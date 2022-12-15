---
author: nassosterz-ms
title: GetMemberConnectionStatus
description: Retrieves a member's connection status to the notification service.
ms.author: aterzakis
ms.topic: reference
ms.service: playfab
ms.date: 09/12/2022
---

# Lobby.GetMemberConnectionStatus method

```csharp
public LobbyMemberConnectionStatus GetMemberConnectionStatus(PFEntityKey member)
```

| parameter | description |
| --- | --- |
| member | The member whose connection status will be inspected. |

## Remarks
When joining a lobby, the library establishes a WebSocket connection to the PlayFab PubSub notification service. This connection is used to provide real-time updates to the library about the lobby. This method can be used to determine a member's connection status, which is useful for diagnosing a member's ability to receive updates about the lobby. <br /><br /> A local member which is still in the process of asychronously joining the lobby, via a call to any of [CreateAndJoinLobby()](../PlayFabMultiplayer/CreateAndJoinLobby.md), [JoinLobby()](../PlayFabMultiplayer/CreateAndJoinLobby.md), or [PFLobbyAddMember](AddMember.md), will see their connection status as [LobbyMemberConnectionStatus::NotConnected](../LobbyMemberConnectionStatus.md) until the connection is established.   <br /><br /> When a user's connection status changes from [LobbyMemberConnectionStatus::Connected]((../LobbyMemberConnectionStatus.md) to [LobbyMemberConnectionStatus::NotConnected](../LobbyMemberConnectionStatus.md), they may be experiencing connectivity issues - or their game may have crashed. The lobby owner can remove such users from the lobby via [ForceRemoveMember()](ForceRemoveMember.md).


## See Also

* enum [LobbyMemberConnectionStatus](../LobbyMemberConnectionStatus.md)
* class [Lobby](../Lobby.md)
* namespace [PlayFab.Multiplayer](../../PlayFabMultiplayerSDK.md)

