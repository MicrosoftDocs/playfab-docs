---
title: Sessions
author: v-thopra
description: Describes how to enable and manage logging events to calculate Focus Time and Session Duration.
ms.author: v-thopra
ms.date: 29/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, metrics, sessions
ms.localizationpriority: medium
---

# Sessions

**PlayFab** supports logging **Events** to calculate **Focus Time** and **Session Duration**. You can learn even more on our [blog](https://blog.playfab.com/blog/sessions-preview-is-live).

## Supported SDK Versions

**Session Support** is currently only available in the **Unity SDK**. Support for our other **SDKs** will be added in the future.

You'll need to have the **180829** version or newer. This **SDK** first introduces two new **Events** that can be configured to be emitted from the **Client** automatically:

1. [client_session_start](https://api.playfab.com/playstream/events/client_session_start)
2. [client_focus_change](https://api.playfab.com/playstream/events/client_focus_change)

## Logging & Managing Events

To begin collecting these two events, you'll first need to integrate the **Unity SDK** in your **Client**.

Instructions on how to do this can be found in the [Unity3D Quickstart](../../../sdks/unity3d/quickstart.md).

Presently, these **Events** are disabled by default, though we plan to change this in the future. You can manage the collection of **Focus Time** from **Game Manager**:

- Navigate to **Settings**.
- Go to **Data Collection**.
- In the **Options** section, toggle this **Option** **ON** or **OFF**.

> [!NOTE]
> Disabling this **Option** will prevent these events from being emitted by the **Client**.

![Game Manager - Settings - Data Collection](media/tutorials/game-manager-settings-data-collection.png)  

You can also disable these from the code by setting the option shown below to **True** in your **Title** setup.

```csharp
PlayFabSettings.DisableFocusTimeCollection = true
```

## Legacy Instructions

If your game uses an **SDK** between the **180716** and **180809**, it's possible for you to send the focus time **Events**, although it requires additional steps.

Because these **Events** leverage the **WriteEvents API**, you'll first need to ensure the **Enable Entity API** flag is enabled from the **SDK** settings at the time you update the **SDK**.

![PlayFab - Settings - Enable Entity API](media/tutorials/playfab-settings-enable-entity-api.png)  

Next, you'll need to login to the **Entity** system by adding the line shown below to each of your login requests.

```csharp
LoginTitlePlayerAccountEntity
```

Once you've done that, you should see these same **Events**.
