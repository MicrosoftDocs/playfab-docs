---
title: Development mode
author: joannaleecy
description: Describes the features and limits of Development mode titles.
ms.author: joanlee
ms.date: 09/09/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing, dev mode, development mode, title, meter, meters
ms.localizationpriority: medium
---

# Titles in Development mode

> [!IMPORTANT]
> When you're ready to scale up, it's important to make sure you switch your title from "Development mode" to "Live." To make this change, use the **Launch** button on the Game Overview page or the PlayFab main dashboard. This change ensures that the title isn't limited to 100,000 player accounts.

All PlayFab titles are in one of two possible states - development mode and live. Development mode is, as the name suggests, meant for titles currently in development. This mode provides developers with the flexibility to connect a title to PlayFab without running up the bill.

A game in development mode can have up to 100,000 players. These titles can be [launched](title-launches.md) through Game Manager and is then considered live. Launching a title removes all development mode limitations and allows the title to expand outside of test markets.

By default, every title created starts in development mode. The **My Studios and Titles** main page indicate which state a title is in through a mark on the bottom, left corner of the title block. This indicator can also be viewed at the top of the left nav within a title. Titles in development mode are labeled **Development**. Live titles are blank.

**My Studios view of development mode title tag**

![My Studios view of development mode title tag](pricingV2-media/development-mode-title-tag.png "My Studios view of development mode title tag")

**Title page view of development mode title tag**

![Title page view of development mode title tag](pricingV2-media/dev-mode-title-tag-titlePage.PNG "Title page view of development mode title tag")

**Live title with blank tag**

![Live title with blank tag](pricingV2-media/live-mode-title.PNG "Live title with blank tag")

> [!NOTE]
> As long as your title is in development mode, consumption isn't counted towards any of your billable meters.

The example below shows how meter consumption is reflected in the billing for a fictional customer called Fun Studios:

| Title | Title mode | Meter Consumption |
| --- | --- | --- |
| Fun Game | Live | 1 million PlayStream events |
| Fun Game 2: The Return of Fun | Development mode | 100,000 PlayStream events

When Fun Studios visits their Billing Summary page, they only see the consumption for their Live title, Fun Game, count against their Standard Plan included resources.

**For more information on these topics, check out these pages:**

- [Pricing Meters](Meters/meters.md)
- [Account Upgrades](account-upgrades.md)
- [Billing Summary and Base Rate](billingDetails.md)

## Limits

There are some studio and title limits associated with development mode:

### Studio limits

| Limit | Amount |
| --- | --- |
| Titles in Development mode | 10 Titles |

### Title limits

| Limit | Amount |
| --- | --- |
| Unique users | 100,000 users |
| PlayStream events | 1 million events |
| Telemetry events | 1 million events |
| Profile reads | 5 million reads |
| Profile writes | 1 million writes |
| Profile storage | 2 gigabytes (GB) |
| Entity statistics reads | 5 million reads |
| Entity statistics writes | 1 million writes |
| Entity statistics storage | 100 Stat definitions, versions = 1 |
| Entity leaderboard reads | 5 million reads |
| Entity leaderboard writes | 1 million writes |
| Entity leaderboard storage | 50 Leaderboard definitions, 10,000 rows, versions = 1 |
| Content and configuration reads | 20,000 reads |
| Content and configuration writes | 15,000 writes |
| Content and configuration storage | 2 GB |
| CloudScript execution time | 20,000 GB-s |
| CloudScript total executions | 200,000 executions |
| Insights credits | Insights Performance Level 1 |

**Definition of unique users:**
Unique users are the total number of players created in your title which is distinct from monthly active users or daily active users.

> [!NOTE]
> You can learn more about title limits at [PlayFab Pricing](https://www.playfab.com/pricing).
