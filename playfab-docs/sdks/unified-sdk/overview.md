---
title: PlayFab Unified SDK
author: Jeffrey-Shi
description: Overview of the PlayFab Unified SDK
ms.author: jeffshi
ms.date: 03/20/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab sdk, unified sdk
ms.localizationpriority: medium
---

# PlayFab Unified SDK

The PlayFab Unified SDK is the next-generation development platform that consolidates all PlayFab client libraries into a single, cohesive product. It provides a consistent, streamlined integration experience across all PlayFab components, improving interoperability and simplifying client development.

## Overview

The standalone [PlayFab Services C/C++ SDK](../c/index.md) (released in 2023) introduced modern development practices such as automatic token refresh, improved memory management, and enhanced thread control. However, other standalone SDKs—like PlayFab Party and PlayFab Multiplayer—didn't adopt these improvements. The Unified SDK brings these components together into a cohesive, modernized SDK.

> [!NOTE]
> Existing PlayFab standalone SDKs (v1) remain supported, but we recommend the PlayFab Unified SDK (v2) for new projects.

## Key benefits

The Unified SDK provides significant improvements over standalone SDKs:

- **Simplified integration**: Single SDK installation and update process eliminates the need to manage multiple SDK downloads and versions. On Xbox/Windows, the SDK is bundled with the GDK (starting with October 2025 GDK, version 2510).

- **Unified authentication**: Authentication is performed once through `PFAuthentication` APIs, with the resulting `PFEntityHandle` used across all components. Components automatically query the Core service for tokens internally, eliminating manual token passing and reducing integration errors.

- **Automatic token management**: Centralized token refresh logic automatically handles Entity Token renewal in the background, preventing session expiration during extended gameplay sessions.

- **Consistent programming model**: All components follow standardized patterns for initialization, API calls, error handling, asynchronous operations, and unified logging, significantly reducing the learning curve.

- **Advanced thread control and memory management**: All components support custom memory allocators and advanced thread control through `XTaskQueue` integration, enabling fine-grained control over resource allocation and threading behavior.

## Supported platforms and game engines

The following table shows platform and game engine support for the PlayFab Unified SDK:

| Platform                              | C/C++ SDK | C/C++ NuGet | Unreal Engine | Unity |
|---------------------------------------|-----------|-------------|---------------|-------|
| **Windows (PC and Handheld)**         | GDK 2510+ | — | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |
| **Xbox (One, Series S/X, Cloud)**     | GDK 2510+ | — | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |
| **Steam Deck**                        | GDK 2510+ | — | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unreal) | [GitHub](https://github.com/PlayFab/PlayFabSDK_Unity) |
| **PlayStation®5** ¹                   | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/PS5) | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/PS5/_artifacts/feed/PS5GeneralV2) | ¹ | ¹ |
| **PlayStation®4** ¹                   | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/PS4) | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/PS4/_artifacts/feed/PS4GeneralV2) | ¹ | ¹ |
| **Nintendo Switch 2** ¹               | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/Switch2) | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/Switch2/_artifacts/feed/Switch2GeneralV2) | ¹ | ¹ |
| **Nintendo Switch** ¹                 | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/Switch) | [Azure DevOps](https://dev.azure.com/PlayFabPrivate/Switch/_artifacts/feed/SwitchGeneralV2) | ¹ | ¹ |

> [!NOTE]
> Access to PlayStation® and Nintendo platform SDKs requires an NDA from the respective platform holder. See [Request access for SDKs and samples](../request-access-for-sdks-samples.md) for details.

*"PlayStation" is a trademark of Sony Interactive Entertainment Inc.*

## Feature availability

The Unified SDK components ship together, but certain features might have limited or provisional availability on specific platforms in the current release. The following table summarizes feature readiness for this preview.

| Platform                        | Core      | Services  | GameSave  | Multiplayer (Lobby / Matchmaking) | Party Data | Party Voice |
|---------------------------------|-----------|-----------|-----------|-----------------------------------|------------|-------------|
| **Windows (PC and Handheld)**   | Supported | Supported | Supported | Supported | Supported | Supported |
| **Xbox (One, Series S/X, Cloud)** | Supported | Supported | Supported | Supported | Supported | Supported |
| **Steam Deck**                  | Supported | Supported | Supported | Supported | Supported | Supported |
| **PlayStation®5**               | Supported | Supported | Supported (Preview) | Supported | Supported | Supported |
| **PlayStation®4**               | Supported | Supported | —         | Supported | Supported | Supported |
| **Nintendo Switch 2**           | Supported | Supported | —         | Supported | Supported | Supported |
| **Nintendo Switch**             | Supported | Supported | —         | Supported | Supported | Supported |

A dash (—) indicates the feature isn't currently supported on that platform.

If you encounter a discrepancy between this table and observed behavior, file an issue through your PlayFab support channel so the product team can update documentation and address the gap.

## SDK components

The PlayFab Unified SDK features a modular architecture, allowing you to integrate only the components your project requires. On Xbox/Windows, the SDK is included with the Microsoft GDK installation. The SDK provides headers and binaries for the following components:

- **[libHttpClient](https://github.com/microsoft/libHttpClient)**: Cross-platform HTTP/WebSocket abstraction used by Xbox and PlayFab SDKs. Provides asynchronous APIs, memory management, and retry logic. Required by all SDK components. Optional integration with [XTaskQueue](https://learn.microsoft.com/gaming/gdk/_content/gc/reference/system/xtaskqueue/xtaskqueue_members) for thread management.
- **[PlayFab Core](../playfab-sdk-intro.md)**: Foundational functionality for all PlayFab components. Handles authentication, entity management, configuration, telemetry, logging, and error handling.
- **[PlayFab Services](../playfab-sdk-intro.md)**: Shared services for LiveOps, economy, and progression.
- **[PlayFab Multiplayer](../../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)**: Lobby creation and matchmaking services.
- **[PlayFab Party](../../multiplayer/networking/party-sdks.md)**: Low-latency, cross-platform voice, text chat, and data communication with optional Azure Cognitive Services integration for speech-to-text, text-to-speech, translation, and more.
- **[PlayFab GameSave](../../player-progression/game-saves/overview.md)**: Cloud-based game save storage and synchronization for preserving player progress across devices and sessions.

## Development practices

The Unified SDK extends the modern development practices introduced in the 2023 [PlayFab Services C/C++ SDK](../c/index.md) across all components:

- [Asynchronous operations](async-model.md)
- [Memory management](memory-management.md)
- [Tracing and diagnostics](debug-trace.md)

## Versioning

The PlayFab Unified SDK follows [semantic versioning](https://semver.org/) principles, starting from version 2.0.0, ensuring predictable and consistent release management.