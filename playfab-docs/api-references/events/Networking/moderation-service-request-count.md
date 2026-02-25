---
title: moderation_service_request_count
author: raulalbertog
description: moderation_service_request_count event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# moderation_service_request_count

This event is triggered when moderation service request count is reported.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LoginIdentityProvider|String|The identity provider used for login.|
|RegionName|String|The region name associated with the relay.|
|DataSizeInBytes|uint64|The total count of moderation service requests.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
