---
author: vicodex
title: PlayFab Multiplayer Unity SDK
description: PlayFab Multiplayer Unity SDK members
ms.author: victorku
ms.topic: reference
ms.prod: playfab
ms.date: 11/23/2021
---

# PlayFab Multiplayer Unity SDK

## Classes

| Name |  Description  |
| --- | --- |
| [Lobby](./PlayFab.Multiplayer/Lobby.md) |  |
| [LobbyArrangedJoinConfiguration](./PlayFab.Multiplayer/LobbyArrangedJoinConfiguration.md) | The initial configuration data used when joining an arranged lobby. |
| [LobbyCreateConfiguration](./PlayFab.Multiplayer/LobbyCreateConfiguration.md) | The initial configuration data used when creating a lobby. |
| [LobbyDataUpdate](./PlayFab.Multiplayer/LobbyDataUpdate.md) | A request to make an update to the shared portion of the lobby on behalf of a member. |
| [LobbyError](./PlayFab.Multiplayer/LobbyError.md) |  |
| [LobbyJoinConfiguration](./PlayFab.Multiplayer/LobbyJoinConfiguration.md) | The initial configuration data for the member creating and joining the lobby. |
| [LobbyMemberUpdateSummary](./PlayFab.Multiplayer/LobbyMemberUpdateSummary.md) | A collection of hints about an update which has been successfully applied to the lobby on behalf of a member. |
| [LobbySearchConfiguration](./PlayFab.Multiplayer/LobbySearchConfiguration.md) | The configuration structure used to specify how a !:FindLobbies operation should be performed. |
| [LobbySearchFriendsFilter](./PlayFab.Multiplayer/LobbySearchFriendsFilter.md) | The filter structure used to limit lobby search results to only those lobbies owned by the player's friends. |
| [LobbySearchResult](./PlayFab.Multiplayer/LobbySearchResult.md) | An entry in the collection of lobby search results received upon successful completion of a [`FindLobbies`](./PlayFab.Multiplayer/PlayFabMultiplayer/FindLobbies.md) operation. |
| [MatchmakingMatchDetails](./PlayFab.Multiplayer/MatchmakingMatchDetails.md) |  |
| [MatchmakingTicket](./PlayFab.Multiplayer/MatchmakingTicket.md) |  |
| [MatchmakingTicketMatchMember](./PlayFab.Multiplayer/MatchmakingTicketMatchMember.md) |  |
| [PFEntityKey](./PlayFab.Multiplayer/PFEntityKey.md) | PFEntityKey data model. Combined entity type and ID structure which uniquely identifies a single entity. |
| [PlayFabMultiplayer](./PlayFab.Multiplayer/PlayFabMultiplayer.md) |  |
| [PlayFabMultiplayerErrorArgs](./PlayFab.Multiplayer/PlayFabMultiplayerErrorArgs.md) | An event argument class representing a PFMultiplayer error. |
| [PlayfabMultiplayerEventProcessor](./PlayFab.Multiplayer/PlayfabMultiplayerEventProcessor.md) |  |

## Structs

| Name |  Description  |
| --- | --- |
| [MatchUser](./PlayFab.Multiplayer/MatchUser.md) |  |

## Enums

| Name |  Description  |
| --- | --- |
| [LobbyAccessPolicy](./PlayFab.Multiplayer/LobbyAccessPolicy.md) | The access policy for the lobby |
| [LobbyDisconnectingReason](./PlayFab.Multiplayer/LobbyDisconnectingReason.md) | Reasons the client no longer has access to the Lobby. |
| [LobbyInviteListenerStatus](./PlayFab.Multiplayer/LobbyInviteListenerStatus.md) | Values representing the current status of an invite listener. |
| [LobbyMemberRemovedReason](./PlayFab.Multiplayer/LobbyMemberRemovedReason.md) | Reasons why a member was removed from a lobby. |
| [LobbyMembershipLock](./PlayFab.Multiplayer/LobbyMembershipLock.md) |  |
| [LobbyOwnerMigrationPolicy](./PlayFab.Multiplayer/LobbyOwnerMigrationPolicy.md) | The available policies the lobby service can use to migrate lobby ownership between members. |
| [LogLevelType](./PlayFab.Multiplayer/LogLevelType.md) | The amount of logging that is enabled. |
| [MatchmakingTicketStatus](./PlayFab.Multiplayer/MatchmakingTicketStatus.md) | The possible states for a matchmaking ticket. |
