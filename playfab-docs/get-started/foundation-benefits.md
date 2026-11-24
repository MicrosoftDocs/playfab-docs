---
title: "Foundation Mode"
description: "Understand Foundation Mode eligibility, included PlayFab services, limits, and how to get access by linking a qualifying Partner Center product."
author: antnguyen89
ms.author: antnguyen
ms.topic: article
ms.service: azure-playfab
ms.localizationpriority: medium
keywords: playfab, pricing, free tier
ms.date: '11/24/2026'
---

# Foundation Mode

Foundation Mode provides eligible XBOX games with a foundational set of PlayFab services at no additional cost. It includes services for player identity, live service management, multiplayer, community, player progression, and economy.

Newly created PlayFab titles can access these benefits by linking a qualifying Partner Center product. Onboarding for existing titles is coming soon.

## Who's eligible

Any PlayFab title that ships on XBOX is eligible for Foundation Mode benefits.

## What's included

The following services are included in Foundation Mode:

### Identity

| Feature | Description |
| --- | --- |
| [Player identity](../identity/player-identity/login/index.md) | Authenticate players and link accounts for cross-play and cross-progression. |
| [Server identity](/rest/api/playfab/authentication/authentication/authenticate-game-server-with-custom-id) | Authenticate game servers for backend communication. |
| [Developer identity](../identity/dev-identity/pfab-account.md) | Manage developer accounts and studio access. |

### Live service management

| Feature | Description |
| --- | --- |
| [API access policy](../api-references/api-access-policy.md) | Control access to PlayFab APIs for your title. |
| [Title communications](../live-service-management/game-configuration/title-communications/overview.md) | Send targeted messages and notifications to players. |
| [Title data](../live-service-management/game-configuration/titledata/index.md) | Store and retrieve title-level configuration data. |
| [Add-ons](../live-service-management/service-gateway/add-ons/add-ons.md) | Manage add-on integrations for your title. |
| [Functions](../live-service-management/service-gateway/automation/cloudscript-af/index.md) | Invoke custom server-side logic using Azure Functions. PlayFab function invocations are included; Azure compute is billed separately through your Azure subscription. |

### Game data stream

| Feature | Description |
| --- | --- |
| [Telemetry](../data-analytics/ingest-data/telemetry-overview.md) | Collect service-generated telemetry data. Custom events aren't included. |
| [PlayStream](../data-analytics/ingest-data/playstream-events.md) | Receive system-generated PlayStream events for monitoring player activity. |
| [Reports](../data-analytics/learn-data/reports/overview.md) | Review built-in reports for player activity and title performance. |

### Multiplayer

| Feature | Description |
| --- | --- |
| [Lobby](../multiplayer/lobby/index.md) | Create and manage game lobbies. |
| [Matchmaking](../multiplayer/matchmaking/index.md) | Match players based on skill, latency, and custom rules. |
| [Party networking](../multiplayer/networking/index.md) | Use cross-platform networking for multiplayer games. |
| [Real-time messages](../multiplayer/lobby/lobby-and-matchmaking-real-time-messages.md) | Receive real-time messages from Lobby and Matchmaking services. |

### Community

| Feature | Description |
| --- | --- |
| [Friends](../community/associations/friends/index.md) | Manage player friend lists and relationships. |
| [Groups](../community/associations/groups/index.md) | Manage player groups and guilds. |
| [Player bans](../player-progression/player-data/player-bans.md) | Enforce community standards with player bans. |
| [Leaderboards](../community/leaderboards/index.md) | Display player rankings and competition results. |

### Player progression

| Feature | Description |
| --- | --- |
| [Player profile](../player-progression/player-data/index.md) | Store and retrieve player profile data. |
| [Statistics](../player-progression/statistics/index.md) | Track player statistics and achievements. |
| [Game saves](../player-progression/game-saves/overview.md) | Store player progress in the cloud. |

### Economy

| Feature | Description |
| --- | --- |
| [Catalog](../economy-monetization/economy-v2/catalog/catalog-overview.md) | Define your game's virtual items. |
| [Inventory](../economy-monetization/economy-v2/inventory/index.md) | Track player-owned items and currencies. |

