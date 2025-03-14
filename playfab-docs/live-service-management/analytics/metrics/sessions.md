---
title: Sessions
author: joannaleecy
description: Describes how to enable and manage logging events to calculate Focus Time and Session Duration.
ms.author: joanlee
ms.date: 10/29/2018
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, metrics, sessions
ms.localizationpriority: medium
---

# Sessions

PlayFab supports logging events to calculate focus time and session duration. You can learn even more on our [blog](https://blog.playfab.com/blog/sessions-preview-is-live).

## Supported SDK versions

Session support is currently *only* available in Unity SDK. Support for our other SDKs will be added in the future.

You'll need to have the **180829** version or newer. This SDK first introduces two new events that can be configured to be emitted from the client automatically:

1. [client_session_start](../../../api-references/events/client-session-start.md)
2. [client_focus_change](../../../api-references/events/client-focus-change.md)

## Logging and managing events

To begin collecting these two events, you'll first need to integrate the Unity SDK in your client.

Instructions on how to do this can be found in the [Unity3D quickstart](../../../sdks/unity3d/quickstart.md).

Presently, these events are disabled by default, though we plan to change this in the future. You can manage the collection of focus time from Game Manager:

- Navigate to **Settings**.
- Go to **Data Collection**.
- In the **Options** section, toggle this option **ON** or **OFF**.

> [!NOTE]
> Disabling this option will prevent these events from being emitted by the client.

![Game Manager - Settings - Data Collection](media/tutorials/game-manager-settings-data-collection.png)  

You can also disable these from the code, by setting the option shown below to `true` in your title setup, as shown below.

```csharp
PlayFabSettings.DisableFocusTimeCollection = true
```

## Legacy Instructions

If your game uses an SDK between the **180716** and **180809**, it's possible for you to send the focus time events, although it requires additional steps.

Because these events leverage the [WriteEvents](xref:titleid.playfabapi.com.events.playstreamevents.writeevents) API, you'll first need to ensure the **Enable Entity API** flag is enabled (checked) in the SDK settings at the time you update the SDK.

![PlayFab - Settings - Enable Entity API](media/tutorials/playfab-settings-enable-entity-api.png)  

Next, you'll need to log into the entity system, by adding the line shown below to each of your login requests.

```csharp
LoginTitlePlayerAccountEntity
```

Once you've done that, you should see these same events.
