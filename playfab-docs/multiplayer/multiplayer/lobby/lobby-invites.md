---
title: Lobby invites
author: joannaleecy
description: Learn about inviting players to lobbies
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, invites
ms.localizationpriority: medium
---

# Lobby invites
 

This article provides an overview of Lobby invites and how to use them in the Lobby and Matchmaking SDK.

> NOTE: Only players (i.e. title_player_account PlayFab entities) can send or receive invites. Game servers (i.e. game_server PlayFab entities) cannot. For more information on the how game servers interact with lobbies, see [Game Servers and Lobbies](lobby-server-overview.md).

## Invite types

There are two types of invites your game is likely to make use of.

1. [In-game invites](#joining-a-lobby-by-in-game-invites)
1. [Platform invites](#joining-a-lobby-by-platform-invites)

### Joining a lobby by in-game invites

* A member of a lobby may invite another player to that lobby directly via the lobby service.
* This invite shares the lobby's connection string with the invited player.
* The invited player receives the invitation via __PFLobbyInviteReceivedStateChange__ and can use the attached connection string to join the lobby.
* These invites work cross-platform but only work in-game.

### Joining a lobby by platform invites

* Members of the lobby can directly share the lobby's connection string with other players over platform-specific invite mechanisms.
* These invites don't work cross-platform but can be received without the recipient already running the game.
* Once the invited player receives the connection string via the platform mechanism, they can use the attached connection string to join the lobby.

## Example sending and receiving invites using the Lobby and Matchmaking SDK

Use __PFMultiplayerStartListeningForLobbyInvites__ on the invite recipient to enable receiving in-game invites.

The invitation listener will change its status as __Listening__ once it has been successfully set up.

```cpp
HRESULT AllowInvitations(
    const PFEntityKey* entity)
{
    return PFMultiplayerStartListeningForLobbyInvites(g_pfmHandle, entity);
}

void HandleInvitationListenerStatusChange(
    const PFLobbyInvitationListenerStatusChangedStateChange& invitationListenerStateChange)
{
    PFLobbyInvitationListenerStatus status;
    HRESULT hr = PFMultiplayerGetLobbyInvitationListenerStatus(
        g_pfmHandle,
        &invitationListenerStateChange.listeningEntity,
        &status);
    assert(SUCCEEDED(hr));

    switch (status)
    {
        case PFLobbyInvitationListenerStatus::Listening:
        {
            Log("%s is listening for invitations", invitationListenerStateChange.listeningEntity.id);
            break;
        }
        case PFLobbyInvitationListenerStatus::NotAuthorized:
        {
            Log("Invitation listener not authorized!"); // this is likely an issue with the listener's entity token.
            break;
        }
        default:
    }
}
```

Use __PFLobbySendInvite__ to send an invite to another PlayFab user via the lobby service.

The recipient will receive a __PFLobbyInviteReceivedStateChange__.

```cpp
HRESULT SendInvite(PFLobbyHandle lobby, const PFEntityKey* sender, const PFEntityKey* receiver)
{
    return PFLobbySendInvite(lobby, sender, receiver, nullptr);
}

void HandleInvitationNotification(const PFLobbyInviteReceivedStateChange& invite)
{
    Log("%s invited to lobby by %s", invite.listeningEntity.id, invite.invitingEntity.id);
    // pass invite.connectionString to PFMultiplayerJoinLobby
}
```

## See also

* [Lobby and matchmaking](lobby-and-matchmaking.md)
* [Find lobbies](find-lobbies.md)
* [Join lobbies](join-lobbies.md)
* [Lobby properties](lobby-properties.md)
