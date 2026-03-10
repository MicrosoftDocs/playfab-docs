---
title: data_sent_by_clients
author: raulalbertog
description: data_sent_by_clients event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# data_sent_by_clients

This event is triggered when data is sent by clients.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|LoginIdentityProvider|String|The identity provider used for login.|
|RegionName|String|The region name associated with the relay.|
|DataSizeInBytes|uint64|The total data size in bytes sent by clients to the cloud service.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