## What's not included

The following features aren't part of Foundation Mode benefits. Paid features outside the included set require usage-based billing. Linking a Partner Center product alone doesn't enable them.

- **Economy:** User-generated content (UGC), including `CreateDraftItem`, `PublishDraftItem`, UGC-scoped `SearchItems`, and UGC file upload flows.
- **Multiplayer:** [Multiplayer Servers](../multiplayer/servers/index.md) for dedicated hosting, including server allocation and management APIs.
- **Live service management:** CloudScript (classic), Segmentation, Experimentation (Targeted Configuration), Churn Prediction, and content delivery network (CDN) features. Use the included PlayFab function invocations through Azure Functions instead of CloudScript (classic).
- **Game data stream:** Custom telemetry events and Telemetry Keys, Event Archive, Rules, Actions, Webhooks, Player Search, and cross-region or Amazon Simple Storage Service (Amazon S3) Data Connections. Only same-region Data Connections are included.
- **Legacy APIs:** Economy v1, Statistics v1, and Leaderboards v1. Use the modern replacements included in Foundation Mode.

> [!NOTE]
> PlayFab function invocations are included, but the underlying Azure Functions compute is billed separately through your Azure subscription. See [Azure Functions pricing](https://azure.microsoft.com/pricing/details/functions/).

## Service limits

The foundational service set doesn't have monthly usage caps. API rate limits and service-specific operational limits still apply. Many API rate limits apply per API and per player, restricting how often a player can call an endpoint.

To review your title's current limits, open the title in Game Manager and select **Settings** > **Limits**. For details about how API limits are applied, see [API rate limits](../live-service-management/service-gateway/throttling/what-is-throttling.md).

## Benefits and usage-based billing

A payment instrument isn't required when your title uses only the included PlayFab services. Paid features and capacity outside XBOX Partner benefits require usage-based billing. Your title keeps its included benefits when you enable usage-based billing. PlayFab charges usage outside those benefits according to the applicable meters and rates.

If usage-based billing isn't enabled, requests to APIs unavailable under your title's benefits return a permissions error and don't complete. Those rejected requests don't record usage or incur charges.

For an explanation of how benefits and usage-based billing work together, see [Title states and transitions](../pricing/title-launches.md).

## Get access

Link your new PlayFab title to a qualifying Partner Center product to receive Foundation Mode benefits.

### Before you begin

You need:

- A [PlayFab developer account](../identity/dev-identity/pfab-account.md) signed in with a [Microsoft Entra ID account](../identity/dev-identity/authentication/aad-authentication.md).
- A new PlayFab title for a game that you're shipping or planning to ship on XBOX.
- A [Partner Center account](https://developer.microsoft.com/en-GB/games/publish) with access to the qualifying product you want to link.

### Create a Partner Center account

If you don't already have a Partner Center account, create one before linking your product.

1. Go to the [XBOX developer onboarding hub](https://developer.microsoft.com/en-GB/games/publish).
2. Follow the steps to create your developer account.
3. Complete the account verification process.

### Link your Partner Center product

1. Sign in to [Game Manager](https://developer.playfab.com/) with your Microsoft Entra ID account.
2. Select your PlayFab title.
3. Follow [Link a Partner Center product to a PlayFab title](../identity/player-identity/platform-specific-authentication/xbox-live-add-on.md) to associate the qualifying product with your title.

After you link a qualifying product, your title receives the included Foundation Mode benefits. Confirm that the linked **Seller ID** and **Product ID** match the intended Partner Center product.

## Support

If you encounter any issues, [file a support ticket](../pricing/support.md#support-ticket-submission).

## Next steps

After linking your product, start building your game:

- [Set up player authentication](../identity/player-identity/authentication/index.md)
- [Configure multiplayer services](../multiplayer/index.yml)
- [Set up leaderboards](../community/leaderboards/index.md)

## See also

- [Title states and transitions](../pricing/title-launches.md)
