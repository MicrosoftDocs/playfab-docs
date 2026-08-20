---
title: PlayFab for Unreal Engine Overview
author: Jeffrey-Shi
description: Overview of PlayFab for Unreal Engine, the next-generation integration built on the PlayFab Unified SDK
ms.author: jeffshi
ms.date: 08/14/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, unreal engine, unified sdk, plugin, oss, onlinesubsystem, multiplayer, party
ms.localizationpriority: medium
---

# PlayFab for Unreal Engine (v2 Unified)

PlayFab for Unreal Engine (v2 Unified) is the next-generation integration built on top of the [PlayFab Unified SDK](../unified-sdk/overview.md). It provides comprehensive integration with PlayFab's backend services for Unreal Engine game developers, bringing the modern development practices and unified architecture of the Unified SDK to the Unreal Engine ecosystem.

## Overview

PlayFab for Unreal Engine provides a unified integration experience, consolidating all PlayFab components into a single distribution. This distribution includes two main components:

- **PlayFabUnreal**: Core plugin providing authentication, services, and game saves. Deliver PlayFab functionalities such as economy, leaderboards, player data, statistics, and more.
- **OnlineSubsystemPlayFab**: Online Subsystem (OSS) integration enabling Lobby, Matchmaking, Party networking, and Voice over Internet Protocol (VOIP). Includes cross-play, cross-platform communication, and accessibility features powered by Azure Cognitive Services such as real-time text chat translation and voice transcription.

## Supported Platforms

PlayFab for Unreal Engine is ready to power your games on these platforms today:

- **Windows** (PC and Handheld)
- **Xbox** (One, Series S|X, Cloud)
- **Steam Deck**
- **PlayStation** (PS4, PS5)
- **Nintendo Switch** (Switch 1, Switch 2)

Support for additional platforms is in development. Check the [GitHub repository](https://github.com/PlayFab/PlayFabSDK_Unreal) for the latest platform availability updates.

> [!IMPORTANT]
> We recommend PlayFab for Unreal Engine (v2 Unified) for all new projects. It offers a modern, unified architecture with an improved developer experience.<br>
 If your project requires a platform not yet supported in v2, use the [v1 PlayFab Unreal Plugin](../unreal/index.md) and [v1 OnlineSubsystem PlayFab](../../multiplayer/networking/party-unreal-engine-oss-overview.md) instead, as v1 and v2 cannot be used together in the same project.

## Components

### OnlineSubsystemPlayFab (OSS)

The OnlineSubsystem PlayFab (OSS) provides full integration with Unreal Engine's Online Subsystem framework, enabling PlayFab's multiplayer and networking services through standard Unreal interfaces. This component includes:

- **Lobby**: Create and manage game lobbies for multiplayer sessions using Unreal's session interfaces
- **Matchmaking**: Connect players based on skill, preferences, and other criteria
- **Party Data Communication**: Low-latency, cross-platform messaging for real-time multiplayer gameplay
- **Party Voice Chat**: Integrated voice communication with Azure Cognitive Services features like speech-to-text and translation

The OSS integrates seamlessly with Unreal Engine's existing networking patterns, letting you use familiar Unreal APIs while leveraging PlayFab's scalable backend infrastructure.

The OSS also supports:

- **Multiple simultaneous sessions**: Create, join, and manage multiple named sessions at the same time, such as a social lobby alongside an active match. Each named session can use its own PlayFab Party network. A game instance still has a single active gameplay connection, and voice is owned by one session at a time.
- **Dedicated server hosting**: Host sessions using the PlayFab server entity, so a dedicated server can create and own PlayFab lobbies and manage Party networking without a signed-in native-platform user.
- **Configurable searchable session settings**: Choose which Unreal session settings are searchable through PlayFab Lobby to enable server-side filtered discovery on title-specific properties such as game mode, playlist, skill tier, or map.
- **Play-in-Editor (PIE)**: Run the OSS in a single Play-in-Editor instance on Unreal Engine 5.8 or later with GDK as the native OSS, so you can test supported flows without a packaged or standalone build.

### PlayFabUnreal Plugin

The PlayFabUnreal plugin provides core PlayFab functionality:

- **PlayFab Core**: Authentication and event pipeline (telemetry) services that form the foundation for all PlayFab operations
- **PlayFab Services**: Game features including leaderboards, economy, player data, statistics, and catalog management
- **PlayFab Game Saves**: Cross-platform cloud saves for preserving player progress across devices and sessions

## Getting Started

For setup instructions and detailed documentation, visit the GitHub repository:

**[PlayFab Unreal Engine Plugin on GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal)**

The repository includes:

- Installation and configuration guides
- API reference documentation
- Sample projects and code examples
- Platform-specific setup instructions

## Related Resources

- [PlayFab Unified SDK Overview](../unified-sdk/overview.md)
- [v1 PlayFab Unreal Plugin](../unreal/index.md)
- [v1 OnlineSubsystem PlayFab](../../multiplayer/networking/party-unreal-engine-oss-overview.md)
- [PlayFab Game Saves](../../player-progression/game-saves/overview.md)
- [PlayFab Party](../../multiplayer/networking/party-sdks.md)
- [PlayFab Multiplayer](../../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)
