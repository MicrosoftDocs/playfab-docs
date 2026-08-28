---
title: PlayFab concepts
author: m-kdearnley
description: Describes the fundamental concepts and building blocks of PlayFab.
ms.author: kdearnley
ms.date: 08/28/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config
ms.localizationpriority: medium
---

# PlayFab concepts

PlayFab offers various fundamental components that serve as the building blocks for your game's backend. 

## Studios, namespaces, and titles

PlayFab organizes resources into studios, namespaces, and titles. Each scope has a different purpose.

### Studio

A studio is the administrative grouping you use in Game Manager. A studio contains your PlayFab titles and controls team membership, roles, permissions, billing, and support access.

Studio membership and permissions don't represent player identity or gameplay data.

### Namespace

A PlayFab namespace defines the cross-title player identity and shared-data scope for a studio. It allows PlayFab to recognize the same player across multiple titles and supports data that is shared by those titles.

By default, a studio has one namespace and all titles in the studio belong to it. A title can belong to only one namespace and can't be moved between namespaces.

Some PlayFab APIs and Game Manager pages use the older term **publisher**. The **Publisher ID** identifies the namespace. In this context, publisher and namespace refer to the same cross-title scope; neither term means the studio itself.

### Title

A title is the PlayFab resource boundary for a game or game environment. Each title has its own Title ID, configuration, title-specific player accounts, data, secrets, and service settings.

A studio can contain multiple titles. You might create separate titles for different games operated by the same business, or for different service environments that require isolated configuration and player data (dev/test/prod).

Data stored at the title level isn't automatically shared with other titles. Use namespace-scoped features when player identity or data must span titles.

Namespaces and titles are also [built-in entity types](../live-service-management/game-configuration/entities/available-built-in-entity-types.md). Other built-in entity types represent scopes such as players, groups, and servers.

## Developer identity and Game Manager

To keep your game data secure, developer identity is used to authenticate users and manage administrative access to studios and titles. It's easy to [create a PlayFab account](../identity/dev-identity/pfab-account.md) and sign in with your Microsoft account. Assign [PlayFab user roles](../identity/dev-identity/permissions/playfab-user-roles.md) to grant access to other members of your development team.

PlayFab's web portal is called [Game Manager](../live-service-management/gamemanager/index.md) and is the primary interface for managing your studio and title configuration. Most functionality in Game Manager also has a REST API equivalent, so you can script and automate configuration changes in the later stages of production.

## Title configuration 

Once you have a title, you can start storing data to [Title Data](../live-service-management/game-configuration/titledata/index.md). This data has the broadest access policy, allowing all of your game clients and servers to view TitleData.

General game configuration settings are often stored in TitleData, and it's typical for game clients to read this data during initialization. The [Title News](../live-service-management/game-configuration/title-communications/news/quickstart.md) features provide specific tools for title-wide communication with your players. 

Similarly, at the namespace level, [Publisher data](../live-service-management/game-configuration/titledata/using-publisher-data.md) is accessible from any title tied to the namespace and can be useful for cross-game promotional events or news that might interest your entire player community. Publisher data uses the older API term for namespace-scoped data.

Sometimes you want to set configuration data that targets a subset of your title's players. For targeted configuration, use [Segmentation](../live-service-management/game-configuration/segmentation/segmentation-overview.md) to define players in a target segment. [Experimentation](../live-service-management/game-configuration/experiments/index.md) is another option for testing different configurations on parts of your player base. 

## Player identity 

The PlayFab [player identity](../identity/player-identity/login/index.md) system is responsible for verifying client details and issuing authorization tokens. We support [most common third-party providers](../api-references/c/pfaccountmanagement/pfaccountmanagement_members.md), such as Xbox, Steam, iOS, Android, Nintendo, and PlayStation™ Network.

PlayFab clients must authenticate before accessing most PlayFab APIs. 

Beyond authentication, accounts also serve as the central pillar around which your game systems are built. Using a recoverable account makes it easy to save and retrieve player-specific data regardless of which platform or device the player is currently logged in with. Data such as permissions, [player progression](../player-progression/player-progression-overview.md), [player friend lists](../community/associations/friends/index.md), or [player bans](../player-progression/player-data/player-bans.md) are just some of the types of player-specific data that you might want to store for retrieval or sharing. 

A player has a `master_player_account` in the namespace. When the player signs in to a title, PlayFab creates or uses a `title_player_account` for that title. The master player account provides cross-title identity, while each title player account contains title-specific identity and data.

## PlayStream and actions

The [PlayStream](../data-analytics/ingest-data/playstream-overview.md) is a powerful toolset that lets you ingest events at scale and react in real-time to those events. 

A [PlayStream Event](../data-analytics/ingest-data/playstream-events.md) can be emitted from usage of other PlayFab services, or you can generate your own custom PlayStream Events to drive game-specific logic. 

Based on how you configure the [PlayStream Rules](../data-analytics/acting-data/action-rules-overview.md), different actions are triggered when a PlayStream Event passes a corresponding rule set. These actions can include updating player data, banning a player, executing custom PlayFab-hosted code with [CloudScript](../live-service-management/service-gateway/automation/cloudscript/index.md), or calling an external web service with a [webhooks](../data-analytics/acting-data/webhooks-overview.md).

The endlessly configurable set of actions allows you to quickly build fully customized logic that reacts to player driven events in your game. You can use it to build a challenge system, or run service-authenticated actions on behalf of a player, or forward data from PlayFab into your own cloud services. The possibilities are endless. 

## Telemetry and reports

If you don't need real-time processing and actions, but you still want a record of events taking place in your game, check out [PlayFab Telemetry](../data-analytics/ingest-data/telemetry-overview.md). This lightweight version of event ingestion gives you highly scalable data ingestion and lands events in a data lake allowing anyone on your team to [explore the data](../data-analytics/learn-data/data-explorer/index.md) or view any of PlayFab's [built-in reports](../data-analytics/learn-data/reports/overview.md). The PlayFab telemetry data lake can be [easily connected](../data-analytics/export-data/data-connection-overview.md) to a storage account of your choice.

## Economy, monetization, and user-generated content

There's a lot to manage in a post-launch monetization strategy from virtual goods and currencies, to stores and personalization, to receipt validation and fraud prevention, and the relationships between all these things. With [PlayFab Economy](../economy-monetization/economy-what-is.md), you can easily manage and operate your game's monetization, no matter how deep or wide your designs are. 

PlayFab Economy also includes [user-generated content (UGC)](../economy-monetization/economy-v2/ugc/overview.md) features to empower a safe, community-driven content ecosystem that works seamlessly with other PlayFab capabilities.

## Multiplayer

PlayFab also offers a complete suite of cross-platform [multiplayer services](../multiplayer/mpintro.md) to cover all your [matchmaking](../multiplayer/matchmaking/index.md), [lobby](../multiplayer/lobby/index.md), [networking](../multiplayer/networking/index.md), [player communications](../community/voice-communications/concepts-chat.md), and [server hosting](../multiplayer/servers/index.md) needs. 

All of our multiplayer services can be used independently or together, so you can pick just the capabilities you need or use our entire multiplayer backend. 
