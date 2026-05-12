---
title: PlayFab for Unity (v2 Unified)
author: Jeffrey-Shi
description: Learn about PlayFab for Unity (v2 Unified), built on the PlayFab Unified SDK.
ms.author: jeffshi
ms.date: 05/08/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, unity, unified sdk, package, multiplayer, party, gdk
ms.localizationpriority: medium
---

# PlayFab for Unity (v2 Unified)

PlayFab for Unity (v2 Unified) is the next-generation Unity integration built on top of the [PlayFab Unified SDK](../unified-sdk/overview.md). It's distributed as a single Unity Package Manager (UPM) package.

This package replaces the three separate v1 Unity packages: the [PlayFab Unity SDK](../unity3d/index.md) (Services REST wrappers), the [v1 PlayFab Multiplayer for Unity plugin](../../multiplayer/lobby/lobby-matchmaking-sdks/multiplayer-unity-overview.md), and the [v1 PlayFab Party for Unity plugin](../../multiplayer/networking/party-unity-overview.md).

> [!IMPORTANT]
> Use PlayFab for Unity (v2 Unified) for all new projects. You can't use v1 and v2 together in the same project.

## Key benefits

PlayFab for Unity brings the modern architecture of the Unified SDK to Unity:

- **Single package**: One UPM install brings PlayFab Core, Services, Multiplayer (Lobby and Matchmaking), and Party together. You no longer need separate Services, Multiplayer, and Party packages.

- **Unified authentication**: When you sign in with `PFAuthentication`, it produces a single entity handle that Services and Multiplayer reuse. There's no per-component `SetEntityToken` call or per-call `PlayFabAuthenticationContext` to track.

- **Automatic token management**: The background process refreshes entity tokens. You no longer need to manually sign in again.

- **Consistent async model**: Services and Multiplayer calls use the Unified SDK async pattern, replacing the v1 `(request, onSuccess, onError)` callback pairs.

- **Native HTTP and serialization**: The same native `libHttpClient` that powers the Unified SDK across engines serves HTTP traffic. `PFHttpConfig` configures it. v1 pluggable transports (`ITransportPlugin`) and JSON serializers (`ISerializerPlugin`) are no longer needed.

- **GDK-aware editor tooling**: Your installed Microsoft Gaming Development Kit (GDK) automatically resolves native binaries. Switch between installed GDK editions from the **PlayFab → Change GDK** menu.

## Supported platforms

PlayFab for Unity officially supports:

- **Windows** (Xbox store and other PC storefronts)
- **Xbox** (One, Series S|X, Cloud)

Support for other platforms is coming soon.

## Getting started

Setup, installation, prerequisites, sample scenes, and troubleshooting information are available in the GitHub repository:

**[PlayFab Unity SDK on GitHub](https://github.com/PlayFab/PlayFabSDK_Unity)**

## Related resources

- [PlayFab Unified SDK overview](../unified-sdk/overview.md)
- [v1 PlayFab Unity3D SDK](../unity3d/index.md)
- [v1 PlayFab Multiplayer for Unity plugin](../../multiplayer/lobby/lobby-matchmaking-sdks/multiplayer-unity-overview.md)
- [v1 PlayFab Party for Unity plugin](../../multiplayer/networking/party-unity-overview.md)
