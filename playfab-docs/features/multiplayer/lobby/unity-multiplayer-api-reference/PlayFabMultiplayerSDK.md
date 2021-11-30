---
author: vicodex
title: PlayFabMultiplayerSDK
description: PlayFab.Multiplayer namespace
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PlayFabMultiplayerSDK assembly

> [!IMPORTANT]
> This feature is in **private preview** for limited, Microsoft managed partners.

## PlayFab.Multiplayer namespace

| public type | description |
| --- | --- |
| class [Lobby](./PlayFab.Multiplayer/Lobby.md) |  |
| enum [LobbyAccessPolicy](./PlayFab.Multiplayer/LobbyAccessPolicy.md) | The access policy for the lobby |
| class [LobbyArrangedJoinConfiguration](./PlayFab.Multiplayer/LobbyArrangedJoinConfiguration.md) | The initial configuration data used when joining an arranged lobby. |
| class [LobbyCreateConfiguration](./PlayFab.Multiplayer/LobbyCreateConfiguration.md) | The initial configuration data used when creating a lobby. |
| class [LobbyDataUpdate](./PlayFab.Multiplayer/LobbyDataUpdate.md) | A request to make an update to the shared portion of the lobby on behalf of a member. |
| enum [LobbyDisconnectingReason](./PlayFab.Multiplayer/LobbyDisconnectingReason.md) | Reasons the client no longer has access to the Lobby. |
| class [LobbyError](./PlayFab.Multiplayer/LobbyError.md) |  |
| enum [LobbyInviteListenerStatus](./PlayFab.Multiplayer/LobbyInviteListenerStatus.md) | Values representing the current status of an invite listener. |
| class [LobbyJoinConfiguration](./PlayFab.Multiplayer/LobbyJoinConfiguration.md) | The initial configuration data for the member creating and joining the lobby. |
| enum [LobbyMemberRemovedReason](./PlayFab.Multiplayer/LobbyMemberRemovedReason.md) | Reasons why a member was removed from a lobby. |
| enum [LobbyMembershipLock](./PlayFab.Multiplayer/LobbyMembershipLock.md) |  |
| class [LobbyMemberUpdateSummary](./PlayFab.Multiplayer/LobbyMemberUpdateSummary.md) | A collection of hints about an update which has been successfully applied to the lobby on behalf of a member. |
| enum [LobbyOwnerMigrationPolicy](./PlayFab.Multiplayer/LobbyOwnerMigrationPolicy.md) | The available policies the lobby service can use to migrate lobby ownership between members. |
| class [LobbySearchConfiguration](./PlayFab.Multiplayer/LobbySearchConfiguration.md) | The configuration structure used to specify how a !:FindLobbies operation should be performed. |
| class [LobbySearchFriendsFilter](./PlayFab.Multiplayer/LobbySearchFriendsFilter.md) | The filter structure used to limit lobby search results to only those lobbies owned by the player's friends. |
| class [LobbySearchResult](./PlayFab.Multiplayer/LobbySearchResult.md) | An entry in the collection of lobby search results received upon successful completion of a [`FindLobbies`](./PlayFab.Multiplayer/PlayFabMultiplayer/FindLobbies.md) operation. |
| enum [LogLevelType](./PlayFab.Multiplayer/LogLevelType.md) | The amount of logging that is enabled. |
| class [MatchmakingMatchDetails](./PlayFab.Multiplayer/MatchmakingMatchDetails.md) |  |
| class [MatchmakingTicket](./PlayFab.Multiplayer/MatchmakingTicket.md) |  |
| class [MatchmakingTicketMatchMember](./PlayFab.Multiplayer/MatchmakingTicketMatchMember.md) |  |
| enum [MatchmakingTicketStatus](./PlayFab.Multiplayer/MatchmakingTicketStatus.md) | The possible states for a matchmaking ticket. |
| struct [MatchUser](./PlayFab.Multiplayer/MatchUser.md) |  |
| class [PFEntityKey](./PlayFab.Multiplayer/PFEntityKey.md) | PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity. |
| class [PlayFabMultiplayer](./PlayFab.Multiplayer/PlayFabMultiplayer.md) |  |
| class [PlayFabMultiplayerErrorArgs](./PlayFab.Multiplayer/PlayFabMultiplayerErrorArgs.md) | An event argument class representing a PFMultiplayer error. |
| class [PlayfabMultiplayerEventProcessor](./PlayFab.Multiplayer/PlayfabMultiplayerEventProcessor.md) |  |
