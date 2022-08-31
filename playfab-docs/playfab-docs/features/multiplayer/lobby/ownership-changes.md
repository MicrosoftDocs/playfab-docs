---
title: Lobby ownership changes
author: joannaleecy
description: Learn about lobby owner migration and proactive owner promotion.
ms.author: joanlee
ms.date: 10/25/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, lobby, matchmaking, owner migration
ms.localizationpriority: medium
---

# Ownership changes
 

Most game scenarios benefit from having a specially selected "owner" of the lobby. So it's important to define policies to determine how ownership of the lobby migrates when the owner of the lobby leaves or is disconnected.

## Ownership migration policies

The PlayFab Lobby service provides a set of pre-defined ownership migration policies to define who should become the new owner of the lobby if the current owner leaves or is disconnected.

The table below describes how each __ownerMigrationPolicy__ functions.

| Owner     | ownerMigrationPolicy | Description                         |
|-----------|----------------------|-------------------------------------|
| Client    | Automatic            | The Lobby service will automatically assign another connected owner when the current owner leaves or disconnects. Non-owner members cannot re-assign the owner. |
| Client    | Manual               | The Lobby service will clear the owner field when the current owner leaves. While the owner is connected, non-owner members cannot re-assign the owner. If the owner has disconnected, any member may set themselves as the current owner. |
| Client    | None                 | The Lobby service will clear the owner field when the current owner leaves. The owner field will be unaffected if the current owner disconnects. Any member, including non-members can re-assign the owner at anytime. |
| Server    | Server               | Any server can set themselves as owner. Your title must decide which server should become the new owner. If the server-owner disconnects, the lobby is temporarily hidden from search. Lobby does not enforce protection or additional abilities from one server to another. |

## Proactive ownership changes

Some game scenarios may require ownership to proactively transfer from the current owner to a new owner.

The table below describes how proactive ownership changes are affected by the current __ownerMigrationPolicy__.

| Owner     | ownerMigrationPolicy | Description                         |
|-----------|----------------------|-------------------------------------|
| Client    | Automatic            | The current owner may promote another member as owner in their place. |
| Client    | Manual               | The current owner may promote another member as owner in their place. If there is no owner or the owner has disconnected, any member can promote themselves to be the new owner. |
| Client    | None                 | The current owner can promote any other member as owner. Any member can promote themselves to be the new owner even if the current owner is still present and connected. |
| Server    | Server               | Any server can promote themselves to owner. Proactive server ownership migration may be useful to handle game server migration. |

## Extra guidance for server owners

* Any server authorized for the title may take over the ownership of any lobby authorized for that title. The Lobby service does not protect ownership between game servers for the same title.
* Server-owned lobbies are hidden when the server-owner is disconnected.
* Game servers can query for lobbies they own.

## Frequently asked questions

#### When will the owner field be cleared?

The owner field will be cleared when the current owner **leaves** the lobby and the owner migration policy is unable to select a new owner. __Automatic__ migration policy is the only policy that will try to automatically select a new owner.

**NOTE**: The owner will **not** be cleared when the owner disconnects and a new owner can't be automatically selected. This is intentional to be robust to service outages.

### What happens when the last member leaves the lobby?

* For client-owned lobby, the lobby is always deleted when the last member leaves.
* For server-owned lobby, no action is taken.

#### What's the difference between __Manual__ and __None__ owner migration policy?

__Manual__ ownership migration policy allows your title to manually manage ownership but still provide ownership protection. The __None__ policy provides your title full ownership control without any assistance or protection from the service.

## See also

* [Lobby properties](lobby-properties.md)
* [Owner requirements and privileges](owner-requirements-and-privileges.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Create a lobby](create-a-lobby.md)
