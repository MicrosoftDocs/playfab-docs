---
title: client_focus_change
author: joannaleecy
description: client_focus_change event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_focus_change

This event is triggered every time the application enters or exits focus on the player's device.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|OriginalEventId|String|The original unique identifier associated with this event before it was posted to PlayFab. The value might differ from the EventId value, which is assigned when the event is received by the server.|
|OriginalTimestamp|DateTime|The original time (in UTC) associated with this event before it was posted to PlayFab. The value might differ from the Timestamp value, which is set at the time the event is received by the server.|
|Payload|[ClientFocusChangePayload](../data-types/clientfocuschangepayload.md)|Payload that this entity is a child of.|
|WriterEntity|[EntityKey](../data-types/entitykey.md)|Entity that wrote this event, included only if different than the event's entity.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
