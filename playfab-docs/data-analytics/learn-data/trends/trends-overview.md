---
title: Trends
author: sofiamarinv
description: Trends overview
ms.author: sofiamarin
ms.date: 11/08/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, trends
ms.localizationpriority: medium
---

# Trends overview

The Trends feature is a collection of graphical representations of game analytics key performance analytics (KPIs) metrics that acts as your gateway to valuable insights and strategic decision-making. 

Simply navigate to the Dashboard section of the Analyze Tab in Game Manager to view industry–standard metrics about your game. 

Trends allows you to evaluate daily historical performance across six KPIs including daily & monthly active players, new players, screentime, retention, and revenue. You can effortlessly compare different time periods from as short as one week to a full 6 months, enabling you to measure the impact of your efforts and make data-driven decisions. 
With the ability to break down KPIs by platform and region and segments as dimensions, you can identify top performers, focus on strategic markets, and uncover areas for improvement. 

## Trends metrics

**Active Players**
- **Daily Active Players (DAU)**: Number of unique players seen in the game per day based on the [player_logged_in](../../../api-references/events/player-logged-in.md) event. 
- **Monthly Active Players (MAU) Rolling 30**: Number of unique players seen in the game during the span of the last 30 days based on the [player_logged_in event](../../../api-references/events/player-logged-in.md) event. 

**New Players** 
- **New Players**: The number of players that were seen in the game for the first time based on the [player_added_title](../../../api-references/events/player-added-title.md) event. 

**Screen Time**
- **Average Duration**: Average length of time that a player has the game on screen and in focus per day. This is based on the [client_focus_change](../../../api-references/events/client-focus-change.md) event. 
- **Average On-Screen** Intervals: Average number of times a player has the game on screen and in focus per day. This is based on the [client_focus_change](../../../api-references/events/client-focus-change.md) event. 

**New User Retention**
- **Nth Day New User Retention (Classical Retention)**: Percentage of players seen specifically on the Nth Day after they first played the game based on the [player_added_title](../../../api-references/events/player-added-title.md) and [player_logged_in](../../../api-references/events/player-logged-in.md) events. 

**Transaction Revenue**  
- **Revenue**: Total revenue (USD) per day generated from in-app purchases that use the PlayFab economy APIs. This is based on the [player_realmoney_purchase](../../../api-references/events/player-realmoney-purchase.md) event.

## See also

[Segmentation overview](../../acting-data/segmentation-overview.md)

