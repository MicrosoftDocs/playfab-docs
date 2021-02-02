---
title: Azure PlayFab Party SDKs
author: joannaleecy
description: Learn about the SDKs for Azure PlayFab Party.
ms.author: joanlee
ms.date: 10/13/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, party, sdk, sample
ms.localizationpriority: medium
---

# Azure Playfab Party SDKs

This topic describes all the Azure PlayFab Party SDKs that are currently available. 

If you don't find what you need, let us know by writing a post on our [forums](https://community.playfab.com/index.html).

Access to samples for Nintendo Switch, PlayStation 4, PlayStation 5, Google Stadia, PC (GDK), and Xbox (GDK) requires special approval and adherence to platform policies. For more information, see [Request access for SDKs and samples](request-access-for-sdks-samples.md). 

If you're looking for the core PlayFab SDK that helps you implement a majority of our features, including LiveOps, commerce, matchmaking, and data analytics, see [PlayFab SDKs](../../../sdks/playfab-sdk-intro.md).

> [!Tip]
> Unsure if this is the SDK you need? See [SDK overview - PlayFab SDK, Party SDK, Multiplayer Server SDK](../../../sdks/sdk-overview.md).

## By content type

| SDK/library| Platform/operating system|
|------------|--------------------------|
| C/C++ SDK    |[Android, iOS, Windows 10, Windows 8.1](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows/), [Stadia](https://github.com/PlayFab/PlayFabPartyStadia), [Switch](https://github.com/PlayFab/PlayFabPartySwitch), [PlayStation 4](https://github.com/PlayFab/PlayFabPartyPS4), [PlayStation 5](https://github.com/PrivateParties/PlayFabPartyPS5), [PC (GDK) and Xbox (GDK)](https://aka.ms/gdkdl) (Use the version that's included in GDK.)|
| Unity SDK  |[Android, iOS, Windows 10, Windows 8.1](https://github.com/PlayFab/PlayFabPartyUnity/releases), [PlayStation 4](https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4) (prerelease), [PlayStation 5](https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS5) (prerelease soon to be available), [Switch](https://github.com/PlayFab/PlayFabPartyUnitySwitch) (prerelease), [PC (GDK) and Xbox (GDK)](https://aka.ms/gdkdl) (under **Add-ins**)|
| Unreal SDK |[PC (GDK) and Xbox (GDK)](https://aka.ms/gdkdl) (under **Add-ins**)|
|Xbox Live Helper Library|[Windows 10, Windows 8.1, Windows 7](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.Windows), [PC (GDK) and Xbox (GDK)](https://aka.ms/gdkdl) (Use the version that's included in the GDK.)|

## By platform/operating system

| Platform/operating system| SDK/library|
|--------------------------|------------|
| Android | [C/C++ SDK](https://github.com/PlayFab/PlayFabParty/releases), [Unity](https://github.com/PlayFab/PlayFabPartyUnity/releases)|
| iOS | [C/C++ SDK](https://github.com/PlayFab/PlayFabParty/releases), [Unity](https://github.com/PlayFab/PlayFabPartyUnity/releases)|
| Stadia | [C/C++ SDK](https://github.com/PlayFab/PlayFabPartyStadia)|
| Switch | [C/C++ SDK](https://github.com/PlayFab/PlayFabPartySwitch), [Unity](https://github.com/PlayFab/PlayFabPartyUnitySwitch) (prerelease)|
| PlayStation 4 | [C/C++ SDK](https://github.com/PlayFab/PlayFabPartyPS4), [Unity](https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS4) (prerelease)|
| PlayStation 5 | [C/C++ SDK](https://github.com/PrivateParties/PlayFabPartyPS5), [Unity](https://dev.azure.com/PlayFabPrivate/PS4/_git/PlayFabPartyUnityPS5) (prerelease soon to be available)|
| Xbox (XDK) | [C/C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.XboxOneXDK), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.XboxOneXDK)
| PC (GDK) and Xbox (GDK) | [Unity, Unreal](https://aka.ms/gdkdl) (under **Add-ins**), [C/C++ SDK, Xbox Live Helper Library](https://aka.ms/gdkdl) (Use the version that's included in the GDK.)|
| Windows 10, Windows 8.1 |[C/C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows/), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.Windows)|
| Windows 7|[C/C++ SDK](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows/), [Xbox Live Helper Library](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.Windows)|

## See also

* [Party samples](party-samples.md)
* [Quickstart for Android](android-specific-requirements.md)
* [Quickstart for iOS](ios-specific-requirements.md)
* [Quickstart for Unity](party-unity-plugin-quickstart.md)
* [Quickstart for Unreal](party-unreal-engine-oss-quickstart.md)
* [Party overview](index.md)
* [Getting started with Party](party-getting-started.md)