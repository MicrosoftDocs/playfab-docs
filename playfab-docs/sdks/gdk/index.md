---
title: GDK PlayFab Services SDK
author: amccalib
description: Introduction to the PlayFab Services SDK in the GDK
ms.author: andmcc
ms.date: 02/15/2023
ms.topic: article
ms.service: playfab
keywords: playfab, c++, windows, xbox, gdk
ms.localizationpriority: medium
---

# GDK

Starting with the March 2023 release, the Microsoft Game Development Kit (GDK) includes the PlayFab Services SDK as an extension library. That means you can include PlayFab in your Xbox and Windows games without another SDK download.

To learn more about the GDK, see the public documentation: [GDK documentation homepage](/gaming/gdk/).

## What this SDK includes

The PlayFab Services SDK in the GDK is solely for use by game clients built with the GDK. It includes only the subset of feature areas and service calls appropriate for that scenario.

Here are some notable differences when compared to other, more general use, PlayFab SDKs:
- This SDK omits any service calls that require admin or developer-level auth. Specifically, any call that requires a developer secret key or title entity token to authorize isn't available in this SDK.
- There's only a single player login method: __PFAuthenticationLoginWithXUserAsync__. It uses an __XUserHandle__ to authenticate the player with PlayFab.
- This SDK removes some older or underutilized feature areas to reduce overall complexity. These areas include economy v1, player stats and leaderboards, and characters.

## Benefits of this SDK

- Allows titles to control the memory allocations when calling Playfab Services. See [Managing Memory Allocations](memory.md) to learn more.
- Allows titles to gain full control of thread handling when calling Playfab Services. See [Making async calls in the PlayFab Services SDK](async.md) to learn more.

## Platforms supported by this SDK

This SDK is appropriate for any game utilizing the GDK on these platforms:
- Windows
- Xbox One
- Xbox Series X|S

## When not to use this SDK

There are two scenarios where this SDK may not be appropriate for your GDK game:

- If your game utilizes a game engine for which there's already an engine-specific PlayFab SDK, that SDK is a better fit: [Unreal Engine](../unreal/index.md), [Unity3D](../unity3d/index.md).
- At this time, we don't have versions of this SDK available for non-GDK platforms. If your game is targeting platforms not supported by the GDK, the [Cross-platform C++ SDK](../playfab-cpp/index.md) may be a better fit.

## Add this SDK to your project

Since this SDK is a component of the GDK, adding it to your project is quick and easy. Follow the instructions here to start making basic calls to PlayFab: [Quickstart for GDK](quickstart.md).

## Reference

[API reference documentation](../../api-references/c/pfauthentication/pfauthentication_members.md)
