---
title: Creating a PlayFab Account
author: joannaleecy
description: Describes how to create a PlayFab account.
ms.author: joanlee
ms.date: 06/03/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, developer account, game manager, sdk, api
ms.localizationpriority: medium
---

# Creating a PlayFab account

Before you can call any PlayFab API, you must have a [PlayFab developer account](https://developer.playfab.com/en-us/sign-up). If you already have a PlayFab account, you can skip this step.

![PlayFab - Create your account](media/quickstart/playfab-create-new-account.png)

Once you have a PlayFab account, navigate to the PlayFab home page, [https://playfab.com](https://playfab.com), and sign in.

Since PlayFab doesn't know the name of your game studio or the title of your game, when you create a studio, a placeholder title called **My Game** is created for you. You can edit your title's information in the **Create Title** screen at any time.

> [!NOTE]
> The **Title ID** is unique to your game, which we refer to as a title. You will use this value when you make PlayFab API calls (your **Title ID** will *not* be **BCFE**).

![PlayFab - Create a new game](media/quickstart/playfab-create-new-game.png)

PlayFab created your first title is automatically. To create another new title, select **New title** from the Ellipsis menu.

## Open the Game Manager for your title

Before installing any SDK, select a game title to enter Game Manager. Take the time to familiarize yourself with the various sections in the Game Manager dashboard.

For a more detailed overview, visit the [Game Manager quickstart](quickstart.md).

The PlayFab Game Manager allows you to do whatever you need to with your game title. Once you have a grasp on the aspects of the Game Manager, install the SDK so you can start using APIs. for more information on how to do install the SDK, see [SDKs overview](../sdks/sdk-overview.md).
