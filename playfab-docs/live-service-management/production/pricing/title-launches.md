---
title: Title launches
author: joannaleecy
description: Describes how to launch titles in Game Manager.
ms.author: joanlee
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

1. **Development mode:** A title in development mode doesn't incur costs when you're using the core services. Use this mode to experiment with most of PlayFab offerings. A title in development mode is subjected to specific total player accounts and meter usage limits as determined by PlayFab. For more information about the included limits, see [Development mode](../pricing/Development-mode.md).

    > [!NOTE]
    > [Multiplayer server hosting](../multiplayer/servers/billing-for-thunderhead.md), [Party](../multiplayer/networking/pricing.md), and [Insights](../insights/pricing.md) aren't part of the core services. But they do have limited free usage available in Development mode.

1. **Live:** A live title uses metering to measure your usage. You're charged according to the paid service account plan and rate. Any meter usage over what is included in the account plan's base rate results in charges per meter consumed. For more information, see [Meters](../pricing/Meters/meters.md).

    > [!NOTE]
    > Your title could still be in development when your PlayFab title is Live. In the same way, you could have actual players in the game when the PlayFab title is in Development mode. A title in Development mode will continue to have the total player accounts limit as determined by PlayFab. Moving to Live removes that limit. To convert a title from Development mode to Live, go to the title in PlayFab portal and select the **Launch** button. For instructions, see below.

## Launching a title

> [!WARNING]
> Launching a title is a permanent action. The title cannot return to Development mode after the launch is completed.

To be able to move a title from Development mode to Live, a title must be in a Studio with a paid account plan.

### Launching a title with a Free to Start plan

Titles may only be changed to Live in Studios owned by paid accounts. Follow the steps in the section below to upgrade your free account to a paid account first. After the upgrade, you'll see the launch option to switch your title from Development mode to Live.

### Launching a title within a Paid Account Plan

To launch a title within a paid account plan:

1. Sign in to [PlayFab.com](https://playfab.com/)

2. Navigate to the **My Studios** page and identify the **Development mode** title to be launched.

3. Select the down arrow on the title to open the drop-down menu.

4. From the drop-down, select **Launch Title**.

5. If the title is linked to a free account plan, **Launch Title** takes you to the account upgrade flow described in the **Upgrading from Free to Paid** section. Once the title is linked to a paid account, continue to the next step.

6. A pop-up will prompt you to confirm the title launch. Once **Launch Title** is selected, the launch is complete, and the title is no longer bound by [Development mode](../pricing/Development-mode.md) limits.

## Frequently asked questions

Q: What happens when I launch my title for the world to sign up and play but it's still in PlayFab Development mode?

A: Because your title is in Development mode, it still has a 100K total player accounts limit. The core meters (Profile, Content and Configuration, and Events) continue to have no cost. When your title starts making a high number of service calls, it may be throttled, and would affect your overall player experience. To remove the player accounts limit, you have to move the title out of Development mode. At the same time, the core service meters start to charge your account normally, based on your tier of service.

Q: I'm using the **Free to Start** plan. Do I need to switch my title to Live at launch?

A: In the **Free to Start** plan, you don't have the **Launch** option to switch your title from Development mode to Live. You must first upgrade to a paid tier (pay-as-you-go or higher) to have the launch option made available to you.

Q: I'm only using PlayFab Party and it's free for Xbox Live users. What plan should I be using?

A: You can choose to use any of the plans we offer&mdash;Pay-as-you-go, Standard, or Premium. You won't be charged when Xbox Live users use Party for chat and networking.

Q: Do I have to switch my title to Live if I'm not expecting it to hit the **Free to Start** plan limits?

A: You don't have to. However, it's worth noting that we don't support load testing of any kind in Development mode. That includes a limited release of a title to a closed community. If a title in Development mode starts making a high number of calls to the service, it may be throttled.
