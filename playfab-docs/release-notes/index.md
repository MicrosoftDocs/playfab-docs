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

## 200128

### Multiplayer Server Event Changes:

We are introducing a change to the Multiplayer Server event naming convention in efforts to unify our event names with that of the rest of PlayFab event names.  Additionally, we are making these changes in advance of the Multiplayer Server feature becoming Public Preview.  The changes are:

* Multiplayer Server event names will be right casing
* Multiplayer Server events will no longer be sent in the legacy v1 PlayStream event format; only v2 PlayStream event format will be supported

 These two changes represent breaking changes, particularly for developers who take a dependency on non-right casing of names or PlayStream v1 of Multiplayer Server events.  These changes are not breaking for developers who leverage event names in the Game Manager UI (cloud script, insights, rules, or scheduled tasks).  This change will take effect Wednesday February 26, 2020 at 10:00 AM PST.  Please adjust your code for these changes before the change date.

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
