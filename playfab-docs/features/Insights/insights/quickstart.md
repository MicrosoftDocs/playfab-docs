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

[//]: # (Numbers may change if the limits are raised.)

## Limits on telemetry events

You can send telemetry directly using the Playfab API call, [WriteTelemetryEvents](https://docs.microsoft.com/en-us/rest/api/playfab/events/playstream-events/writetelemetryevents?view=playfab-rest). The following limits exist for the API call:

* **200 events per request** to the WriteTelemetryEvents API. This is a hard limit and cannot be raised further.
* Title entities are restricted to **500,000 events per minute** and **900,000 events per 3 minutes**. If these limits are exceeded, you will see a PerEntityEventRateLimitExceeded error.
* The max payload size is **10204 bytes**.
* The limit on the number of API calls you can make to WriteTelemetryEvents is **8k per second**. It is very unlikely that you will exceed this limit. 
