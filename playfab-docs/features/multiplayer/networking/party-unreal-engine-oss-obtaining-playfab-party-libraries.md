---
title: Obtaining PlayFab Party and Multiplayer libraries
description: Guidance on how to obtain PlayFab Party and Multiplayer libraries.
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, ue4, ue5, middleware
---

# Obtaining PlayFab Party and Multiplayer libraries

The use of this subsystem requires PlayFab Party and Multiplayer headers, libraries, and DLLs. Explore the options available to you based on your selected platform.

## Using the GDK
Headers, libraries, and DLLs for PlayFab Party and Multiplayer SDKs are located in [PlayFabMultiplayerUnreal GitHub repo](https://github.com/PlayFab/PlayFabMultiplayerUnreal/tree/main/Platforms/GDK). They're built with PlayFab OSS automatically.

## Using Windows
Headers, library, and DLL for PlayFab Party and Multiplayer SDKs are located in [PlayFabMultiplayerUnreal GitHub repo](https://github.com/PlayFab/PlayFabMultiplayerUnreal/tree/main/Platforms/Windows). They're built with PlayFab OSS automatically.
Each time we release PlayFab OSS, we always update the Party and Multiplayer SDKs to the latest version. If you would like to upgrade the SDKs yourself:
- Find Party SDK from [NuGet Windows](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.Windows) and Multiplayer SDK from [PlayFabMultiplayer release repo](https://github.com/PlayFab/PlayFabMultiplayer/releases)
- Replace the header in Platforms/Windows/Include by the include/ from the SDKs
- Replace the binaries in Platforms/Windows/Lib and Platforms/Windows/Redist by the bin/ from the SDKs

## Using the Switch, PlayStation®5 and PlayStation®4
* **Nuget.exe** Find the location of Nuget.exe on your machine and add it to the PATH environment variable.
* **Specific platform PlayFab Multiplayer and Party libraries:** run **SetUpPrivateOSS.ps1 -Platform <Switch | PlayStation>** located in the **OnlineSubsystemPlayFab** folder. This script pulls the binaries and source code for the supported private platforms. You must have [access](request-access-for-sdks-samples.md) to our private repositories. If you want to use a different version of NuGet package, you can change the **packages.config** file in the **\Platforms\[Switch|PS4|PS5]\** to the version you want. After you make changes to the **packages.config** file, you must perform SetUpPrivateOSS.ps1 again.

    If you see patch errors on `Source/OnlineSubsystemPlayFab.Build.cs`, please check if `Source/OnlineSubsystemPlayFab.Build.cs` has already been patched in your previous runs of the script. If yes, please feel free to ignore the patch error.

"PlayStation" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
"PS4" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
"PS5" is a registered trademark or trademark of Sony Interactive Entertainment Inc.
