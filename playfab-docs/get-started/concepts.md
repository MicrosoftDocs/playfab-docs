---
title: PlayFab Concepts
author: m-kdearnley
description: Describes the fundamental concepts and building blocks of PlayFab.
ms.author: kdearnley
ms.date: 04/08/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, config
ms.localizationpriority: medium
---

# PlayFab Concepts

PlayFab offers a variety of fundamental components that serve as the building blocks for your game's backend. 

## Namespaces and Titles

PlayFab uses a hierarchical structure to manage resources and configurations across different scopes. 

A PlayFab namespace is the highest level entity that stores all of your global information. In the [PlayFab developer portal](../live-service-management/gamemanager/index.md) the namespace is referred to as the "Studio." 

A PlayFab title is an entity that represents the data and configurations scoped to a specific game including game settings, player account, player data, and other game-related data.

A namespace may contain many titles, but a title may only belong to one namespace and a title cannot me moved between namespaces. 

All titles under the same namespace can share certain resources and configurations. This is particularly useful for managing [player identities](../identity/identity-overview.md) and data across multiple titles within the same namespace. 

Titles can also be used to store data and configuration specific to a game environment, a specific version of your game, or game-specific scoped. For example, you may wish to have a title for your development environment, your testing environment, your certification environment, and your live environment to keep all your data and configurations cleanly separated. You may also want a separate title for special releases of your game such as playtests, open betas, or demos. 
The purpose of a title is to manage game-specific data and configurations. 

Namespaces and titles are two specific types of entities with hierarchical relationships, and there are more [built-in entity types](../live-service-management/game-configuration/entities/available-built-in-entity-types.md) to represent other useful scopes such as players, groups, and servers. 

## Developer Identity and Game Manager

To keep your game data secure, the developer identity is used to authenticate users and manage access to namespaces and titles. It's easy to [create a PlayFab account](../identity/dev-identity/pfab-account.md) and sign in with your Microsoft account. Assign [PlayFab user roles](../identity/dev-identity/permissions/playfab-user-roles.md) to grant access to other members of your development team. 

PlayFab's web portal is called [Game Manager](../live-service-management/gamemanager/index.md) and is the primary interface for managing your studio and title configuration. Most functonality in Game Manager also has a REST API equivalent, so you can script and automate configuration changes in the later stages of production. 

## Title Configuration 

Once you have a title, you can start storing data to [Title Data](../live-service-management/game-configuration/titledata/index.md). This data has the broadest access policy, allowing all of your game clients and servers to view TitleData.

General game configuration settings are often stored in TitleData, and it's typical for game clients to read this data during initialization. The [Title News](../live-service-management/game-configuration/title-communications/news/quickstart.md) features provide specic tools for title-wide communication with your players. 

Similarly, at the namespace level, [Publishing Data](../live-service-management/game-configuration/titledata/using-publisher-data.md) is accessible from any title tied to the namespace and can be useful for cross-game promotional events, or news that might be interesting to your entire player community.

Sometimes you want to set configuration data that targets a subset of your title's players. For targeted configuration, use [Segmentation](../live-service-management/game-configuration/segmentation/segmentation-overview.md) to define players in a target segment. [Experimentation](../live-service-management/game-configuration/experiments/index.md) is another option for testing different configurations on parts of your playerbase. 

## Player Identity 

The PlayFab [player identity]()../identity/player-identity/login/index.md) system is responsible for verifying client details and issuing authorization tokens. We support [most common 3rd party providers](../api-references/c/pfaccountmanagement/pfaccountmanagement_members.md), such as Xbox, Steam, iOS, Android, Nintendo, and PlayStation&#8482;Network.

PlayFab clients must authenticate before accessing most PlayFab APIs. 

Beyond authentication, accounts also serve as the central pillar around which your game systems are built. Using a recoverable account makes it easy to easy to save and retrieve player-specific data regardless of which platform or device the player is currently logged in with. Data such as permissions, [player progression](../player-progression/player-progression-overview.md), [player friend lists](../community/associations/friends/index.md), or [player bans](../player-progression/player-data/player-bans.md) are just some of the types of player-specific data that you may want to store for retrieval or sharing. 

## PlayStream and Actions

The [PlayStream](../data-analytics/ingest-data/playstream-overview.md) is a powerful toolset that lets you ingest events at scale and react in real-time to those events. 

A [PlayStream Event](../data-analytics/ingest-data/playstream-events.md) can be emitted from usage of other PlayFab services, or you can generate your own custom PlayStream Events to drive game-specific logic. 

Based on how you configure the [PlayStream Rules](../data-analytics/acting-data/action-rules-overview.md), different actions will be triggered when a PlayStream Event passes a corresponding rule set. These actions can include updating player data, banning a player, executing custom PlayFab-hosted code with [CloudScript](../live-service-management/service-gateway/automation/cloudscript/index.md), or calling an external web service with a [webhooks](../data-analytics/acting-data/webhooks-overview.md).

The endlessly configurable set of actions allows you to quickly build fully customized logic that reacts to player driven events in your game. You can use it to build a challenge system, or run service-authenticated actions on behalf of a player, or forward data from PlayFab into your own cloud services. The possibilities are endless. 

## Telemetry and Reports

If you don't need real-time processing and actions, but you still want a record of events taking place in your game, check out [PlayFab Telemetry](../data-analytics/ingest-data/telemetry-overview.md). This lightweight version of event ingestion gives you highly scalable data ingestion and lands events in a data laka allowing anyone on your team to [explore the data](../data-analytics/learn-data/data-explorer/index.md) or view any of PlayFab's [built-in reports](../data-analytics/learn-data/reports/overview.md). The PlayFab telemetry data lake can be [easily connected](../data-analytics/export-data/data-connection-overview.md) to a storage account of your choice.

## Economy, Monetization, and UGC

There's a lot to manage in a post-launch monetization strategy from virtual goods and currencies, to stores and personalization, to receipt validation and fraud prevention, and the relationships between all these things. With [PlayFab Economy](../economy-monetization/economy-what-is.md) you can easily manage and operate your game's monetization, no matter how deep or wide your designs are. 

PlayFab Economy also includes [UGC](../economy-monetization/economy-v2/ugc/overview.md) features to empower a safe, community-driven content ecosystem that works seamlessly with other PlayFab capabilities.  =

## Multiplayer

PlayFab also offers a complete suite of cross-platform [multiplayer services](../multiplayer/mpintro.md) to cover all your [matchmaking](../multiplayer/matchmaking/index.md), [lobby](../multiplayer/lobby/index.md), [networking](../multiplayer/networking/index.md), [player communications](../community/voice-communications/concepts-chat.md), and [server hosting](../multiplayer/servers/index.md) needs. 

All of our multiplayer services are designed to be used independently or together, so you can pick just the capabilities you need or use our entire multiplayer backend. 
