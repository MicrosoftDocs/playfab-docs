---
title: Churn Prediction Pricing
author: sranthar
description: PlayFab Churn Prediction Service pricing
ms.author: sranthar
ms.date: 03/16/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, churn prediction, AI, ML, predictive service 
ms.localizationpriority: medium
---

# Pricing for Player Churn Prediction

The algorithm used in Player Churn Prediction requires the most recent data to predict churn risk propensity accurately. There's one meter used to bill Player Churn Prediction - **Eligible Players.** Eligible Players are those who have logged into your game in the past 21 days. Using only the data for the past 21 days, we ensure that we aren't counting any inactive players. 

PlayFab identifies Eligible Players by ingesting the required Player Data, these players are then processed into the Machine Learning (ML) Pipeline to be scored and categorized into the appropriate risk groups. Once this operation is complete, the player count within the created segments is updated to reflect the current churn risk. These steps occur on a daily basis. This ensures that PlayFab is presenting the latest data to titles at all times.

Eligible Players is a **cumulative count** of all the players that have been processed to generate a churn Score until the current date. For example, if PlayFab identified 100,000 Eligible Players on Day 1 and 103,000 Eligible Players on Day 2, the title will then be charged for a cumulative count of 203,000 Eligible Players (100,000 + 103,000). 

You can view the current Player Churn Prediction rates at [PlayFab pricing](https://playfab.com/pricing).
