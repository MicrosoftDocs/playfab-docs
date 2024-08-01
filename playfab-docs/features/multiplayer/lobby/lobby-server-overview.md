---
title: Game Servers and Lobbies
author: scottmunroms
description: Learn how to manage PlayFab Lobbies with GameServer entities.
ms.author: scmunro
ms.date: 02/23/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, server, gameserver
ms.localizationpriority: medium
---

# Game servers and lobbies

This article explains how to use PlayFab Lobbies from a game server.

## Enabling game server APIs in the PlayFab Multiplayer SDK

To enable the game server APIs in PlayFab Multiplayer, you must define PFMULTIPLAYER_INCLUDE_SERVER_APIS before including PFLobby.h.

```cpp
#define PFMULTIPLAYER_INCLUDE_SERVER_APIS
#include <PFMultiplayer.h>
#include <PFLobby.h>
```

## Creating server-owned lobbies

To create server-owned lobbies, follow these steps:

1. Log in as a game_server PlayFab entity with [AuthenticateGameServerWithCustomId](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id) and retrieve the entity key and token pair.
1. Provide the game_server's entity key and token to the PlayFab Multiplayer SDK with [PFMultiplayerSetEntityToken](playfabmultiplayerreference-cpp/pfmultiplayer/functions/pfmultiplayersetentitytoken.md).
1. Call [PFMultiplayerCreateAndClaimServerLobby](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayercreateandclaimserverlobby.md) with the game_server's entity key.

For more information and example code, see [Create a lobby](create-a-lobby.md).

## Servers aren't members

In client-owned lobbies, the owner of the lobby is also a member of the lobby.

Server-owned lobbies are different in this regard. The game_server entity that owns the lobby isn't a member of the lobby.

Server-owners are able to modify global lobby properties but don't have their own member properties section.

For more information on this distinction, see [Lobby owners vs. members](owner-requirements-and-privileges.md).

## Ownership and ownership migration policy

Unlike client-owned lobbies, there's only one valid ownership migration policy for server-owned lobbies: the "Server" ownership migration policy.

This has important impacts on ownership migration and lobby recovery.

Primarily, when the owner of a server-owned lobby disconnects&mdash;for example, because the server crashed&mdash;ownership of the lobby will not automatically transfer to any of the members in the lobby. Instead, the lobby becomes hidden in lobby search results (to avoid new members unintentionally joining this lobby) and it's up to the title to coordinate some recovery logic.

At the next available opportunity, the game_server entity which crashed should search for lobbies it needs to recover using the [lobby/amOwner search key](playfabmultiplayerreference-cpp/pflobby/constants/pflobbysearchkeys.md) via [PFMultiplayerFindLobbies](playfabmultiplayerreference-cpp/pflobby/functions/pfmultiplayerfindlobbies.md).

After finding the lobbies that need recovery, the game server can either attempt to resume the gameplay session or delete the lobby.

For more information on ownership changes, see [Ownership changes](ownership-changes.md).

## See also

* [Create a lobby](create-a-lobby.md)
* [Lobby owners vs. members](owner-requirements-and-privileges.md#lobby-owners-vs-members)
* [AuthenticateGameServerWithCustomId](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id)
