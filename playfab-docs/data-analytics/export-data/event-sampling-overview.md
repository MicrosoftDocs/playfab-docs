---
title: Manage Events with Sampling 
author: shikha-tarware
description: Overview of Manage Events with Sampling 
ms.author: shtarwar
ms.date: 11/17/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, sampling, manage events, playstream
ms.localizationpriority: medium
---

# Manage Events

## Overview
PlayFab **Manage Events** feature helps you configure the percentage of events data that you want to receive in the title tenant database. 
By default, all PlayStream and Telemetry (custom) events are stored. However, in some situations, you might want to retrieve only a sample set of events. To achieve that, use Manage Events with Sampling rate. 

### Benefits of Manage Events

Sampling leads to a reduction of the volume of the total event, particularly benefitting you with below in a controlled and flexible manner:
- Reduced cost of storage on your title tenant database
- Increased performance of event searches 
- Easy data exploration to determine the characteristics of a large data set 
- Uncompromised validation of the data format, statistical calculations, and other analysis without any loss of data fidelity 

### Sampling Ratio

The sampling ratio is the probability percentage of any event being included in the sample result set. It ranges from 0% to 100%. By default, event sampling isn't active, meaning the sampling rate is set to 100%, and every event of the title is ingested and stored into the title tenant database.

![Screenshot of Manage Events Overview](media/sampling-overview.png "Manage Events with Samomg") 

### Data Analysis on Sampled Data
For statistical true data analysis, examined the data by ensuring a correlated scale as of the sampling rate of the event(s). 

When you calculate statistics using a sample set of events, the statistical values won't be accurate. To get the most accurate statistical value approximation, you must scale the values to the corelated sampling ratio. Because when you use sampling, the returned set isn't the complete set of all of the events. 

> [!Note]
> Commands for statistical calculations that might be difficult to interpret when event sampling is used, like count, summarize, max, min, and more. 
