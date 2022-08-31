---
title: Owner requirements and privileges
author: joannaleecy
description: Learn about owner requirements and privileges.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, lobby, matchmaking, types
ms.localizationpriority: medium
---

# Owner requirements and privileges
 

This article explains about Lobby owner requirements and privileges. 

## Owner requirements

The owner of a lobby can be either a client or a server. Both must have access to the title. Client owners must also be a member of the lobby.

In other words, there are two main types of lobbies available&mdash;Server-owned and client-owned.

Server-owned lobbies can be lobbies owned by your title and waits for players to join. These lobbies have your title game server listed as the owner. Client-owned lobbies are those that are created on behalf on players. These lobbies have a client listed as the owner. It's important to note that PlayFab Lobby is a service so all lobbies are created on PlayFab servers.

To learn how to create lobbies, see [Create a lobby](create-a-lobby.md) and [Lobby and matchmaking walkthrough](lobby-and-matchmaking.md).

## Privileges

The owner of a lobby has special privileges.

1. The owner can set lobby level items.
    * Server owners are allowed to modify everything that can be modified,
      except member data.
    * Client owners are allowed to modify everything a server owner can and their own member data. They can't modify other members' data.
2. The owner can remove members from the lobby.
3. The owner may appoint another owner.  This occurs by sending an update with
   the owner field specified.
    * The server owner can only specify another server to be the new owner.
    * The client owner can only specify another client, who is a member of the
      lobby, to be the new owner.

### Privileges for server owners only

* Server owner can query for lobbies they own.
* Lobby is hidden during ownership migration. After a lobby owner change, the new server owner needs to re-establish notification subscription and get a new subscribe connection. This turns the lobby visibility back on for search.
* Server owner can control notifications to its members

## See also

* [Lobby properties](lobby-properties.md)
* [Create a lobby](create-a-lobby.md)
* [Lobby ownership changes](ownership-changes.md)
