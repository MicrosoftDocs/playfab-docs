---
title: PlayFab Services SDK
author: amccalib
description: Introduction to the PlayFab Services C/C++ SDK
ms.author: andmcc
ms.date: 06/11/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, c++, windows, xbox, gdk, win32, nintendo, switch, sony, playstation, ps4, ps5, iOS, MacOS, Android, Linux
ms.localizationpriority: medium
---

# PlayFab Services SDK for C/C++

The new PlayFab Services SDK for C/C++ is currently available for the following platforms: Win32 (x64 only), Nintendo Switch, Sony PlayStation&#174;, iOS, macOS, Android, Linux, and the Microsoft GDK. Depending on the platform you're targeting, the way you acquire the SDK differs.

## Win32, iOS, macOS, Android, Linux

Download from GitHub: [PlayFabCSdk Releases](https://github.com/PlayFab/PlayFabCSdk/releases). Release binaries and headers are available alongside the SDK source.

## GDK

The Microsoft Game Development Kit (GDK) includes the PlayFab Services SDK as an extension library. That means you can include PlayFab in your Xbox and Windows games without another SDK download.

To learn more about the GDK, see the public documentation: [GDK documentation homepage](/gaming/gdk/).

## Nintendo Switch

Before you can access the PlayFab Services SDK for Nintendo Switch, you need to confirm your registered developer status via the PlayFab page in Nintendo's middleware directory. See more information here: [Request access](../../features/multiplayer/networking/request-access-for-sdks-samples.md).

Once you've been granted access to the Switch SDK, you can download it from the git repo here: [PlayFabCSdk.Switch](https://dev.azure.com/PlayFabPrivate/Switch/_git/PlayFabCSdk.Switch).

## Sony PlayStation

Before you can access the PlayFab Services SDK for PlayStation, you need to confirm your registered developer status via the PlayFab page in Sony's middleware directory. See more information here: [Request access](../../features/multiplayer/networking/request-access-for-sdks-samples.md).

Once you've been granted access to the PlayStation SDK, you can download it from the git repo here: [PlayFabCSdk.PS4](https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabCSdk.PS4) and [PlayFabCSdk.PS5](https://dev.azure.com/PlayFabPrivate/PS5/_git/PlayFabCSdk.PS5).

## What this SDK includes

The PlayFab Services SDK for C/C++ is for use by a game's runtime components (clients and servers) on Win32 (x64 only), Nintendo Switch, Sony PlayStation&#174;, iOS, macOS, Android, Linux, and the Microsoft GDK. It includes only the subset of feature areas and service calls appropriate for games running on those platforms.

Here are some notable differences when compared to other, more general purpose, PlayFab SDKs:
- The PlayFab Admin API is not included. This SDK is intended to be part of the game runtime (or dedicated server), not for tools or generic services.
- The PlayFab Server API is only available for select platforms that are used for hosting game servers, specifically Windows, Linux, and macOS.
- The available login methods depend on the platform. For instance, LoginWithApple is only available on Apple devices.
- This SDK removes some older or underutilized feature areas to reduce overall complexity. These areas include economy v1, player stats and leaderboards, and characters.

## Benefits of this SDK

- Allows titles to control the memory allocations when calling Playfab Services. See [Managing Memory Allocations](./memory.md) to learn more.
- Allows titles to gain full control of thread handling when calling Playfab Services. See [Making async calls in the PlayFab Services SDK](./async.md) to learn more.
- Portable C interface that allows maximum compatibility across platforms, compilers, and languages.
- High-performance telemetry pipeline with support for low-cost queuing and batch transmission of events.

## Platforms supported by this SDK

This SDK is appropriate for x64 Win32 games and game servers, Nintendo Switch games, Sony PlayStation games, iOS games, Android games, macOS games, Linux games, and games utilizing the GDK on Windows and Xbox.

## When not to use this SDK

There are scenarios where this SDK is not appropriate:

- If your game utilizes a game engine for which there's already an engine-specific PlayFab SDK, that SDK is a better fit: [Unreal Engine](../unreal/index.md), [Unity3D](../unity3d/index.md).

## Add this SDK to your project

- Win32
    - The Win32 version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for Win32](./quickstart-win32.md).
- GDK
    - The GDK version of this SDK is a component of the GDK. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for GDK](./quickstart-gdk.md).
- Android
    - The Android version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for Android](./quickstart-android.md).
- iOS
    - The iOS version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for iOS](./quickstart-ios.md).
- macOS
    - The macOS version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for macOS](./quickstart-macos.md).
- Linux
    - The Linux version of this SDK is available via GitHub. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for Linux](./quickstart-linux.md).
- Sony Playstation
    - See [Sony Playstation](#sony-playstation)
- Nintendo Switch
    - See [Nintendo Switch](#nintendo-switch)

## Reference

[API reference documentation](../../api-references/c/pfauthentication/pfauthentication_members.md)

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
