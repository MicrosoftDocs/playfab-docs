---
title: PlayFab Unified SDK Overview
author: Jeffrey-Shi
description: Overview of the PlayFab Unified SDK
ms.author: jeffshi
ms.date: 03/17/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab sdk, unified sdk
ms.localizationpriority: medium
---

# PlayFab Unified SDK

The PlayFab Unified SDK is the next-generation development platform that consolidates all PlayFab client libraries into a single, cohesive product. It provides a consistent, streamlined integration experience across all PlayFab components, improving interoperability and simplifying client development.

## Overview

The standalone [PlayFab Services C/C++ SDK](../c/index.md) (released in 2023) introduced modern development practices such as automatic token refresh, improved memory management, and enhanced thread control. However, other standalone SDKs—like PlayFab Party and PlayFab Multiplayer—did not adopt these improvements. The Unified SDK brings these components together into a cohesive, modernized SDK.

> [!NOTE]
> Existing PlayFab standalone SDKs (v1) remain supported, but we recommend the PlayFab Unified SDK (v2) for new projects.

## Key Benefits

The Unified SDK provides significant improvements over standalone SDKs:

- **Simplified Integration**: Single SDK installation and update process eliminates the need to manage multiple SDK downloads and versions. On Xbox/Windows, the SDK is bundled with the GDK (starting with October 2025 GDK, version 2510).

- **Unified Authentication**: Authentication is performed once through PFAuthentication APIs, with the resulting PFEntityHandle used across all components. Components automatically query the Core service for tokens internally, eliminating manual token passing and reducing integration errors.

- **Automatic Token Management**: Centralized token refresh logic automatically handles Entity Token renewal in the background, preventing session expiration during extended gameplay sessions.

- **Consistent Programming Model**: All components follow standardized patterns for initialization, API calls, error handling, asynchronous operations, and unified logging, significantly reducing the learning curve.

- **Advanced Thread Control and Memory Management**: All components support custom memory allocators and advanced thread control through XTaskQueue integration, enabling fine-grained control over resource allocation and threading behavior.

## Supported Platforms and Game Engines

The following table shows platform and game engine support for the PlayFab Unified SDK:

| Platform                              | C/C++ SDK | Unreal Engine | Unity |
|---------------------------------------|-----------|---------------|-------|
| **Windows (PC and Handheld)**         | GDK 2510+ | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |
| **Steam Deck**                        | GDK 2510+ | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |
| **Xbox (One, Series S/X, Cloud)**     | GDK 2510+ | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |

### Coming Soon Platforms

- PlayStation®5 *(NDA required)*
- Nintendo Switch 2 *(NDA required)*

*"PlayStation" is a trademark of Sony Interactive Entertainment Inc.*

## Feature Availability

The Unified SDK components ship together, but certain features may have limited or provisional availability on specific platforms in the current release. The table below summarizes feature readiness for this preview.

| Platform                        | Core         | Services | GameSave | Multiplayer (Lobby / Matchmaking) | Party Data | Party Voice |
|---------------------------------|--------------|----------|----------|-----------------------------------|------------|-------------|
| Windows  (PC and Handheld)      | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported |
| Xbox (One, Series S/X, Cloud)   | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported |
| Steam Deck                      | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported | ✅ Supported |

Legend: ✅ Available / supported, ⚠️ Planned but not yet available in this release.

If you encounter a discrepancy between this table and observed behavior, file an issue through your PlayFab support channel so we can update documentation and address the gap.

## SDK Components

The PlayFab Unified SDK features a modular architecture, allowing you to integrate only the components your project requires. On Xbox/Windows, the SDK is included with the Microsoft GDK installation. The SDK provides headers and binaries for the following components:

- **[libHttpClient](https://github.com/microsoft/libHttpClient)**: Cross-platform HTTP/WebSocket abstraction used by Xbox and PlayFab SDKs. Provides asynchronous APIs, memory management, and retry logic. Required by all SDK components. Optional integration with [XTaskQueue](https://learn.microsoft.com/gaming/gdk/_content/gc/reference/system/xtaskqueue/xtaskqueue_members) for thread management.
- **[PlayFab Core](../playfab-sdk-intro.md)**: Foundational functionality for all PlayFab components. Handles authentication, entity management, configuration, telemetry, logging, and error handling.
- **[PlayFab Services](../playfab-sdk-intro.md)**: Shared services for LiveOps, economy, and progression.
- **[PlayFab Multiplayer](../../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)**: Lobby creation and matchmaking services.
- **[PlayFab Party](../../multiplayer/networking/party-sdks.md)**: Low-latency, cross-platform voice, text chat, and data communication with optional integration with Azure Cognitive Services for speech-to-text, text-to-speech, translation, etc.
- **[PlayFab GameSave](../../player-progression/game-saves/overview.md)**: Cloud-based game save storage and synchronization for preserving player progress across devices and sessions.

## Development Practices

The Unified SDK extends the modern development practices introduced in the 2023 [PlayFab Services C/C++ SDK](../c/index.md) across all components:

- [Asynchronous operations](async-model.md)
- [Memory management](memory-management.md)
- [Tracing and diagnostics](debug-trace.md)

## Versioning

The PlayFab Unified SDK follows [semantic versioning](https://semver.org/) principles, starting from version 2.0.0, ensuring predictable and consistent release management.