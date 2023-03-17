---
title: Churn Prediction
author: sravya-antharam
description: PlayFab Churn Prediction Service Overview
ms.author: sranthar
ms.date: 03/16/2023
ms.topic: article
ms.service: playfab
keywords: playfab, analytics, churn prediction, AI, ML, predictive service 
ms.localizationpriority: medium
---

# Churn Prediction - Public Preview

## Overview

Identifying Churn is a key metric to reduce player attrition and increase engagement. In addition, Churn has direct impact on Revenue when players leave a game. To provide the ability to identify and mitigate Churn, PlayFab is introducing its very first Azure AI/ML based Predictive Service. Directly integrated into Segmentation and with no additional integration required from Titles, Churn Prediction can be easily enabled via Game Manager.

PlayFab will consume different datapoints from Player Profile and PlayStream events and determine from the list of **Eligible Players** who are likely to **Churn** within the next **Churn Window.** 

Let’s define some key terms used above: 
- **Eligible Players** – Players who have logged in within the past 7 days. To ensure accurate predictions, only Eligible Players will be considered and scored for predictions.   
- **Churn** – Is an indicator of whether a player would stop playing within the next Churn Window.
- **Churn Window** – Is the specific period during which players are expected to Churn based on their Risk propensity. This parameter is currently set to 7 days and is non configurable at this time. 

This feature will be presented as **Churn Prediction** within the Segmentation Filters dropdown. Titles can further define their Segment via Churn Risk Factors of Low/Medium/High and in conjunction with other Segmentation Filters as well. Once the required Segments have been created, Mitigation Strategies can be applied via **Segment Actions** directly from the Segmentation page. 

## Opt in/out of Churn Prediction

Churn Prediction is a paid, premium feature that must be explicitly opted into within the Segmentation pane. Once opted in, it takes **48 hours** for the required data to be collected, ingested and scores to be computed and generated before segments can be created. 

### Pre-Requisites 

1. Ensure to update your billing info prior to opting into Churn Prediction. 

### Opt into Player Churn 
1.	Navigate to your **Title**
2.	Select **Players** from the menu on the left
3.	Move to the **Segments** Tab above
4.	Opt into Churn Prediction clicking on **Activate Player Churn**
 
5.	On the official Churn Activation page, select the blue **Activate Player Churn**

### Opt-Out of Player Churn
To opt out of Player Churn, all Segments that have been created using the Churn Prediction Filter, have to be modified to remove that filter or delete the segment entirely before you can disable player churn for the title.

**Note** - If you would like to opt in again after opting out, we would still require the 48 hour lead time to Ingest data and Generate Churn Scores.

1.	Navigate to your **Title**
2.	Select **Players** from the menu on the left
3.	Move to the **Segments** Tab above
3.	Opt out of Churn Prediction by selecting **Deactivate Player Churn**


## Mitigation Strategies
Once Churn has been identified, the next step to re-engage and retain your players is to apply Mitigation Strategies. With Segmentation Actions,the requried steps can be configured while creating the Segment. These actions will apply to all players real-time as they jump in and out of Segments. Some of the Actions that are offered directly out of the box are – 
-	Send Push Notifications – Targeted Promotions via ios or Andriod. 
-	Send Emails – Custom Email Templates to invite players to Exclusive Sales or Sneak Peak access to new levels/content.
-	Grant Items/Coins – Personalized rewards such as granting Virtual Currency or Catalog Items.

If above actions are not applicable or do not suffice, Titles can always creat customized solutions via Azure Functions.

 
