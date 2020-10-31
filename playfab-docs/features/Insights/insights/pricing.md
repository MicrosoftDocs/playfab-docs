---
title: Insights Pricing
author: mckmoffatt
description: Overview for PlayFab Insights Pricing
ms.author: mcelliot
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, archive
ms.localizationpriority: medium
---

# Insights Pricing
All Insights features are billed in a virtual currency called "Insights Credits". For more information about the cost of Insights Credits, see [PlayFab Pricing](http://playfab.com/pricing). 

## Insights Performance
Each performance level for insights is billed to the minute (Insights Credits Per Hour / 60). The cost in credits for each performance level is located at the bottom of the table on the Insights Management page:
![Insights Slider](media/performance-level2.png)

> [!NOTE] 
> All MAU-based pricing plans will be converted to a usage-based pricing plan on 11/1/2020. As part of the transition, each title will be placed on an Insights performance level based on their current usage rates. Playfab has calculated the optimal performance level for a title in order to maintain its current functioning. However, if a title would like to reduce the performance level (and thus cost) while also accepting a decrease in performance, the performance level can be adjusted on the Insights Management page in Game Manager. 

### Retention
Retention is billed in Terabyte months. Each day max data size is recorded and averaged over the month. Each terabyte is billed at 50 credits per terabyte month. For example, if a studio stored 1 terabyte of data every day for a month, the total would be 1 TB/Month * 50 Credits = 50 Credits.

**Example:**
In April, a studio used performance level 4 from 9AM to 5PM each weekday and scaled down to performance level 2 at nights and on weekends. Aprile has 21 weekdays and 9 weekend days. that's 21 days with 8 hours are performance level 4, 21 days with 16 hours of performance level 2, and 9 days of 24 hours at performance level 2. Performance level 2 is 1 credit per hour and performance level 4 is 4 credits per hour. This means that the total monthly charge for Insights Performance = 21 (days) * 8 (hours) * 4 (credits per hour at performance level 4) + 21 (days) * 16 (hours) * 1 (credits per hour at performance level 2) + 9 (days) * 24 (hours) * 1 (credits per hour at performance level 2) = 1,224 credits for the Insights performance. 

If the same studio started with no data and added 1 TB of data per day each day for 30 days. At the end of the month they would average 15 TBs of data over the month. 15 TB * 50 Credits per TB/month = 750 Credits.

This makes the studios total monthly cost to be 1,974 credits for Insights performance and data retention.

Pricing details for credits can be found at [Pricing Details](http://playfab.com/pricing).

## Row Write Overages   
Each Insights Performance level has an allotted number of writes per second to the data cluster. For customers not in developer mode, going beyond the number of row writes for your performance level triggers row write overages instead of event throttling. Row write overages are charged at 1 credit per 2.7 million (2,700,000) rows written. This pricing is designed to allow for specific ingestion scenarios where it may be more cost effective to have row write overages instead of raising the Insights performance level.  