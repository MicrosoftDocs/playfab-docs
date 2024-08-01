---
title: Telemetry 
author: sofiamarinv
description: Telemetry Overview
ms.author: sofiamarin
ms.date: 01/29/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, telemetry, ingestion, playstream
ms.localizationpriority: medium
---

# Telemetry

Telemetry is a feature of PlayFab that allows you to send [UserGenerated Events](playstream-events.md) to PlayFab. It's an optimized system that skips real-time processing and sends the events directly to the telemetry pipeline.

Telemetry is useful for recording things that are happening inside your game, without the need of immediately reacting to them. For example, if you want to record crash logs, performance metrics, user behavior, or do near-real-time reporting about your game. 

To use telemetry, you can send events to PlayFab by using the [WriteTelemetryEvents](/rest/api/playfab/events/play-stream-events/write-telemetry-events) API, which will allow you to see them in the Data Explorer and receive them in your own storage via [Data Connections](../export-data/data-connection-overview.md). 

Some benefits of using Telemetry include:

1. Telemetry skips all the real-time processing, making it cost-effective.

2. There are softer limits on the number of events you can send via Telemetry.

3. Telemetry allows up to 10-KB payloads.

4. Telemetry provides a different authentication mechanism via [Telemetry Keys](telemetry-keys-overview.md), which allows you to use telemetry without using the entity authentication system.

## See also

[Telemetry Keys overview](telemetry-keys-overview.md)
[Telemetry Keys quickStart](telemetry-keys-qs.md)


