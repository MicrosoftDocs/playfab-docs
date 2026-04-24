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
> During the preview, Foundation Mode is available for **new PlayFab titles only**. You can create new titles in Foundation Mode, but existing titles can't be migrated at this time. A migration path for existing titles is planned for mid-2026.

## What's included

Foundation Mode includes the following PlayFab features:

**Identity**

| **Feature** | **Description** |
|---|---|
| [Player Identity]( ../identity/player-identity/login/index.md) | Authenticate players and link accounts to enable cross-play and cross-progression features |
| [Server identity](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id)  | Authenticate game servers for secure backend communication |
| [Developer identity]( ../identity/dev-identity/pfab-account.md) | Manage developer accounts and studio access |

**Live service management**

| **Feature** | **Description** |
|---|---|
| [API access policy]( ../api-references/api-access-policy.md) | Control access to PlayFab APIs for your title |
| [Title communications]( ../live-service-management/game-configuration/title-communications/overview.md) | Send targeted messages and notifications to players |
| [Title data]( ../live-service-management/game-configuration/titledata/index.md) | Store and retrieve title-level configuration data |
| [Add-ons]( ../live-service-management/service-gateway/add-ons/add-ons.md) | Discover and manage add-on integrations for your title |
| [Functions]( ../live-service-management/service-gateway/automation/cloudscript-af/index.md) | Invoke custom server-side logic using Azure Functions. Function invocations are included; however, Azure compute costs (GB-s) are billed separately through your Azure subscription |

**Game data stream**

| **Feature** | **Description** |
|---|---|
| [Telemetry]( ../data-analytics/ingest-data/telemetry-overview.md) | Service-generated telemetry data (custom events excluded) |
| [PlayStream]( ../data-analytics/ingest-data/playstream-events.md) | System-generated PlayStream events for monitoring player activity |
| [Reports]( ../data-analytics/learn-data/reports/overview.md) | Built-in reports for player activity and title performance |

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

## What's not included

The following features aren't available in Foundation Mode. Calling APIs for these features returns a permissions error.

- **Economy**: User-Generated Content (UGC), including `CreateDraftItem`, `PublishDraftItem`, UGC-scoped `SearchItems`, and UGC file upload flows.
- **Multiplayer**: Multiplayer Servers for dedicated hosting, including server allocation and management APIs.
- **Live service management**: CloudScript (classic) (use [Azure Functions](../live-service-management/service-gateway/automation/cloudscript-af/index.md) instead), Segmentation, Experimentation (Targeted Configuration), Churn Prediction, and CDN.
- **Game data stream**: custom telemetry events and Telemetry Keys (custom event ingestion is blocked; service-generated PlayStream events are included), Event Archive, Rules/Actions/Webhooks, Player Search, and cross-region or S3 Data Connections (only same-region connections are available).
- Legacy APIs including Economy v1, and Statistics v1/Leaderboards v1 (use the modern replacements which are included in Foundation Mode).

## Service limits

Foundation Mode includes API rate limits to ensure fair resource allocation, but it doesn't include monthly caps on usage for Foundation Mode titles. Most rate limits apply on a per-API, per-player basis. This limit restricts the number of calls a single player can make to a specific API endpoint in a short time period (for example, 30 calls per 2 minutes). This limit means that any experience that works at a developer's desk should accurately reflect how the game operates at scale, regardless of how many players your live game has.

You can view all limits for your title in Game Manager under **Settings** > **Limits**. 

## Billing and pricing

Foundation Mode simplifies access to core PlayFab services under the Xbox publishing framework. Titles onboarded through Foundation Mode don't need a payment instrument on file, and all included services listed earlier are provided at no extra cost. There are no per-operation charges for reads, writes, storage, or executions within the included feature set.

Foundation Mode applies at the title level. As long as your title only uses the core services included under Foundation Mode, no extra charges apply.

> [!IMPORTANT]
> Foundation Mode blocks APIs for features that aren't included. If your title calls an excluded API, PlayFab returns a permissions error and the call doesn't complete. No usage is recorded and no charges apply. For the full list of excluded features, see [What's not included](#whats-not-included).

> [!NOTE]
> **Azure Functions compute costs:** While Foundation Mode includes PlayFab function *invocations*, you pay separately through your Azure subscription for the underlying Azure compute resources (measured in GB-s). For more information, see [Azure Functions pricing](https://azure.microsoft.com/pricing/details/functions/).

> [!NOTE]
> Foundation Mode doesn't replace existing PlayFab pricing plans. If your studio has other titles that use Pay-as-you-go, Standard, or Premium plans, those titles continue to be billed under their respective pricing models and require a payment instrument on file. Studios can have a mix of Foundation Mode titles and titles on existing plans within the same account.

## See also

- [Foundation Mode Onboarding](foundation-onboarding.md)