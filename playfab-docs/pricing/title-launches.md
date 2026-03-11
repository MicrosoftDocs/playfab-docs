---
title: Title launches
author: joannaleecy
description: Describes how to launch titles in Game Manager.
ms.author: jenelleb
ms.date: 7/20/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, titles, launch, live
ms.localizationpriority: medium
---

# Title launches

Customers can upgrade their account plan and launch titles using the self-service upgrade and launch experiences found in Game Manager.

## Title modes

A PlayFab title has two possible modes.

1. **Development mMde:** A title in Development Mode doesn't incur costs when you're using the core services. Use this mode to experiment with most of PlayFab offerings. A title in Development Mode is subjected to specific total player accounts and meter usage limits as determined by PlayFab. For more information about the included limits, see [development-mode.md](development-mode.md).

1. **Live:** A live title uses metering to measure your usage. You're charged according to the paid service account plan and rate. Any meter usage over what is included in the account plan's base rate results in charges per meter consumed. For more information, see [Meters/meters.md](Meters/meters.md).

    > [!NOTE]
    > Ensure you move your PlayFab title out of Development Mode before releasing your game. A title in Development Mode will continue to have the total player accounts limit as determined by PlayFab. Moving to Live removes that limit. To convert a title from Development Mode to Live, go to the title in PlayFab portal and select the **Launch** button. For instructions, see below.

## Launching a title

> [!WARNING]
> Launching a title is a permanent action. The title cannot return to Development Mode after the launch is completed.

To be able to move a title from Development Mode to Live, a title must be in a Studio with a paid account plan.

### Launching a title with a Free to Start plan

Titles may only be changed to Live in Studios owned by paid accounts. Follow the steps in the section below to upgrade your free account to a paid account first. After the upgrade, you'll see the launch option to switch your title from Development Mode to Live.

### Launching a title within a Paid Account Plan

To launch a title within a paid account plan:

1. Sign in to [https://developer.playfab.com/](https://developer.playfab.com/)

2. Navigate to the **My Studios** page and identify the **Development Mode** title to be launched.

3. Select the down arrow on the title to open the drop-down menu.

4. From the drop-down, select **Launch Title**.

5. If the title is linked to a free account plan, **Launch Title** takes you to the account upgrade flow described in the **Upgrading from Free to Paid** section. Once the title is linked to a paid account, continue to the next step.

6. A pop-up will prompt you to confirm the title launch. Once **Launch Title** is selected, the launch is complete, and the title is no longer bound by [development-mode.md](development-mode.md) limits.

## Frequently asked questions

Q: What happens when I launch my title for the world to sign up and play but it's still in PlayFab Development Mode?

A: Because your title is in Development Mode, there is a limit on the total number of player accounts that can be created in that title. Once your title reaches that limit, all requests to create new player accounts will be denied which will impact the player experience.  To remove the player accounts limit, you have to move the title out of Development Mode. 

Q: I'm using the **Free to Start** plan. Do I need to switch my title to Live at launch?

A: In the **Free to Start** plan, you don't have the **Launch** option to switch your title from Development Mode to Live. You must first upgrade to a paid tier (pay-as-you-go or higher) to have the launch option made available to you.