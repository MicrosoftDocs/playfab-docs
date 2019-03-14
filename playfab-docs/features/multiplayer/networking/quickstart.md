---
title: Getting started with PlayFab Party
author: v-thopra
description: Helps you get started with the PlayFab Party 1PP Preview. (Note - PlayFab Party 1PP Preview was originally called Bumblelion)
ms.author: v-thopra
ms.date: 07/12/2018
ms.topic: article
ms.prod: playfab
ROBOTS: NOINDEX,NOFOLLOW
keywords: playfab, multiplayer, party, networking, communication
ms.localizationpriority: medium
---

# Getting started with the PlayFab Party Private Preview

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> It is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, you can request access by submitting a ticket on [support.playfab.com](https://support.playfab.com/hc/en-us/requests/new).

This quickstart helps you get started with PlayFab Party.

## Share Location

Please download the XBox ERA and Win32/Win10 libraries at:

```cmd
\\scratch2\scratch\Bumblelion\Bumblelion_1PP_Preview\
```

## Release Notes

- *Region Restrictions.* The PlayFab Party API is documented to support selecting the lowest latency region for a new network by passing an empty/null list of PartyRegions to CreateNewNetwork. This is currently not implemented. As well, the `PartyManager::GetRegions` and `RegionsChanged` state change are not implemented. For the time being when you create a new network please just pass a hard coded PartyRegion list.

```cpp
PartyRegion regionList[] = {
    // Hard-coded region
    {
        "WestUS", // region name
        0         // round trip latency
    },
};

RETURN_IF_FAILED(PartyManager::GetSingleton().CreateNewNetwork(
    buildId,
    localUser,
    &networkConfiguration,
    _countof(regionList),
    regionList,
    _countof(userIdentifiers),
    userIdentifiers,
    asyncIdentifier,
    &newNetworkDescriptor));
```

- *Handling LNM Audio Devices.* Prior to launching your title, you will need to have users signed in and paired to a controller and headset, otherwise audio will not flow.
- *Shared Pool.* We are currently limited to 200 active Party networks across all Wave 1 developers. Don’t be greedy! ;)
