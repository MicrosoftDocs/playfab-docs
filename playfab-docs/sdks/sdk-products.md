---
title: PlayFab SDK Products
author: Jeffrey-Shi
description: Overview of PlayFab SDK product lines - v1 Standalone SDKs and v2 Unified SDK
ms.author: jeffshi
ms.date: 02/10/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab sdk, unified sdk, standalone sdk, sdk products
ms.localizationpriority: medium
---

# PlayFab SDK Products

The **PlayFab Unified SDK (v2)** is the next generation of PlayFab SDKs, consolidating all PlayFab client libraries into a single, cohesive product. It provides a modern, streamlined development experience with unified authentication, automatic token management, and consistent APIs across all components. This is the primary focus of ongoing SDK development and will receive new features and platform support going forward.

**For new projects**, we recommend the **PlayFab Unified SDK (v2)** if the currently supported platforms meet your requirements. **Existing projects** using v1 Standalone SDKs can [migrate to v2](unified-sdk/migrating-from-v1.md) to take advantage of the unified architecture.

The **v1 Standalone SDKs** remain supported for now and provide broader platform coverage for projects that require platforms not yet supported in v2.

> [!IMPORTANT]
> v1 and v2 SDKs cannot be used together in the same project. If you need a platform not yet supported in v2, use v1 for all components.

## PlayFab Unified SDK (v2)

The [PlayFab Unified SDK](unified-sdk/overview.md) provides a consistent, streamlined integration experience across all PlayFab components.

### Key Benefits

- **Single SDK**: One installation and update process for all PlayFab features
- **Unified Authentication**: Authenticate once and use the resulting entity handle across all components
- **Automatic Token Management**: Background token refresh prevents session expiration
- **Consistent Programming Model**: Standardized patterns for initialization, API calls, and error handling
- **Modern Development Practices**: Advanced memory management and thread control through XTaskQueue integration

### Supported Platforms (v2)

| Platform | Availability |
|----------|--------------|
| Windows (PC and Handheld) | Supported |
| Xbox (One, Series S/X, Cloud) | Supported |
| Steam Deck | Supported |
| PlayStation 5 | Coming soon |
| Nintendo Switch 2 | Coming soon |

## PlayFab Standalone SDKs (v1)

The [v1 Standalone SDKs](sdk-overview.md) consist of separate SDK packages for different PlayFab features. While still fully supported, they require managing multiple SDK installations and manual coordination between components.

### SDK Components (v1)

- **[PlayFab Services SDK](playfab-sdk-intro.md)**: LiveOps, economy, matchmaking, and data analytics
- **[PlayFab Party SDK](../multiplayer/networking/party-sdks.md)**: Networking and voice/text chat communication
- **[PlayFab Lobby and Matchmaking SDK](../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)**: Lobby and matchmaking features

### Supported Platforms (v1)

The v1 Standalone SDKs support a broader range of platforms:

| Platform | Availability |
|----------|--------------|
| Windows (PC and Handheld) | Supported |
| Xbox (One, Series S/X, Cloud) | Supported |
| iOS | Supported |
| macOS | Supported |
| Android | Supported |
| Linux | Supported |
| PlayStation 4 | Supported (NDA required) |
| PlayStation 5 | Supported (NDA required) |
| Nintendo Switch | Supported (NDA required) |

## See also

- [PlayFab Unified SDK (v2)](unified-sdk/overview.md)
- [Standalone SDKs overview (v1)](sdk-overview.md)
- [Request access for SDKs and samples](request-access-for-sdks-samples.md)
