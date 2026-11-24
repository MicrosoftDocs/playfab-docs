---
title: PlayFab SDK Products
author: edigonzales
description: Compare the PlayFab Unified SDK (v2) with the Standalone SDKs (v1), including included components, key benefits, supported platforms, and migration.
ms.author: edigonzales
ms.date: 11/24/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playfab sdk, unified sdk, standalone sdk, sdk products
ms.localizationpriority: medium
---

# PlayFab SDK products

The **PlayFab Unified SDK (v2)** is the modern generation of PlayFab SDKs. It consolidates all PlayFab client libraries into a single, cohesive product. It provides a modern, streamlined development experience with unified authentication, automatic token management, and consistent APIs across all components. The Unified SDK is the primary focus of ongoing development. All new features, platform support, and improvements target v2 first.

**For new projects**, PlayFab recommends the **PlayFab Unified SDK (v2)** if the currently supported platforms meet your requirements. **Existing projects** using v1 Standalone SDKs can [migrate to v2](unified-sdk/migrating-from-v1.md) to take advantage of the unified architecture.

> [!NOTE]
> The v1 Standalone SDKs will be discontinued on April 30, 2027 for all platforms. Please [migrate your projects to v2](unified-sdk/migrating-from-v1.md) (Unified SDK) which has been available since GDK 2510.

> [!IMPORTANT]
> v1 and v2 SDKs cannot be used together in the same project. If you need a platform not supported in v2, use v1 for that platform.

## PlayFab Unified SDK (v2)

The [PlayFab Unified SDK](unified-sdk/overview.md) replaces the collection of separate v1 SDK packages with a single, cohesive product that covers all PlayFab functionality. Instead of downloading, installing, and updating multiple SDKs independently, you work with one SDK that includes everything you need.

### What's included

The Unified SDK bundles the following components into a single installation:

| Component | Description |
|-----------|-------------|
| **PlayFab Core** | Authentication, entity management, telemetry, and logging |
| **PlayFab Services** | LiveOps, economy, progression, and data analytics |
| **PlayFab GameSave** | Cloud save storage and synchronization |
| **PlayFab Multiplayer** | Lobby creation, matchmaking, and session management |
| **PlayFab Party** | Real-time networking, voice chat, and text communication with Azure AI Services integration |

### Key benefits

- **Single SDK**: One installation and update process for all PlayFab features, with no more managing separate packages for Services, Party, and Multiplayer
- **Unified authentication**: Authenticate once and receive a single `PFEntityHandle` that works across all components. No more retrieving and passing entity tokens manually between services
- **Automatic token management**: Background token refresh handles Entity Token renewal automatically, preventing session expiration during extended gameplay without any workaround code
- **Consistent programming model**: All components follow standardized patterns for initialization, API calls, error handling, and async operations: learn one pattern, use it everywhere
- **Custom memory management**: Plug in your own memory allocators through `PFMemoryHooks` for fine-grained control in resource-constrained or high-performance environments
- **Advanced thread control**: `XTaskQueue` integration provides flexible dispatch modes (Manual, ThreadPool, SerializedThreadPool, Immediate) so you can control exactly how and where async work executes
- **Built-in debug tracing**: Extensible tracing system for monitoring API requests, responses, and errors across all components from a single debug output
- **Future-proof**: All new PlayFab capabilities, platform expansions, and performance improvements target v2 exclusively

> [!TIP]
> Already using v1? See [Migrating from v1 to v2](unified-sdk/migrating-from-v1.md) for a step-by-step guide. Migration typically simplifies your codebase by removing manual token management and unifying initialization logic across components.

### Developer experience comparison

The following examples illustrate how v2 simplifies common tasks compared to v1:

| Task | v1 (Standalone SDKs) | v2 (Unified SDK) |
|------|----------------------|-------------------|
| **Setup** | Download and configure each SDK separately | Install one SDK with all components |
| **Authentication** | Manually retrieve entity tokens, pass them between services, and refresh before expiry | Call login once, receive a `PFEntityHandle`, pass it to any component |
| **Token refresh** | Write custom refresh logic to avoid session expiration | Handled automatically in the background |
| **Error handling** | Different error patterns per SDK | Consistent error reporting across all components |

## PlayFab Standalone SDKs (v1)

The [v1 Standalone SDKs](sdk-overview.md) consist of separate SDK packages for different PlayFab features.

### SDK components (v1)

- **[PlayFab Services SDK](playfab-sdk-intro.md)**: LiveOps, economy, matchmaking, and data analytics
- **[PlayFab Party SDK](../multiplayer/networking/party-sdks.md)**: Networking and voice/text chat communication
- **[PlayFab Lobby and Matchmaking SDK](../multiplayer/lobby/lobby-matchmaking-sdks/lobby-matchmaking-sdks.md)**: Lobby and matchmaking features

## Supported platforms

The following table compares platform support between the v2 Unified SDK and v1 Standalone SDKs:

| Platform | v2 (Unified SDK) | v1 (Standalone SDKs) |
|----------|:-----------------:|:--------------------:|
| Windows (PC and Handheld) | ✅ Supported | ✅ Supported |
| XBOX (One, Series S/X, Cloud) | ✅ Supported | ✅ Supported |
| Steam Deck | ✅ Supported | ❌ Not currently supported |
| PlayStation 4 ¹ | ✅ Supported | ✅ Supported |
| PlayStation 5 ¹ | ✅ Supported | ✅ Supported |
| Nintendo Switch ¹ | ✅ Supported | ✅ Supported |
| Nintendo Switch 2 ¹ | ✅ Supported | ✅ Supported |
| Linux | ❌ Not currently supported | ✅ Supported |
| iOS | ❌ Not currently supported | ✅ Supported |
| Android | ❌ Not currently supported | ✅ Supported |
| macOS | ❌ Not currently supported | ✅ Supported |

> [!NOTE]
> Access to PlayStation® and Nintendo platform SDKs requires an NDA from the respective platform holder. See [Request access for SDKs and samples](request-access-for-sdks-samples.md) for details.

## See also

- [PlayFab Unified SDK (v2)](unified-sdk/overview.md)
- [Standalone SDKs overview (v1)](sdk-overview.md)
- [Request access for SDKs and samples](request-access-for-sdks-samples.md)
