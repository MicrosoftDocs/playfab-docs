---
title: Insights pricing
author: joannaleecy
description: Overview for PlayFab Insights Pricing
ms.author: joanlee
ms.date: 02/28/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights, archive
ms.localizationpriority: medium
---

# Insights pricing

> [!NOTE]
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for pricing details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

The total combined usage of Insights features are billed in a virtual currency called "Insights Credits". Insight Credits are derived from conversion rates for usage of each Insight services.

The Standard and Premium pricing plans include a number of free monthly Insights credits. If usage exceeds the number of free credits, any additional credits are billed at the rate specified on your plan. The Pay-as-you-go pricing plan does not include free credits, so each credit is billed at the rate specified in the plan. For more information on the number of free credits and additional credit rates included in each plan, see [PlayFab pricing](http://playfab.com/pricing).

## Insights Performance
Each title is set to a chosen performance level that is billed to the minute (Insights Credits Per Hour / 60). The cost in credits for each performance level is located at the bottom of the table on the Insights Management page:
![Insights Slider](media/performance-level2.png)

> [!IMPORTANT] 
> All MAU-based pricing plans will be converted to a usage-based pricing plan on 11/01/2020. As part of the transition, a small number of titles will be placed on a paid Insights Performance level to maintain their current functionality. However, if a title would like to reduce the performance level (and thus cost) while also accepting a decrease in performance, the performance level can be adjusted on the Insights Management page in Game Manager using the above table. 


## Retention
Data retention is billed in Terabyte months. Every day the end of day storage size is recorded and averaged over the month. Each terabyte is billed at 50 credits per terabyte month. For example, if a studio stored 1 terabyte of data every day for a month, the total would be 1 TB/Month * 50 Credits = 50 Credits.

## Pricing example

Below is an example scenario illustrating how one month of Insights billing is calculated for a studio:

In April, a studio used performance level 4 from 9AM to 5PM each weekday and scaled down to performance level 2 at nights and on weekends. April has 21 weekdays and 9 weekend days, which works out to: 
* 21 days at performance level 4, for 8 hours
* 21 days at performance level 2, for 16 hours
* 9 days at performance level 2, for 24 hours

The credit rate per hour for each of these levels is:
* performance level 2 = 1 credits/hour
* performance level 4 = 4 credits/hour

The total monthly charge for Insights Performance is calculated as: 

21 (days) * 8 (hours) * 4 (credits per hour at performance level 4) + 21 (days) * 16 (hours) * 1 (credits per hour at performance level 2) + 9 (days) * 24 (hours) * 1 (credits per hour at performance level 2) = 1,224 credits for the month.

Starting the month with no stored data, the studio added 1 TB of data every other day for 30 days. At the end of the month they averaged 15 TBs of data over the month. The total monthly charge for data retention is calculated as:

15 TB * 50 Credits per TB/month = 750 Credits for the month.

Thus, the studio's total monthly cost for Insights performance and data retention is 1,974 credits.

## Row Write Overages   
Each Insights Performance level has an allotted number of writes per second to the data cluster. For customers not in development mode, going beyond the number of row writes for your performance level triggers row write overages instead of event throttling. Row write overages are charged at 1 credit per 2.7 million (2,700,000) rows written. This pricing is designed to allow for specific ingestion scenarios where it may be more cost effective to have row write overages instead of raising the Insights performance level.  
