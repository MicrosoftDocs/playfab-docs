---
title: Churn Prediction Overview
author: sranthar
description: PlayFab Churn Prediction Service Overview
ms.author: sranthar
ms.date: 03/16/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, analytics, churn prediction, AI, ML, predictive service 
ms.localizationpriority: medium
---

# Churn Prediction

Identifying churn is a key metric to reduce player attrition and increase engagement. Churn has a direct impact on revenue because players leave or stop playing a game at a certain point after playing. To provide the ability to identify and mitigate churn, PlayFab is introducing its first Azure Artificial Intelligence (AI) and Machine Learning (ML) based Predictive Service. Directly integrated into Segmentation and with no additional integration required from Titles, Churn Prediction can be easily enabled via Game Manager.

PlayFab will consume different datapoints from Player Profile and PlayStream events and determine from the list of **Eligible Players** who are likely to **Churn** within the next **Churn Window**.

Let’s define some key terms used above:

- **Eligible Players** – Players who have logged in within the past 21 days. To ensure accurate predictions, only Eligible Players are considered and scored for predictions.
- **Churn** – Indicator of whether a player would stop playing within the next churn Window.
- **Churn Window** – Specific period during which players are expected to churn based on their Risk Propensity. This parameter is set to seven days and is non configurable at this time.

This feature is presented as **Churn Prediction** within the Segmentation Filters dropdown. Titles can further define their Segments via churn risk Factors of Low/Medium/High with other Segmentation Filters as well. Once the required Segments have been created, Mitigation Strategies can be applied via **Segment Actions** directly from the Segmentation page to reduce churn as much as possible.

## Opt in/out of Churn Prediction

Churn Prediction is a paid, premium feature that must be explicitly opted into from Game Manager. Once opted in, it takes **48 hours** for the required data to be collected, ingested and scores to be computed and generated before segments can be created. The Churn Prediction filter will only appear within the Segmentation filter dropdown once the scores are generated in the backend.

### Prerequisites

- Ensure your billing information is up to date prior to opting into the feature.

### Opt into Player Churn Prediction

1. Navigate to your **Title**
2. Select **Players** from the menu on the left
3. Move to the **Segments** Tab above
4. Opt into Churn Prediction clicking on **Activate Player Churn**
 ![Activate Player Churn](media/ActivatePlayerChurnButton.png)

5. On the official Churn Activation page, select the blue **Activate Player Churn** button
 ![Official Player Churn Activation](media/OfficialPlayerChurnActivationPage.png)

### Opt-Out of Player Churn Prediction

Prior to opting out, please ensure to **Modify** or **Delete** any Segments that use the Churn Prediction Filter.

**Note** - The 48 hours lead time is applicable if a title were to opt in again after opting out.

1. Navigate to your **Title**
2. Select **Players** from the menu on the left
3. Move to the **Segments** Tab above
4. Delete or modify any existing segments with the Churn Filter prior to deactivation
 ![Modify/Delete Segments prior to Deactivation](Media/Modify-DeleteSegments.png)
5. Opt out of Churn Prediction by selecting **Deactivate Player Churn**
![Deactivate Player Churn Button](media/UpdatedDeactivateButton.png)
6. Confirm your action by selecting **Confirm Player Churn Deactivation**
![Confirm Player Churn Deactivation Button](media/UpdatedConfirmDeactivationButton.png)

## Mitigation Strategies

Once churn has been identified, the next step to re-engage and retain your players is to apply Mitigation Strategies. With Segmentation Actions, the required steps can be configured while creating the segment itself.

These actions apply to all players real-time. A few of the actions that are offered directly out of the box are:

- Send Push Notifications: Targeted promotions can be sent on iOS and Android platforms.
- Send Emails: Custom Email Templates can be created to invite players to exclusive sales or sneak peek access to new levels/content.
- Grant Items/Coins: Personalized rewards such as granting Virtual Currency or Catalog Items.

If above actions aren't applicable or don't suffice, Titles can always create customized solutions via [CloudScript using Azure Functions](../../../features/automation/cloudscript-af/index.md).

## See also

* [Churn Prediction quickstart](churn-prediction-quickstart.md)
