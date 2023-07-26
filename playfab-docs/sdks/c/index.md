---
title: PlayFab Services SDK
author: amccalib
description: Introduction to the PlayFab Services C/C++ SDK
ms.author: andmcc
ms.date: 02/15/2023
ms.topic: article
ms.service: playfab
keywords: playfab, c++, windows, xbox, gdk, win32
ms.localizationpriority: medium
---

# PlayFab Services SDK for C/C++

The PlayFab Services SDK is currently available for two platforms: Win32 (x64 only) and the Microsoft GDK. Depending on the platform you're targeting, the way you acquire the SDK differs.

## Win32

Download from GitHub: [PlayFabCSdk Releases](https://github.com/PlayFab/PlayFabCSdk/releases). Release binaries and headers are available alongside the SDK source.

## GDK

Starting with the March 2023 release, the Microsoft Game Development Kit (GDK) includes the PlayFab Services SDK as an extension library. That means you can include PlayFab in your Xbox and Windows games without another SDK download.

To learn more about the GDK, see the public documentation: [GDK documentation homepage](/gaming/gdk/).

## What this SDK includes

The PlayFab Services SDK for C/C++ is solely for use by game clients on Windows and Xbox. It includes only the subset of feature areas and service calls appropriate for that scenario. We will be adding support for more platforms and scenarios over time.

Here are some notable differences when compared to other, more general use, PlayFab SDKs:
- This SDK omits any service calls that require admin or developer-level authentication. Specifically, any call that requires a developer secret key or title entity token to authorize isn't available in this SDK.
- There is a limited set of player login methods:
    - __PFAuthenticationLoginWithXUserAsync__ uses an __XUserHandle__ to authenticate the player with PlayFab.
    - __PFAuthenticationLoginWithSteamAsync__ uses a Steam token to authenticate with PlayFab.
    - __PFAuthenticationLoginWithCustomIdAsync__ uses a custom string provided by the developer.
    - __PFAuthenticationLoginWithOpenIdConnectAsync__ allows for a custom, sever-authoritative auth flow that depends on an existing OpenId backend implementation.
- This SDK removes some older or underutilized feature areas to reduce overall complexity. These areas include economy v1, player stats and leaderboards, and characters.

## Benefits of this SDK

- Allows titles to control the memory allocations when calling Playfab Services. See [Managing Memory Allocations](./memory.md) to learn more.
- Allows titles to gain full control of thread handling when calling Playfab Services. See [Making async calls in the PlayFab Services SDK](./async.md) to learn more.
- Portable C interface that allows maximum compatibility across platforms, compilers, and languages.

## Platforms supported by this SDK

This SDK is appropriate for any x64 Win32 game and games utilizing the GDK on these platforms:
- Windows
- Xbox One
- Xbox Series X|S

## When not to use this SDK

There are two scenarios where this SDK may not be appropriate for your GDK or Windows game:

- If your game utilizes a game engine for which there's already an engine-specific PlayFab SDK, that SDK is a better fit: [Unreal Engine](../unreal/index.md), [Unity3D](../unity3d/index.md).
- At this time, we don't have versions of this SDK available for platforms beyond Windows and the GDK. Expanded platform support is planned soon. If your game is also targeting other platforms and you prefer to use a single SDK, you can continue to use the [Legacy C++ SDK](../playfab-cpp/index.md).

## Add this SDK to your project

- Win32
    - The Win32 version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for Win32](./quickstart-win32.md).
- GDK
    - The GDK version of this SDK is a component of the GDK. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for GDK](./quickstart-gdk.md).

## Reference

[API reference documentation](../../api-references/c/pfauthentication/pfauthentication_members.md)
