---
title: apikey_activated
author: ronnyparedes
description: apikey_activated event.
ms.author: ronnyparedes
ms.date: 02/09/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# apikey_activated

This event is triggered when an API key is activated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|OriginalEventId|String|The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from the EventId value, which is assigned when the event is received by the server.|
|OriginalTimestamp|DateTime|The original time (in UTC) associated with this event before it was posted to PlayFab. The value might differ from the Timestamp value, which is set at the time the event is received by the server.|
|Payload|[APIKeyActivatedPayload](../data-types/apikeyactivatedpayload.md)|The payload of this event.|
|WriterEntity|[EntityKey](../data-types/entitykey.md)|The entity that wrote this event, included only if different from the entity specified on the event.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
