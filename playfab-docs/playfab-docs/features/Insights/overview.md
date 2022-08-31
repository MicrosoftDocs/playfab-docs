---
title: Insights
author: mckmoffatt
description: Overview for PlayFab Insights
ms.author: mcelliot
ms.date: 02/28/2020
ms.topic: article
ms.prod: playfab
keywords: playfab, insights
ms.localizationpriority: medium
---
# What is PlayFab Insights?

> [!NOTE] 
> The PlayFab Insights feature is in public preview. We anticipate ongoing changes to it as we continue gathering feedback and optimizing for customer use.

PlayFab Insights is a completely managed data environment, giving you instant access to your games data without the need for additional engineering. Unlike other hosted data solutions Insights requires no setup, no GDPR work, and no extra engineering. Simply use PlayFab services and your data is available. Automatically ingest and scale, connect external visualization tools, and query freely. 

## Key Features
Insights key features revolve around data cluster management, data retention, ingestion options and connectivity to outside tools.

### Automatic Ingestion
PlayFab services automatically fire Playstream events. Any events fired by PlayFab services or created through our SDK are automatically routed to your Insights cluster. There is no need to worry about defining schema or DDL from automatic events. However, the option for sending your own custom events is available. For more information about sending custom events, see the [Custom event overview](../analytics/metrics/playstream-events.md#custom-event-overview) of Generating PlayStream events. 

### Change Your Performance Level To Meet Your Needs
![Insights Slider](data-explorer/media/insights-slider.png)

Match your cluster performance to your needs minute by minute. Slide your performance level up or down or alternatively schedule your cluster to have different performance levels automatically using scheduled tasks. See [Performance Level & Retention](performance-retention.md) for details.

### Schedule Your Performance Level
![Scheduled Scaling](data-explorer/media/insights-schedule.png)

Use standard cron expressions to automically scale your cluster up and down during known times. See [Scheduled Scaling](scheduled-scaling.md) for details.

### Keep Your Data as Long as You Need
![Storage and Retention](data-explorer/media/insights-retention.png)

Never delete your data or clear your data out every 30 days, whatever is needed for your studio. See [Performance Level & Retention](performance-retention.md) for details.

### Connect Outside Tools
Connect PowerBI or Grafana for visualization, automate data jobs with Python or Azure Data Factory, explore your data with Azure Data Explorer.  See [Connectivity](connectivity/index.md) for details.

### Export Original or Cleaned Data
Use the automated export service to export all your data to Azure Blob or AWS S3. See [Exporting Data](export.md) for details.

### Bring Your Own Datasets
Ingest your own custom datasets with [Management Commands](management-commands.md). Merge your custom Playstream events, standard Playstream events, and custom uploaded data to create more robust datasets.

### GDPR Compliant
Standard reporting is tracked and GDPR compliant. Simply call the playfab GDPR delete request and well do the rest. Have custom data you need to delete? No problem, use the [Management Commands](management-commands.md) to maintain your custom data.

## Getting Started with PlayFab Insights
PlayFab Insights is available to all studios right out of the box. The only thing needed to get started is some data. Implement any PlayFab service and you will get playstream events automatically sent to your *Insights* or you [can send telemetry directly using PlayFab API calls](xref:titleid.playfabapi.com.events.playstreamevents). Once you have some data check out [Data Explorer](data-explorer/quickstart.md) and the [Insights Overview](index.yml).

## What Services are Powered by Insights?
PlayFab Insights powers a variety of features and functionality across Game Manager. Adjusting the performance level will affect the following across your title:
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
