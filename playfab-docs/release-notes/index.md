---
title: PlayFab Release Notes 2020
author: v-thopra
description: PlayFab Release Notes for 2020.
ms.author: v-thopra
ms.date: 01/01/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, development, release, apis, features
ms.localizationpriority: medium
---

# PlayFab Release Notes 2020

## 200121

### API & Documentation Changes:

* PlayFab API Documentation site has been fully migrated to https://docs.microsoft.com/gaming/playfab/
    * Most api.playfab.com links have been converted to their equivalent docs.microsoft.com links
    * Most original links redirect to the new site properly
    * Let us know in the [forums](https://community.playfab.com/index.html) if any old links don't work
* New api methods:
    * multiplayer.ListServerBackfillTicketsForPlayer
    * multiplayer.GetServerBackfillTicket
    * multiplayer.CreateServerBackfillTicket
    * multiplayer.CancelServerBackfillTicket
    * multiplayer.CancelAllServerBackfillTicketsForPlayer
    * server.UnlinkPSNAccount
    * server.LinkPSNAccount

### [LuaSdk](https://github.com/PlayFab/LuaSdk) specific changes:

* Minor login bugfix

### [PhpSdk](https://github.com/PlayFab/PhpSdk) specific changes:

* Minor syntax fix for strict correctness

### [UnitySDK](https://github.com/PlayFab/UnitySDK) specific changes:

* Update the GitHub repro and project structure.
    * Moving the Unity EdEx package from (UnityEditorExtensions)[https://github.com/PlayFab/UnityEditorExtensions] to (UnitySdk)[https://github.com/PlayFab/UnitySDK/blob/master/Packages/PlayFabEditorExtensions.unitypackage]
    * In the future, we will also be phasing out the separate UnityEditorExtensions repo
