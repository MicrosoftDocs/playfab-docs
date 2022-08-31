---
title: C++ PlayFab SDK
author: joannaleecy
description: Cross-platform (CPP) PlayFab SDK
ms.author: joanlee
ms.date: 01/22/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, c++, linux, cocos2d-x, unreal, lua sdk, windows, cross-platform
ms.localizationpriority: medium
---

# C++

![PlayFab CPP SDK](./media/cpp1.png)

The cross-platform C++ PlayFab SDK provides everything you need to access the PlayFab API. This includes models, methods, an HTTP wrapper for sending and receiving web requests, and JSON serialization.

If you have questions about the SDK or need help in resolving issues, go to [PlayFab forums](https://community.playfab.com/index.html) > **API and SDK**.

## SDK download links

- [Cross-platform C++ PlayFab SDK GitHub repo](https://github.com/PlayFab/XPlatCppSdk)
- [NuGet package for cross-platform C++ SDK](https://www.nuget.org/packages/com.playfab.xplatcppsdk.v141/)

This SDK is auto-generated using our open-sourced tool&mdash;[SDKGenerator](../sdkgenerator/index.md). We generally build SDKs every other week to stay current with the latest API changes.

## Platforms supported by this SDK

- Android
- iOS
- Linux
- Windows (Win32) x64
- Xbox One
- Xbox Series X|S

## When not to use this SDK

The cross-platform C++ PlayFab SDK should not be used if there is a more specific SDK that is suited for your project. Many C++ based engines also integrate Lua.

Specific PlayFab SDK is available for:
* [Cocos2d-x PlayFab SDK](https://github.com/PlayFab/Cocos2d-xSDK)
* [Unreal Engine PlayFab SDK at Unreal marketplace (external link)](https://www.unrealengine.com/marketplace/product/playfab-sdk)
* [LuaSDK PlayFab SDK](https://github.com/PlayFab/LuaSdk)

For a full list of the different PlayFab SDKs, see [Azure PlayFab SDK](../playfab-sdk-intro.md).

## Using the SDK

This native C++ project can be used in the following ways.

- As a stand-alone console Admin tools for maintaining your game.
  - The cross-platform C++ PlayFab SDK works great for a stand-alone C++ program.
- Integrated into an existing Visual Studio based C++ game.
  - Follow the instructions above to integrate the NuGet Package into your Visual Studio Solution, and you're ready to go.
- Integrated into an existing C++ based game engine.

## Add SDK to your project

- [Quickstart for Android](https://github.com/PlayFab/XPlatCppSdk/tree/master/build/Android)
- [Quickstart for iOS](https://github.com/PlayFab/XPlatCppSdk/blob/master/build/iOS/TestIOSApp/README.md)
- [Quickstart for Linux](quickstart-linux.md)
- [Quickstart for Windows (Win32) x64](quickstart-windows.md)
- [Quickstart for Xbox consoles](quickstart-xbox.md)

If none of the above options work for you, you can install the NuGet package into your Visual Studio project using the NuGet Package Manager. For instructions, see [Install and use a package in Visual Studio](/nuget/quickstart/install-and-use-a-package-in-visual-studio). For more information, see [Getting started with NuGet](/nuget/what-is-nuget).
