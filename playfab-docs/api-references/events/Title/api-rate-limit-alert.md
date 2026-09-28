---
title: api_rate_limit_alert
author: dgkanatsios
description: api_rate_limit_alert event.
ms.author: digkanat
ms.date: 09/24/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events, throttling
ms.localizationpriority: medium
---

# api_rate_limit_alert

> [!NOTE]
> This event is in preview. Its payload, behavior, and availability might change.

This event can be triggered when an API caller approaches or reaches a rate limit. A warning is currently raised at 80% of the limit, but this threshold, like other details of the event, might change. An alert is raised the first time usage crosses the warning threshold (`Warning`) or the limit itself (`HardLimit`) within a tracking period, not on every call after that. To tell whether calls are being throttled, use HTTP 429 responses. You can query it in Game Manager **Data Explorer**. For more information about rate limits, see [Throttling in PlayFab](../../../live-service-management/service-gateway/throttling/what-is-throttling.md).

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|API|String|The PlayFab API that was called. For example, `client/gettime`.|
|CallerEntityType|String|The type of entity that made the call. For example, `title_player_account` or `title`.|
|CallerEntityId|String|The ID of the entity that made the call. Might be omitted or masked.|
|Crossings|object[]|The rate limits that the call approached or reached. In each entry, `CrossingType` is `Warning` when a limit is being approached or `HardLimit` when it's reached, and `LimitKind`, `TrackingPeriod`, and `Limit` describe the limit. Entries for limits on a target entity also include `TargetEntityType` and `TargetEntityId`, and that ID might be omitted or masked.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
