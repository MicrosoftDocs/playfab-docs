---
title: Lobby invites
author: joannaleecy
description: Learn about inviting players to lobbies
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.service: playfab
keywords: playfab, multiplayer, lobby, matchmaking, invites
ms.localizationpriority: medium
---

# Lobby invites
 

This article provides an overview about Lobby invites and explains how to manage state changes for lobbies that allow invites.

## Invite types

There are two types of invites your game is likely to make use of.

1. [In-game invites](#joining-a-lobby-by-in-game-invites)
1. [Platform invites](#joining-a-lobby-by-platform-invites)

### Joining a lobby by in-game invites

* A member of a lobby may invite another player to that lobby directly via the lobby service.
* This will share the lobby's connection string with the invited player.
* The invited player will receive the invitation via __PFLobbyInviteReceivedStateChange__ and can use the attached connection string to join the lobby.
* These invites work cross-platform but only work in-game.

### Joining a lobby by platform invites

* Members of the lobby can directly share the lobby's connection string with other players over platform-specific invite mechanisms.
* These invites will not work cross-platform but can be received without the recipient already running the game. 
* Once the invited player receives the connection string via the platform mechanism, they can use the attached connection string to join the lobby.

## Client SDK example

Use __PFMultiplayerStartListeningForLobbyInvites__ on the invite recipient to enable receiving in-game invites.

The invitation listener will report its status as __Listening__ once it has been successfully setup.

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
