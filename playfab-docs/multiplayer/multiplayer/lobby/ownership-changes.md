---
title: Lobby ownership changes
author: joannaleecy
description: Learn about lobby owner migration and proactive owner promotion.
ms.author: joanlee
ms.date: 02/28/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, owner migration
ms.localizationpriority: medium
---

# Lobby ownership changes
 

Most game scenarios benefit from having a single "owner" of the lobby, but there are situations where ownership should transfer to a new PlayFab entity. 

This article explains how ownership migrates between entities.

## Ownership migration policies

PlayFab Lobby provides a set of pre-defined policies to allow a title to control how lobby ownership migrates if the current owner leaves or is disconnected.

This policy is configured when the lobby is created and can't be changed.

This table describes each __ownerMigrationPolicy__.

| Owner     | ownerMigrationPolicy | Description                         |
|-----------|----------------------|-------------------------------------|
| Client    | Automatic            | The Lobby service automatically assigns another connected member as owner when the current owner leaves or disconnects. If no other members are connected, no new owner is assigned. If a member reconnects while no owner is assigned, they're assigned as the owner. |
| Client    | Manual               | The Lobby service clears the owner field when the current owner leaves. While the owner is connected, non-owner members can't reassign the owner. If the owner has disconnected, any member may set themselves as the current owner. |
| Client    | None                 | The Lobby service clears the owner field when the current owner leaves. The owner field is unaffected if the current owner disconnects. Any member, including non-members can reassign the owner at any time. |
| Server    | Server               | The owner field is unaffected if the current server-owner disconnects. While the owner is disconnected, the lobby is hidden from search. The lobby is restored in search if the disconnected owner reconnects or if a new owner connects and claims ownership. |

## Proactive ownership changes

Some game scenarios may require ownership to proactively transfer from the current owner to a new owner.

This table describes how proactive ownership changes are affected by the __ownerMigrationPolicy__.

| Owner     | ownerMigrationPolicy | Description                         |
|-----------|----------------------|-------------------------------------|
| Client    | Automatic            | The current owner may assign another member as owner in their place. Non-owner members can't reassign the owner. |
| Client    | Manual               | The current owner may assign another member as owner in their place. If there's no owner or the owner has disconnected, any member can assign themselves to be the new owner. |
| Client    | None                 | The current owner can assign any other member as owner. Any member can assign themselves to be the new owner even if the current owner is still present and connected. |
| Server    | Server               | The current owner can assign any other server to owner in their place. Any server can take ownership of any server-owned lobby even if the current owner is still present and connected. |

## Extra guidance for server owners

* Any server authorized for the title may take over the ownership of any server-owned lobby authorized for that title. The Lobby service doesn't protect ownership between game servers for the same title.
* Server-owned lobbies are hidden when the server-owner is disconnected.

## Frequently asked questions

#### When is the owner field cleared?

The owner field is cleared when the current owner **leaves** the lobby and the owner migration policy is unable to select a new owner. __Automatic__ migration policy is the only policy that tries to automatically select a new owner.

**NOTE**: The owner field is **not** cleared when the owner disconnects and a new owner can't be automatically selected. This is intentional to be robust to service outages.

#### What happens when the last member leaves the lobby?

* For client-owned lobby, the lobby is always deleted when the last member leaves.
* For server-owned lobby, no action is taken.

#### What's the difference between __Manual__ and __None__ owner migration policy?

__Manual__ ownership migration policy allows your title to manually manage ownership but still provide ownership protection. The __None__ policy provides your title full ownership control without any assistance or protection from the service.

## See also

* [Lobby properties](lobby-properties.md)
* [Owner requirements and privileges](owner-requirements-and-privileges.md)
* [Create searchable lobbies](define-search-keywords.md)
* [Create a lobby](create-a-lobby.md)
