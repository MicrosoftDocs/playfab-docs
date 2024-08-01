---
title: Telemetry Keys QuickStart
author: sofiamarinv
description: How to create Telemetry Keys in Game Manager
ms.author: sofiamarin
ms.date: 10/13/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, simplified authentication telemetry, telemetry keys, quickstart
ms.localizationpriority: medium
---

# Telemetry Keys quickstart

## Creating Telemetry Keys in Game Manager

- Sign in to [Game Manager](https://developer.playfab.com/en-US/login).
- Go to **My Studios and Titles** page and select your game title to display the dashboard.
- Select **Data** from the menu on the left.
- Select the **Telemetry Keys** tab.
- Select **New telemetry key**.
- Fill the **Key** field. 
- Select **Create telemetry key**.

Here is an example of how the newly created Telemetry Key should look like:

![New telemetry key](media/new-telemetry-key.png)

Once the Telemetry Key has been created, you can use it from your game client when calling [WriteTelemetryEvents API](/rest/api/playfab/events/play-stream-events/write-telemetry-events) by including it via HTTP header X-TelemetryKey as called out in the Overview page. You can look at an example here: [Telemetry Keys Overview](telemetry-keys-overview.md) in the Section **Specifying Entities for Events**s