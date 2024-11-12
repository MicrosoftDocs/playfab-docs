---
title: PlayFab Multiplayer Unity plugin overview
description: Overview of the PlayFab Multiplayer SDK plugin for Unity
author: vicodex
ms.author: victorku
ms.date: 11/23/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, lobby, matchmaking, unity, middleware
---

# PlayFab Multiplayer Unity plugin overview
 

The PlayFab Multiplayer Unity SDK plugin is a Unity C# wrapper on top of a native PlayFabMultiplayer C++ library created for the convenience of Unity game developers.

It enables you to make use of PlayFab Multiplayer services in your Unity game. Currently, this includes Lobby and Matchmaking. It is designed for developing games on multiple platforms.

PlayFab Multiplayer Unity plugin works alongside the PlayFab "core" Unity SDK. The PlayFab "core" Unity SDK provides other PlayFab functionalities such as economy, leaderboards, and more. For more information, see [PlayFab Unity SDK](https://github.com/PlayFab/UnitySDK) and [PlayFab Unity SDK documentation](../../../../sdks/unity3d/index.md).

PlayFab Multiplayer Unity plugin is available for download as a Unity Asset package.

## What API features are provided by PlayFab Multiplayer Unity plugin?

- Lobby
- Matchmaking
- Support for the following platforms:
  - GDK:
    - Xbox Series X|S
    - Xbox One
    - PC
  - Windows
- Support for cross-play across the above platforms

## What is included in PlayFab Multiplayer Unity plugin?

- The top-level Multiplayer API written in Unity C# provided by `PlayFabMultiplayer` class and a prefab for integration of user's Unity game with PlayFabMultiplayer library
- C# interop layer providing managed-code interface to the underlying native (C++) Multiplayer library API. It is used by the top-level C# API.
- Underlying native (C++) PlayFabMultiplayer binaries for each supported platform:
  - Multiplayer DLL libraries for GDK
  - Multiplayer DLL libraries for Windows
- PlayFab "core" Unity SDK plugin (can be updated independently if needed)

## PlayFab Multiplayer Unity plugin versions and compatibility between platforms

PlayFab Multiplayer Unity plugin will be published and available for download at several distribution points (Git repos), depending on the platform. Access to some distribution points is restricted. You need to send a request to your Microsoft Representative and may include additional steps.

In order to provide a better guidance on compatibility between versions downloaded from different distribution points, and reflect a reference to a specific version of the underlying native library, PlayFab Multiplayer Unity plugin follows a custom versioning scheme.

### PlayFab Multiplayer Unity plugin versioning scheme

```
X.X.X.Y-(distribution-point-indicator).Z
```

For example, `1.2.0.3-gdk.0` (a version downloaded from the GDK repo with restricted access) or `1.2.0.3-ps5.0` (a version with Multiplayer binaries only for PlayStation&#174;5, downloaded from the PS5&#8482; repo with restricted access).

Version components:

- `X.X.X` - the lowest version of the underlying PlayFabMultiplayer library across all supported platforms. This is used for general reference consistency with a version of the underlying C++ library. In the example above, the version of an included PlayFabMultiplayer library for each platform is `1.2.0` or higher.
- `Y` - an incremental index of any modifications in the Multiplayer Unity C# layer, for any given X.X.X part of the version.
- `(distribution-point-indicator)` - a mnemonic code for tracking which distribution point a particular PlayFab Multiplayer Unity plugin package was downloaded from. It differs by distribution point, for example, `gdk` (Microsoft Azure DevOps repo with restricted access for GDK developers), `ps5` (Microsoft Azure DevOps repo with restricted access for PS5 developers), etc.
- `Z` - an incremental index of any modifications unique to the distribution point (for example, Multiplayer binaries updated/patched for a specific platform only).

A higher number in any version component means a newer version, by significance from left to right.

“PlayStation” is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

### Compatibility between versions from different distribution points

Regardless of a distribution point a PlayFab Multiplayer Unity plugin is downloaded from, it is guaranteed to be fully compatible with a PlayFab Multiplayer Unity plugin downloaded from any other distribution point, if **the first four numbers (`X.X.X.Y`) of their version are the same**. Compatible versions from different distribution points can be imported into user's Unity project in any order without a risk of overwriting/breaking one another, as their shared code should be identical. Though each of them may have some additional (not shared) files, specific to a particular platform, which shouldn't overlap.

For example, you can import all the following versions of PlayFab Multiplayer Unity plugin in your Unity project, in any sequential order, if you are targeting GDK, PS5 and Switch:

- `1.2.0.3-gdk.0` (imports Multiplayer binaries for GDK, among other files)
- `1.2.0.3-ps5.0` (imports Multiplayer binaries for PS5, among other files)
- `1.2.0.3-sw.0` (imports Multiplayer binaries for Switch, among other files)

The shared (cross-platform) Unity C# code included in each of these plugins will be the same.

## Which versions of Unity are supported?

We strive to support all recent versions of Unity starting with Unity 2017, however your choice may be limited by availability of a Unity development add-on for each particular platform, see corresponding Unity documentation. That, in turn, may also limit your choice of the platform SDK.

In general, we test PlayFab Multiplayer Unity plugin with one of the most recent versions of Unity development add-ons available for each platform. We encourage you to report any build or runtime issues with any new version of Unity Editor, Unity add-on, or a platform SDK.
