---
title: Churn Prediction Quickstart
author: sranthar
description: PlayFab Churn Prediction Quickstart
ms.author: sranthar
ms.date: 03/16/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, churn prediction, AI, ML, predictive service 
ms.localizationpriority: medium
---

# Player Churn Prediction quickstart 

## Prerequisites

1. Sign in to [PlayFab portal](https://playfab.com).
2. Navigate to your title.

## Create a Churn Prediction segment and apply mitigation strategy

**Note** - Churn Prediction segments can only be created 48 hours after the feature has been enabled for the title.

1. On the **Players** page, select the **Segments** tab at the top.
2. Select **New Segment.**
3. Enter a descriptive name as the **Segment name.** For example, "MyChurnPredictionSegment".
4. Under **Players**, select **Churn Prediction** and then select **High Risk** as the churn category.
![Create a Segment Screenshot](media/CreateChurnSegment.png)

5. **Actions**, select **Add Action.**
![Create an Action](media/ActionsPane.png)

6. For **Type,** select **Grant Virtual Currency.** </br>
   For **Virtual currency code,** select **GC (Game Coins).** </br>
   For **Amount,** enter **50** as the amount you would like to grant to the player. </br>
![Grant Virtual Currency](media/GrantCoins.png)

7. Navigate back to **Segments** page to see your newly created churn segment and the count of players within that segment.

You've successfully created a player segment for high-risk churn players and applied a mitigation strategy to reduce churn rate and retain your players.
