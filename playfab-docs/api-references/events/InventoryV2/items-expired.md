---
title: items_expired
author: ernestoc
description: items_expired event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# items_expired

This event is triggered when items have expired in an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| EntityLineage | [EntityLineage](../data-types/entitylineage.md) | Entities that this entity is a child of. |
| OriginalEventId | String | The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from the EventId value, which is assigned when the event is received by the server. |
| OriginalTimestamp | DateTime | The original time (in UTC) associated with this event before it was posted to PlayFab. The value might differ from the Timestamp value, which is set at the time the event is received by the server. |
| Payload | [ItemsExpiredPayload](../data-types/itemsexpiredpayload.md) | The items expired event payload. |
| WriterEntity | [EntityKey](../data-types/entitykey.md) | Entity that wrote this event, included only if different than the event's entity. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
