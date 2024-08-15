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

It enables you to make use of Party and Party Cognitive Services in your Unity game. This includes multiplayer networking, chat messages and data exchange, cross-talk, cross-play, accessibility features like real-time text chat translation and voice transcription services. It is designed for developing games on multiple platforms.

PlayFab Party Unity plugin works alongside the PlayFab "core" Unity SDK plugin which provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab Unity SDK](https://github.com/PlayFab/UnitySDK) and [PlayFab Unity SDK documentation](../../../sdks/unity3d/index.md).

Party Unity plugin is available for download as a Unity Asset package. It is currently supported for developing games on the following platforms:
- Microsoft Game Core (GDK)*, Windows, iOS, Android:
https://github.com/playfab/PlayFabPartyUnity (public access)

- Sony PlayStation&#174;:
  - PS4&#8482;: https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4 (restricted access by request to Microsoft Representative)
  - PS5&#8482;: https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabPartyUnityPS5 (restricted access by request to Microsoft Representative)

- Nintendo Switch&trade;: https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabPartyUnitySwitch (restricted access by request to Microsoft Representative)

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

*- The underlying Party libraries for GDK are not included in plugin (see below).

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
- C# interop layer providing managed-code interface to the underlying native (C++) Party library API. It is used by the top-level C# API.
- Underlying native (C++) Party binaries for each supported platform:
    - Party DLL libraries for Windows
    - Party iOS Framework libraries for iOS (device and simulator)
    - Party AAR library archive for Android
    - Party DLL libraries for Microsoft Game Core are NOT included. They are distributed with GDK and must be copied to plugin before building user's Unity project (see details in README file included with plugin)
    - Party dynamic libraries for PS4, PS5
    - Party static libraries for Switch
- PlayFab "core" Unity SDK plugin (can be updated independently if needed)
- Xbox Live authenication and policy provider API, currently supported on GDK platform only

## Party Unity plugin versions and compatibility between platforms
Party Unity plugin is published and available for download at several distribution points (Git repos), depending on the platform. Access to some distribution points is restricted and requires a request to your Microsoft Representative.

In order to provide a better guidance on compatibility between versions downloaded from different distribution points, and reflect a reference to a specific version of the underlying native library,  Party Unity plugin follows a custom versioning scheme.

### Party Unity plugin versioning scheme
```
X.X.X.Y-(distribution-point-indicator).Z
```
For example, `1.5.0.3-main.0` (a version downloaded from the main public GitHub repo) or `1.5.0.3-ps5.0` (a version with Party binaries only for PS5, downloaded from a repo with restricted access).

Version components:
- `X.X.X` - the lowest version of the underlying Party library across all supported platforms. This is used for general reference consistency with a version of the underlying C++ library. In the example above, the version of an included Party libary for each platform is `1.5.0` or higher.
- `Y` - an incremental index of any modifications in the Party Unity C# layer, for any given X.X.X part of the version.
- `(distribution-point-indicator)` - a mnemonic code for tracking which distribution point a particular Party Unity plugin package was downloaded from. It differs by distribution point, e.g. `main` (main public distribution GitHub repo), `ps5` (Microsoft Azure DevOps repo with restricted access for PS5 developers), etc.
- `Z` - an incremental index of any modifications unique to the distribution point (e.g. Party binaries updated/patched for a specific platform only).

A higher number in any version component means a newer version, by significance from left to right. 

### Compatibility between versions from different distribution points
Regardless of a distribution point a Party Unity plugin is downloaded from, it is guaranteed to be fully compatible with a Party Unity plugin downloaded from any other distribution point, if **the first four numbers (`X.X.X.Y`) of their version are the same**. Compatible versions from different distribution points can be imported into user's Unity project in any order without a risk of overwriting/breaking one another, as their shared code should be identical. Though each of them may have some additional (not shared) files, specific to a particular platform, which shouldn't overlap.

For example, you can import all the following versions of Party Unity plugin in your Unity project, in any sequential order, if you are targeting iOS, PS5 and Switch:
- `1.5.0.3-main.0` (imports Party binaries for iOS, among other files)
- `1.5.0.3-ps5.0` (imports Party binaries for PS5, among other files)
- `1.5.0.3-sw.0` (imports Party binaries for Switch, among other files)

The shared (cross-platform) Unity C# code included in each of these plugins will be the same.

## Which versions of Unity are supported?
We strive to support all recent versions of Unity starting with Unity 2017, however your choice may be limited by availability of a Unity development add-on for each particular platform, please see corresponding Unity documentation. That, in turn, may also limit your choice of the platform SDK. In general, we test Party Unity plugin with one of the most recent versions of Unity development add-ons available for each platform. We encourage our customers to report any build or runtime issues with any new version of Unity Editor, Unity add-on or a platform SDK.

## Pricing

**VoIP and Game Networking functionality is free for users signed in with an Xbox Live account (currently supported on GDK platform only).**

Party Cognitive Services and other services may have a cost associated with them. For details, see [Billing for PlayFab Party](../../pricing/meters/meters.md#party) or reach out to your Microsoft Representative.
