---
title: PlayFab Modes
author: m-kdearnley
description: Describes Foundation Mode, Development Mode.
ms.author: kdearnley
ms.date: 02/13/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, free tier
ms.localizationpriority: medium
---

# Foundation Mode overview

Foundation Mode is a PlayFab service tier that enables eligible Xbox ecosystem developers to use PlayFab game services at no extra cost. It includes core features for player identity, multiplayer, progression, economy, and community - everything you need to build and ship games everywhere.

If you're a developer shipping games on Xbox, or if you're planning to ship on Xbox, Foundation Mode gives you access to essential backend services without the stress of budgeting or billing.

For more information about PlayFab's full capabilities, see [What is PlayFab?]( ../get-started/what-is-playfab.md).

## Eligibility

Developers are eligible for Foundation Mode if they meet the following requirements:

- Register a studio in PlayFab Game Manager.

- Ship or plan to ship their game on Xbox.

- Link their PlayFab account to their Partner Center studio and product.

> [!IMPORTANT]
> During the preview, Foundation Mode is available for **new PlayFab titles only**. You can create new titles in Foundation Mode, but existing titles cannot be migrated at this time. A migration path for existing titles is planned for mid-2026.

## What's included

Foundation Mode includes the following PlayFab features:

**Identity**

| **Feature** | **Description** |
|---|---|
| [Player Identity]( ../identity/player-identity/login/index.md) | Authenticate players and link accounts to enable cross-play and cross-progression features |
| [Server identity](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id)  | Authenticate game servers for secure backend communication |

**Live service management**

| **Feature** | **Description** |
|---|---|
| [API access policy]( ../api-references/api-access-policy.md) | Control access to PlayFab APIs for your title |
| [Title communications]( ../live-service-management/game-configuration/title-communications/overview.md) | Send targeted messages and notifications to players |
| [Title data]( ../live-service-management/game-configuration/titledata/index.md) | Store and retrieve title-level configuration data |

**Game data stream**

| **Feature** | **Description** |
|---|---|
| [Telemetry]( ../data-analytics/ingest-data/telemetry-overview.md) | Service-generated telemetry data (custom events excluded) |

**Multiplayer**


| **Feature** | **Description** |
|---|---|
| [Lobby]( ../multiplayer/lobby/index.md) | Create and manage game lobbies for players |
| [Matchmaking]( ../multiplayer/matchmaking/index.md) | Match players based on skill, latency, and custom rules |
| [Party Networking]( ../multiplayer/networking/index.md) | Secure, low-latency networking for multiplayer games |
| [Real-time messages]( ../multiplayer/lobby/lobby-and-matchmaking-real-time-notifications.md) | Real-time messages from Lobby and Matchmaking services |

**Community**

| **Feature** | **Description** |
|---|---|
| [Friends]( ../community/associations/friends/index.md) | Manage player friend lists and relationships |
| [Groups]( ../community/associations/groups/index.md) | Create and manage player groups and guilds |
| [Player bans]( ../player-progression/player-data/player-bans.md) | Enforce community standards with player bans |
| [Leaderboards]( ../community/leaderboards/index.md) | Display player rankings and competition results |

**Progression**

| **Feature** | **Description** |
|---|---|
| [Player profile]( ../player-progression/player-data/index.md) | Store and retrieve player profile data |
| [Statistics]( ../player-progression/statistics/index.md) | Track player statistics and achievements |
| [Game saves]( ../player-progression/game-saves/overview.md) | Cloud save support for player progress |

**Economy**

| **Feature** | **Description** |
|---|---|
| [Catalog]( ../economy-monetization/economy-v2/catalog/catalog-overview.md) | Define and manage your game's virtual items |
| [Inventory](../economy-monetization/economy-v2/inventory/index.md) | Track player-owned items and currencies |

## Service limits

Foundation Mode includes API rate limits to ensure fair resource allocation, but there are no monthly caps on usage for Foundation Mode titles. Most rate limits are applied per-API-per-player; this restricts the number of calls a single player can make to a specific API endpoint in a short time period (For example, 30 calls per 2 minutes). This means that any experience that works at a developer's desk should accurately reflect how the game operates at scale, regardless of how many players your live game has.

View all limits for your title in Game Manager under Settings > Limits. 

## See also

- [Foundation Mode Onboarding](foundation-onboarding.md)