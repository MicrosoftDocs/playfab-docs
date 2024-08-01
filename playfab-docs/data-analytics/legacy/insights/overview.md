---
title: Insights
author: joannaleecy
description: Overview for PlayFab Insights
ms.author: joanlee
ms.date: 02/28/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, insights
ms.localizationpriority: medium
---
# What is PlayFab Insights?

> [!NOTE] 
> PlayFab Insights Management was deprecated on December 11th, 2023. We recommend using [Azure Data Explorer (ADX) Connections](../../export-data/data-connection-adx.md) to manage your performance and cost going forward. If your title is still using **Insights**, continue to see this article for feature details. For more information, see [Insights Deprecation Blog](https://developer.microsoft.com/en-us/games/articles/2023/09/playfab-insights-management-to-be-deprecated-starting-december-11/).

PlayFab Insights is a managed data environment, giving you instant access to your games data without the need for additional engineering. Unlike other hosted data solutions Insights requires no setup, no GDPR work, and no extra engineering. Simply use PlayFab services and your data is available. Automatically ingest and scale, connect external visualization tools, and query freely. 

## Key Features
Insights key features revolve around data cluster management, data retention, ingestion options, and connectivity to outside tools.

### Automatic Ingestion
PlayFab services automatically fire Playstream events. Any events fired by PlayFab services or created through our SDK are automatically routed to your Insights cluster. There's no need to worry about defining schema or DDL from automatic events. However, the option for sending your own custom events is available. For more information about sending custom events, see the [Custom event overview](../../ingest-data/playstream-overview.md) of Generating PlayStream events. 

### Change Your Performance Level To Meet Your Needs
![Insights Slider](media/insights-slider.png)

Match your cluster performance to your needs minute by minute. Slide your performance level up or down or alternatively schedule your cluster to have different performance levels automatically using scheduled tasks. See [Performance Level & Retention](performance-retention.md) for details.

### Schedule Your Performance Level
![Scheduled Scaling](media/insights-schedule.png)

Use standard cron expressions to automatically scale your cluster up and down during known times. See [Scheduled Scaling](scheduled-scaling.md) for details.

### Keep Your Data as Long as You Need
![Storage and Retention](media/insights-retention.png)

Never delete your data or clear your data out every 30 days, whatever is needed for your studio. See [Performance Level & Retention](performance-retention.md) for details.

### Connect Outside Tools
Connect Power BI or Grafana for visualization, automate data jobs with Python or Azure Data Factory, explore your data with Azure Data Explorer. See [Connectivity](../connectivity/index.md) for details.

### Export Original or Cleaned Data
Use the automated export service to export all your data to Azure Blob or AWS S3. See [Exporting Data](../insights/export.md) for details.

### Bring Your Own Datasets
Ingest your own custom datasets with [Management Commands](../insights/management-commands.md). Merge your custom Playstream events, standard Playstream events, and custom uploaded data to create more robust datasets.

### GDPR Compliant
Standard reporting is tracked and GDPR compliant. Call the playfab GDPR delete request and we'll do the rest. Have custom data you need to delete? No problem, use the [Management Commands](../insights/management-commands.md) to maintain your custom data.

## Getting Started with PlayFab Insights
PlayFab Insights is available to all studios right out of the box. The only thing needed to get started is some data. Implement any PlayFab service and you get playstream events automatically sent to your *Insights* or you [can send telemetry directly using PlayFab API calls](xref:titleid.playfabapi.com.events.playstreamevents). Once you have some data check out [Data Explorer](../../export-data/data-connection-quickstart.md).

## What services are powered by Insights?
PlayFab Insights powers various features and functionality across Game Manager. Adjusting the performance level affects the following across your title:
* Data
  * Data Explorer (Preview)
  * Event Export
  * Management (Preview)
* Dashboards
  * Trends (Preview)
  * Reports
* Players
  * Player Logins
  * Player Event History
* Multiplayer
  * Party Usage Charts
