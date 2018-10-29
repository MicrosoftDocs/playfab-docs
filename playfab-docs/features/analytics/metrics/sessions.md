---
title: Sessions
author: v-thopra
description: Describes how to enable and manage logging events to calculate Focus Time and Session Duration.
ms.author: v-thopra
ms.date: 29/10/2018
ms.topic: article
ms.prod: gaming
ms.technology: playfab
keywords: playfab
ms.localizationpriority: medium
---

# Sessions

PlayFab supports logging events to calculate Focus Time and Session Duration. Learn more on our [blog](https://blog.playfab.com/blog/sessions-preview-is-live).

## Supported SDK Versions

Session support is currently only available in the Unity SDK. Support for our other SDKs will be added in the future. You'll need to have the 180829 version or newer. This SDK first introduces two new events that can be configured to be emitted from the client automatically:

- [client_session_start](https://api.playfab.com/playstream/events/client_session_start)
- [client_focus_change](https://api.playfab.com/playstream/events/client_focus_change)

## Logging & Managing Events

To begin collecting these two events, you'll first need to integrate the Unity SDK in your client. Instructions can be found in the [Unity3D Quickstart](../../../sdks/unity3d/quickstart.md).

Presently, these events are disabled by default, though we plan to change this in the future. You can manage the collection of focus time from Game Manager. Navigate to > Settings > Data Collection and toggle this option on or off under the Options section. 

> [!NOTE]
> Disabling this option will prevent these events from being emitted by the client.

![Game Manager - Settings - Data Collection](media/tutorials/game-manager-settings-data-collection.png)  

You can also disable these from the code by setting the following option to true in your title setup:

```csharp
PlayFabSettings.DisableFocusTimeCollection = true
```

## Legacy Instructions

If your game uses an SDK between the 180716 and 180809, it's possible for you to send the focus time events, though it requires additional steps. Because these events leverage the WriteEvents API, you'll first need to ensure the Enable Entity API flag is enabled from the SDK settings at the time you update the SDK.

![PlayFab - Settings - Enable Entity API](media/tutorials/playfab-settings-enable-entity-api.png)  

Next, you'll need to login to the Entity system by adding the following line to each of your login requests:

```csharp
LoginTitlePlayerAccountEntity
```

Once you've done so, you should see these same events show.
