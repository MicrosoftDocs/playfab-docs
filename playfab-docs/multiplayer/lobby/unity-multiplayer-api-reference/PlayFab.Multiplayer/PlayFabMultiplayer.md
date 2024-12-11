---
author: vicodex
title: PlayFabMultiplayer class
description: PlayFabMultiplayer members
ms.author: victorku
ms.topic: reference
ms.service: azure-playfab
ms.date: 11/23/2021
---

# Class PlayFabMultiplayer

```csharp
public class PlayFabMultiplayer
```

## Public Members

| name | description |
| --- | --- |
| [PlayFabMultiplayer](PlayFabMultiplayer/PlayFabMultiplayer.md)() | The default constructor. |
| static [IsInitialized](PlayFabMultiplayer/IsInitialized.md) { get; } | Returns true if the library has been initialized. |
| static [LogLevel](PlayFabMultiplayer/LogLevel.md) { get; set; } | Gets or sets the amount of logging currently enabled. |
| const [LobbyClientRequestedSearchResultCountUpperLimit](PlayFabMultiplayer/LobbyClientRequestedSearchResultCountUpperLimit.md) | The maximum number of search results that client-entity callers may request when performing a [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) operation. |
| const [LobbyMaxLobbyPropertyCount](PlayFabMultiplayer/LobbyMaxLobbyPropertyCount.md) | The maximum number of concurrent properties which can be stored for the lobby and which aren't owned by any specific member. |
| const [LobbyMaxMemberCountLowerLimit](PlayFabMultiplayer/LobbyMaxMemberCountLowerLimit.md) | The minimum allowed value for [`MaxMemberCount`](./LobbyCreateConfiguration/MaxMemberCount.md) and [`MaxMemberCount`](./LobbyDataUpdate/MaxMemberCount.md). |
| const [LobbyMaxMemberCountUpperLimit](PlayFabMultiplayer/LobbyMaxMemberCountUpperLimit.md) | The maximum allowed value for [`MaxMemberCount`](./LobbyCreateConfiguration/MaxMemberCount.md) and [`MaxMemberCount`](./LobbyDataUpdate/MaxMemberCount.md). |
| const [LobbyMaxMemberPropertyCount](PlayFabMultiplayer/LobbyMaxMemberPropertyCount.md) | The maximum number of concurrent properties allowed for each member in the lobby. |
| const [LobbyMaxSearchPropertyCount](PlayFabMultiplayer/LobbyMaxSearchPropertyCount.md) | The maximum number of concurrent search properties which can be stored for the lobby. |
| static event [OnAddMemberCompleted](PlayFabMultiplayer/OnAddMemberCompleted.md) | Event triggered when a add member is completed. |
| static event [OnError](PlayFabMultiplayer/OnError.md) | Event triggered when an there is an error calling another API to be used for debugging purposes. |
| static event [OnForceRemoveMemberCompleted](PlayFabMultiplayer/OnForceRemoveMemberCompleted.md) | Event triggered when a force remove member is completed. |
| static event [OnLobbyCreateAndJoinCompleted](PlayFabMultiplayer/OnLobbyCreateAndJoinCompleted.md) | Event triggered when a previous call to [`CreateAndJoinLobby`](./PlayFabMultiplayer/CreateAndJoinLobby.md) completed. |
| static event [OnLobbyDisconnected](PlayFabMultiplayer/OnLobbyDisconnected.md) | Event triggered when a client has disconnected from a lobby. |
| static event [OnLobbyFindLobbiesCompleted](PlayFabMultiplayer/OnLobbyFindLobbiesCompleted.md) | Event triggered when the operation started by a previous call to [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) completed. |
| static event [OnLobbyInviteListenerStatusChanged](PlayFabMultiplayer/OnLobbyInviteListenerStatusChanged.md) | Event triggered when an invite listener's status has changed. |
| static event [OnLobbyInviteReceived](PlayFabMultiplayer/OnLobbyInviteReceived.md) | Event triggered when an entity on this client has received an invite to a lobby. |
| static event [OnLobbyJoinArrangedLobbyCompleted](PlayFabMultiplayer/OnLobbyJoinArrangedLobbyCompleted.md) | Event triggered when the operation started by a previous call to [`JoinArrangedLobby`](./PlayFabMultiplayer/JoinArrangedLobby.md) completed. |
| static event [OnLobbyJoinCompleted](PlayFabMultiplayer/OnLobbyJoinCompleted.md) | Event triggered when the operation started by a previous call to [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md) completed. |
| static event [OnLobbyLeaveCompleted](PlayFabMultiplayer/OnLobbyLeaveCompleted.md) | Event triggered when the operation started by a previous call to [`Leave`](./Lobby/Leave.md) completed. |
| static event [OnLobbyMemberAdded](PlayFabMultiplayer/OnLobbyMemberAdded.md) | Event triggered when a PlayFab entity was added to a lobby as a member. |
| static event [OnLobbyMemberRemoved](PlayFabMultiplayer/OnLobbyMemberRemoved.md) | Event triggered when a PlayFab entity was removed from a lobby as a member. |
| static event [OnLobbyPostUpdateCompleted](PlayFabMultiplayer/OnLobbyPostUpdateCompleted.md) | Event triggered when the operation started by a previous call to [`PostUpdate`](./Lobby/PostUpdate.md) completed. |
| static event [OnLobbySendInviteCompleted](PlayFabMultiplayer/OnLobbySendInviteCompleted.md) | Event triggered when the operation started by a previous call to [`SendInvite`](./Lobby/SendInvite.md) completed. |
| static event [OnLobbyUpdated](PlayFabMultiplayer/OnLobbyUpdated.md) | Event triggered when the lobby was updated. |
| static event [OnMatchmakingTicketCompleted](PlayFabMultiplayer/OnMatchmakingTicketCompleted.md) | Event triggered when a matchmaking ticket status has completed |
| static event [OnMatchmakingTicketStatusChanged](PlayFabMultiplayer/OnMatchmakingTicketStatusChanged.md) | Event triggered when a matchmaking ticket status has changed. |
| static [CreateAndJoinLobby](PlayFabMultiplayer/CreateAndJoinLobby.md)(…) | Create a new lobby and add the creating PlayFab entity to it. (2 methods) |
| static [CreateMatchmakingTicket](PlayFabMultiplayer/CreateMatchmakingTicket.md)(…) | Creates a matchmaking ticket for one or more local users. (3 methods) |
| static [FindLobbies](PlayFabMultiplayer/FindLobbies.md)(…) | Search for lobbies on behalf of the local user. (2 methods) |
| static [GetLobbyInviteListenerStatus](PlayFabMultiplayer/GetLobbyInviteListenerStatus.md)(…) | Retrieve the status of the entity's invite listener. (2 methods) |
| static [Initialize](PlayFabMultiplayer/Initialize.md)() | Initializes an instance of the PlayFab Multiplayer library. |
| static [JoinArrangedLobby](PlayFabMultiplayer/JoinArrangedLobby.md)(…) | Joins a lobby using an arrangement string provided by another service, such as matchmaking. If no one has joined the lobby yet, the lobby is initialized using the configuration parameters. (2 methods) |
| static [JoinLobby](PlayFabMultiplayer/JoinLobby.md)(…) | Join a lobby as the local PlayFab entity. (2 methods) |
| static [JoinMatchmakingTicketFromId](PlayFabMultiplayer/JoinMatchmakingTicketFromId.md)(…) | Joins one or more multiple local users to a matchmaking ticket using a ticket ID and queue name. (2 methods) |
| static [ProcessLobbyStateChanges](PlayFabMultiplayer/ProcessLobbyStateChanges.md)() | Triggers all the lobby related PlayFabMultiplayer.OnLobby* events since the last such call. |
| static [ProcessMatchmakingStateChanges](PlayFabMultiplayer/ProcessMatchmakingStateChanges.md)() | Triggers all the lobby related PlayFabMultiplayer.OnMatchmaking* events since the last such call. |
| static [SetEntityToken](PlayFabMultiplayer/SetEntityToken.md)(…) | Sets the token that should be used for authentication when performing library actions on behalf of an entity. If a token has previously been set for the entity, this replaces its previous token. (2 methods) |
| static [StartListeningForLobbyInvites](PlayFabMultiplayer/StartListeningForLobbyInvites.md)(…) | Enables the Lobby invite listener for a given entity. (2 methods) |
| static [StopListeningForLobbyInvites](PlayFabMultiplayer/StopListeningForLobbyInvites.md)(…) | Disables the Lobby invite listener for a given entity. (2 methods) |
| static [Uninitialize](PlayFabMultiplayer/Uninitialize.md)() | Immediately reclaims all resources associated with all Multiplayer library objects. |
| delegate [OnAddMemberCompletedHandler](PlayFabMultiplayer.OnAddMemberCompletedHandler.md) | Handler for when the operation started by a previous call to [`AddMember`](./Lobby/AddMember.md) completed |
| delegate [OnErrorEventHandler](PlayFabMultiplayer.OnErrorEventHandler.md) | Handler for when there is an error calling another API to be used for debugging purposes. |
| delegate [OnForceRemoveMemberCompletedHandler](PlayFabMultiplayer.OnForceRemoveMemberCompletedHandler.md) | Handler for when the operation started by a previous call to [`ForceRemoveMember`](./Lobby/ForceRemoveMember.md) completed. |
| delegate [OnLobbyCreateAndJoinCompletedHandler](PlayFabMultiplayer.OnLobbyCreateAndJoinCompletedHandler.md) | Handler for when the operation started by a previous call to [`CreateAndJoinLobby`](./PlayFabMultiplayer/CreateAndJoinLobby.md) completed. |
| delegate [OnLobbyDisconnectedHandler](PlayFabMultiplayer.OnLobbyDisconnectedHandler.md) | Handler for when the client has disconnected from a lobby. |
| delegate [OnLobbyFindLobbiesCompletedHandler](PlayFabMultiplayer.OnLobbyFindLobbiesCompletedHandler.md) | Handler for when the operation started by a previous call to [`FindLobbies`](./PlayFabMultiplayer/FindLobbies.md) completed. |
| delegate [OnLobbyInviteListenerStatusChangedHandler](PlayFabMultiplayer.OnLobbyInviteListenerStatusChangedHandler.md) | Handler for when an invite listener's status has changed. |
| delegate [OnLobbyInviteReceivedHandler](PlayFabMultiplayer.OnLobbyInviteReceivedHandler.md) | Handler for when an entity on this client has received an invite to a lobby. |
| delegate [OnLobbyJoinArrangedLobbyCompletedHandler](PlayFabMultiplayer.OnLobbyJoinArrangedLobbyCompletedHandler.md) | Handler for when the operation started by a previous call to [`JoinArrangedLobby`](./PlayFabMultiplayer/JoinArrangedLobby.md) completed. |
| delegate [OnLobbyJoinCompletedHandler](PlayFabMultiplayer.OnLobbyJoinCompletedHandler.md) | Handler for when the operation started by a previous call to [`JoinLobby`](./PlayFabMultiplayer/JoinLobby.md) completed. |
| delegate [OnLobbyLeaveCompletedHandler](PlayFabMultiplayer.OnLobbyLeaveCompletedHandler.md) | Handler for when the operation started by a previous call to [`Leave`](./Lobby/Leave.md) completed. |
| delegate [OnLobbyMemberAddedHandler](PlayFabMultiplayer.OnLobbyMemberAddedHandler.md) | Handler for when a local PlayFab entity was added to lobby as a member. |
| delegate [OnLobbyMemberRemovedHandler](PlayFabMultiplayer.OnLobbyMemberRemovedHandler.md) | Handler for when a PlayFab entity was removed from a lobby as a member. |
| delegate [OnLobbyPostUpdateCompletedHandler](PlayFabMultiplayer.OnLobbyPostUpdateCompletedHandler.md) | Handler for when the operation started by a previous call to [`PostUpdate`](./Lobby/PostUpdate.md) completed. |
| delegate [OnLobbySendInviteCompletedHandler](PlayFabMultiplayer.OnLobbySendInviteCompletedHandler.md) | Handler for when the operation started by a previous call to [`SendInvite`](./Lobby/SendInvite.md) completed. |
| delegate [OnLobbyUpdatedHandler](PlayFabMultiplayer.OnLobbyUpdatedHandler.md) | Handler for when a lobby was updated. |
| delegate [OnMatchmakingTicketCompletedHandler](PlayFabMultiplayer.OnMatchmakingTicketCompletedHandler.md) | Handler for when a matchmaking ticket status has changed. |
| delegate [OnMatchmakingTicketStatusChangedHandler](PlayFabMultiplayer.OnMatchmakingTicketStatusChangedHandler.md) | Handler for when a matchmaking ticket status has changed. |
| class [PlayFabMultiplayerServer](PlayFabMultiplayer.PlayFabMultiplayerServer.md) | Class for all server lobby functionalities. |

## See Also

* namespace [PlayFab.Multiplayer](../PlayFabMultiplayerSDK.md)
