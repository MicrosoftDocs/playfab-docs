---
title: Explorer
author: john-smith-microsoft
description: Overview for PlayFab Explorer
ms.author: john-smith-microsoft
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---
---
Introduction & Overview
Performance Level & Retention
Scheduled Scaling
Best Practices & FAQ
Connectivity
Export

---
# PlayFab Insights

> <br>
> The PlayFab Insights feature is in public preview. We anticipate ongoing changes to it as we continue gathering feedback and optimizing for customer use.

## What is PlayFab Insights?
PlayFab Insights is a completely managed data environment, giving you instant access to your game's data without the need for additional engineering. Unlike other hosted data solutions Insights requires no setup, no GDPR work, no extra engineering, simply use PlayFab services and your data is available. Automatically ingest and scale, connect external visualization tools and query freely. This represents a huge improvement to our previous data offering.

## Key Features
### Automatic Ingestion
PlayFab services automatically fire Playstream events. Any events fired by PlayFab services or created through our SDK are automatically routed to your Insights cluster. There is no need to worry about defining schema or DDL from automatic events. However, the option for sending your own custom events [is available]('https://docs.microsoft.com/en-us/gaming/playfab/features/analytics/metrics/playstream-events#custom-event-overview').

### Change Your Performance Level To Meet Your Needs
![Insights Slider](media/insights-slider.png)<br>
Match your cluster performance to your needs minute by minute. Slide your performance level up or down or alternative schedule your cluster to have different performance levels automatically using scheduled tasks.

### Schedule Your Performance Level
![Insights Slider](media/insights-schedule.png)<br>
Use standard cron expressions to automically scale your cluster up and down during known times.

