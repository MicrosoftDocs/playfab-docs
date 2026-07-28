---
title: Party Unity plugin overview
description: Overview of the PlayFab Party SDK plugin for Unity
author: vicodex
ms.author: victorku
ms.date: 01/27/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unity, middleware
---

# Party Unity plugin overview

The PlayFab Party Unity SDK plugin is a Unity C# wrapper on top of a native Party C++ library created for the convenience of Unity game developers.

It enables you to make use of Party and Party Cognitive Services in your Unity game, including:

- Multiplayer networking
- Chat messages and data exchange
- Cross-talk and cross-play
- Accessibility features like real-time text chat translation and voice transcription

It's designed for developing games on multiple platforms.

PlayFab Party Unity plugin works alongside the PlayFab "core" Unity SDK plugin, which provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab Unity SDK](https://github.com/PlayFab/UnitySDK) and [PlayFab Unity SDK documentation](../../sdks/unity3d/index.md).

Party Unity plugin is available for download as a Unity Asset package. It's currently supported for developing games on the following platforms:
- Microsoft Game Core (GDK)*, Windows, iOS, Android:
https://github.com/playfab/PlayFabPartyUnity (public access)

- Sony PlayStation&#174;:
  - PS4&#8482;: https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4 (restricted access by request to Microsoft Representative)
  - PS5&#8482;: https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabPartyUnityPS5 (restricted access by request to Microsoft Representative)

- Nintendo Switch&trade;: https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabPartyUnitySwitch (restricted access by request to Microsoft Representative)

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

*- The underlying Party libraries for GDK aren't included in the plugin. See the versioning section for details.

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## What API features are provided by Party Unity plugin?
- Game networking
- VoIP
- Support for the following platforms:
    - GDK:
        - Xbox Series X|S
        - Xbox One
        - PC
    - Windows
    - iOS
    - Android
    - PS4&#8482;
    - PS5&#8482;
    - Switch
- Support for cross-play & cross-talk across the above platforms
- Party Cognitive Services
    - Real-time text chat translation
    - Real-time voice chat transcription
    - Real-time voice chat translation
    - Text-to-speech synthesis

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## What is included in Party Unity plugin?
- Simplified top-level Party API written in Unity C# provided by `PlayFabMultiplayerManager` class and prefab for easier integration of user's Unity game with the core features of Party library
- C# interop layer providing managed-code interface to the underlying native (C++) Party library API. It's used by the top-level C# API.
- Underlying native (C++) Party binaries for each supported platform:
    - Party DLL libraries for Windows
    - Party iOS Framework libraries for iOS (device and simulator)
    - Party AAR library archive for Android
    - Party DLL libraries for Microsoft Game Core are NOT included. They're distributed with GDK and must be copied to the plugin before building your Unity project (see details in the README file included with the plugin)
    - Party dynamic libraries for PS4, PS5
    - Party static libraries for Switch
- PlayFab "core" Unity SDK plugin (can be updated independently if needed)
- Xbox Live authentication and policy provider API, currently supported on GDK platform only

## Party Unity plugin versions and compatibility between platforms
Party Unity plugin is published and available for download at several distribution points (Git repos), depending on the platform. Access to some distribution points is restricted and requires a request to your Microsoft Representative.

The Party Unity plugin uses a custom versioning scheme to clarify compatibility between versions downloaded from different distribution points and to reference a specific version of the underlying native library.

### Party Unity plugin versioning scheme
```
X.X.X.Y-(distribution-point-indicator).Z
```
For example, `1.5.0.3-main.0` (a version downloaded from the main public GitHub repo) or `1.5.0.3-ps5.0` (a version with Party binaries only for PS5, downloaded from a repo with restricted access).

Version components:
- `X.X.X` - the lowest version of the underlying Party library across all supported platforms. This value provides reference consistency with the underlying C++ library version. In the example above, the included Party library for each platform is version `1.5.0` or higher.
- `Y` - an incremental index of any modifications in the Party Unity C# layer, for any given X.X.X part of the version.
- `(distribution-point-indicator)` - a mnemonic code for tracking which distribution point a particular Party Unity plugin package was downloaded from. It differs by distribution point, for example, `main` (main public distribution GitHub repo), `ps5` (Microsoft Azure DevOps repo with restricted access for PS5 developers), and so on.
- `Z` - an incremental index of any modifications unique to the distribution point (for example, Party binaries updated or patched for a specific platform only).

A higher number in any version component means a newer version, by significance from left to right. 

### Compatibility between versions from different distribution points
Regardless of the distribution point, a Party Unity plugin is guaranteed to be fully compatible with a Party Unity plugin from any other distribution point if **the first four numbers (`X.X.X.Y`) of their version are the same**. You can import compatible versions into your Unity project in any order without overwriting or breaking one another, as their shared code is identical. Each version may have extra platform-specific files that don't overlap.

For example, you can import all the following versions of Party Unity plugin in your Unity project, in any sequential order, if you're targeting iOS, PS5 and Switch:
- `1.5.0.3-main.0` (imports Party binaries for iOS, among other files)
- `1.5.0.3-ps5.0` (imports Party binaries for PS5, among other files)
- `1.5.0.3-sw.0` (imports Party binaries for Switch, among other files)

The shared (cross-platform) Unity C# code included in each of these plugins is the same.

## Which versions of Unity are supported?
We support all recent versions of Unity starting with Unity 2017. However, your choice may be limited by the availability of a Unity development add-on for each platform. See the corresponding Unity documentation for details. That, in turn, may also limit your choice of platform SDK. In general, we test the Party Unity plugin with one of the most recent versions of Unity development add-ons available for each platform. We encourage our customers to report any build or runtime issues with any new version of Unity Editor, Unity add-on, or a platform SDK.

## Pricing

**Party networking and voice chat are included at no extra cost for eligible Xbox ecosystem developers through [Foundation Mode](../../get-started/mode-overview.md).**

Party Cognitive Services and other services may have a cost associated with them. For details, see [Billing for PlayFab Party](../../pricing/Meters/meters.md#party) or reach out to your Microsoft Representative.
