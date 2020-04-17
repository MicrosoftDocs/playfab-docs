---
title: Insights Quickstart
author: john-smith-microsoft
description: Quickstart for PlayFab Insights 
ms.author: johsmi
ms.date: 03/20/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights, quickstart
ms.localizationpriority: medium
---

# Getting Started with PlayFab Insights
PlayFab Insights is available to all studios right out of the box. The only thing needed to get started is some data. Implement any PlayFab service and you will get playstream events automatically sent to your *Insights* or you [can send telemetry directly using PlayFab API calls](https://docs.microsoft.com/rest/api/playfab/events/playstream-events?view=playfab-rest). Once you have some data checkout [Explorer](https://docs.microsoft.com/gaming/playfab/features/insights/explorer/quickstart) and the [Insights Overview](https://docs.microsoft.com/gaming/playfab/features/insights/insights).

[//]: # (We are still discussing raising the limits, so numbers may change.)

## Limits on telemetry events

You can send telemetry directly using the Playfab API call, [WriteTelemetryEvents](https://docs.microsoft.com/rest/api/playfab/events/playstream-events/writetelemetryevents?view=playfab-rest). The following limits exist for the API call:


| Limit Name | Limit Value |
|--|--|
| Events per request | 200 events per request <br> *Exceeding this limit will result in a BadRequest error.* |
| Number of calls per entity | 8,000 per second |
| Events per title entity | 500,000 events per minute <br> 900,000 events per 3 minutes <br> *Exceeding these limits will result in a PerEntityEventRateLimitExceeded error.* | 
| Max payload size  | 10240 bytes (10KB) |
