---
title: Obtaining PlayFab Party libraries
description: Guidance on how to use obtain PlayFab Party libraries.
author: PFarqMS
ms.author: phifarq
ms.date: 08/17/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, multiplayer, networking, unreal, unreal engine, unreal engine 4, unreal engine 5, middleware
---

# Obtaining PlayFab Party libraries

You will require PlayFab Party headers, library and DLL in order to be able to utilize this subsystem. See below for the options available to you.

## Using the GDK
PlayFab Party is included with the GDK and the OSS will use this version by default when building.

## Using the XDK
PlayFab Party headers, libraries, and DLLs are not included in the XDK. You must perform the steps outlined below in the **XDK: Bringing your own PlayFab Party library** section to obtain the XDK version of PlayFab Party.

This can be obtained by extracting the [PlayFab Party NuGet package](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabParty.Cpp.XboxOneXDK/) and [PlayFab Party Xbox Live NuGet package](https://www.nuget.org/packages/Microsoft.PlayFab.PlayFabPartyXboxLive.Cpp.XboxOneXDK/)

## XDK: Bringing your own PlayFab Party library
 - Navigate to the OnlineSubsystemPlayFabParty directory (where OnlineSubsystemPlayFabParty.uplugin is located)
- Create a new **Platforms** folder
- Create a new **XDK** folder inside the above folder
- Create these three new folders inside the XDK folder:
    - **Include**
    - **Lib**
    - **Redist**
- Copy the following files into the relevant folder:
    - Include: All Party & PartyXboxLive header files
    - Lib: Party.lib & PartyXboxLive.lib
    - Redist: Party.dll, PartyXboxLive.dll, Party.pdb and PartyXboxLive.pdb

XDK builds will now use this version of PlayFab Party.