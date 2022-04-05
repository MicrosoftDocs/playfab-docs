---
title: Title Launches
author: nathankong-microsoft
description: Describes how to launch titles in Game Manager.
ms.author: joanlee
ms.date: 10/15/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, pricing, titles, launch, live
ms.localizationpriority: medium
---

# Title Launches
Customers can upgrade their account plan and launch titles using the self-service upgrade and launch experiences found in Game Manager.

## Title Modes
A PlayFab title has two possible modes:
1. **DEVELOPMENT MODE :** A Development Mode title has no cost to the customer for the core services ([multiplayer server hosting](../multiplayer/servers/billing-for-thunderhead.md), [Party](../multiplayer/networking/pricing.md), and [Insights](../insights/pricing.md) are not core services, though they do have limited free usage available in Development Mode - please see the individual feature pages for more information). Use Development mode to experiment with most PlayFab offerings. A title in development mode is subject to the specific player count and meter usage limits determined by PlayFab. For more information about included limits, see [development mode](../pricing/Development-Mode.md).
2. **LIVE MODE :** A Live Mode title is charged to the customer based on its tier of service. Any meter usage over what is included in the account plan's base rate results in charges per meter consumed. For more information, see [Meters](../pricing/Meters/meters.md). Note that Live Mode should not be confused with a title being "live". A title may have players using it even in Development Mode, though the title will be limited to the player account maximum for Development Mode. Moving to Live Mode removes that limit.

## Launching a title

> [!WARNING]
> Launching a title is a permanent action. The title cannot return to Development mode after the launch is completed.

To be able to move a title from Development Mode to Live Mode, a title must be in a Studio with a paid account plan.

### Launching a Title within a Free Account Plan
Titles may only be changed to Live Mode in Studios owned by paid accounts. Follow the steps listed under Upgrading from Free to a paid account to launch a title in conjunction with upgrading an account.

### Launching a Title within a Paid Account Plan
To launch a title within a paid account plan:

1. Log in to [PlayFab.com](https://playfab.com/)

2. Navigate to the **My Studios** page and identify the **Development Mode** title to be launched (2).

3. Select the down arrow on the title to open the drop-down menu (2).

4. From the drop down, select **Launch Title**. 

5. If the title is linked to a free account plan, **Launch Title** takes you to the account upgrade flow described in the **Upgrading from Free to Standard** section. If the title is linked to a paid account, continue to the next step.

6. A pop-up will prompt you to confirm the title launch. Once **Launch Title** is selected, the launch is complete and the title is no longer bound by [Development Mode](../pricing/Development-Mode.md) limits.
