---
title: Azure PlayFab SDKs
author: joannaleecy
description: Azure PlayFab SDKs
ms.author: joanlee
ms.date: 02/22/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, playfab sdk
ms.localizationpriority: medium
---

# Azure PlayFab SDK

This topic lists the different flavors of Azure PlayFab SDKs we currently have today.

PlayFab SDK enables you to implement a majority of our features, including LiveOps, economy, and data analytics.

Access to SDKs for Nintendo Switch, PlayStation&#174;4, PlayStation&#174;5, and Google Stadia requires special approval and adherence to platform policies. For more information, see [Request access for SDKs and samples](../features/multiplayer/networking/request-access-for-sdks-samples.md).

For broad API categories in this SDK, see [API REST operation groups](/rest/api/playfab/admin/).

> [!TIP]
> Unsure if this is the SDK you need? See [SDK overview - PlayFab SDK, Party SDK, Multiplayer Server SDK](sdk-overview.md).

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.

## By content

| SDK/library                       | Platform/environments                     |
|-----------------------------------|-------------------------------------------|
| C++                               | [Android, iOS, Linux, Windows (Win32) x64, Xbox One, Xbox Series X&#124;S](playfab-cpp/index.md), [Switch](https://dev.azure.com/PlayFabPrivate/Switch/_git/XPlatCppSdk-Private-Switch), [PlayStation 4](https://dev.azure.com/PlayFabPrivate/PS4/_git/XPlatCppSdk-Private-Ps4), [PlayStation 5](https://dev.azure.com/PlayFabPrivate/PS5/_git/XPlatCppSdk-Private-PS5), [Cocos2D](cocos2d-x/index.md) (community supported)|
| C#                                | [Xamarin](c-sharp/index.md) and other C#/.NET environments besides Unity |
| Java                              | [Android Studio](androidstudio/index.md) |
| JavaScript                        | [Phaser.io](phaser/index.md)|
| Lua                               | [Corona (now Solar2D), Defold](lua/index.md) |
| NodeJS                            | [Node.js applications](nodejs/index.md)|
| Objective-C (community supported) | [iOS](objective-c/index.md)|
| Photon                            | [Facilitates PlayFab integration only](photon/index.md)|
| PHP (community supported)         | [PHP](php/index.md)|
| Python (community supported)      | [Python](python/index.md)|
| Unity                             | [Titles developed using Unity](unity3d/index.md)|
| Unreal Engine                     | [Titles developed using Unreal Engine](unreal/index.md)|

## By platform/operating system

| Platform/operating system | SDK/library                       |
|---------------------------|-----------------------------------|
| Android                   | [C# (using Xamarin)](c-sharp/index.md), [Java/Android Studio](java/index.md), [Lua](lua/index.md), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |
| iOS                       | [C# (using Xamarin)](c-sharp/index.md), [Lua](lua/index.md), [Objective-C](objective-c/index.md) (community supported), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |
| Linux                     | [C++](playfab-cpp/index.md), [Lua](lua/index.md) |
| PlayStation 4             | [C++](https://dev.azure.com/PlayFabPrivate/PS4/_git/XPlatCppSdk-Private-Ps4), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |
| PlayStation 5             | [C++](https://dev.azure.com/PlayFabPrivate/PS5/_git/XPlatCppSdk-Private-PS5), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |
| Switch                    | [C++](https://dev.azure.com/PlayFabPrivate/Switch/_git/XPlatCppSdk-Private-Switch), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md)               |
| Windows (Win32) x64       | [C++](playfab-cpp/index.md), [Lua](lua/index.md), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |
| Xbox One, Xbox Series X&#124;S| [C++](playfab-cpp/index.md), [Unity](unity3d/index.md), [Unreal Engine](unreal/index.md) |

Alternatively, you can also view the available SDKs based on [languages](./languages/index.yml), [frameworks](./frameworks/index.yml), [game engines](./game-engines/index.yml), and [scripting languages](./scripting/index.yml).

## See also

* [SDKs overview](sdk-overview.md)
* [What is PlayFab?](../what-is-playfab.md)
