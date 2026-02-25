---
title: client_request_failed
author: raulalbertog
description: client_request_failed event.
ms.author: raulalbertog
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# client_request_failed

This event is triggered when a client request fails.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|ClientInstanceId|String|The client-generated globally unique identifier of this instance of the Party library.|
|RequestType|String|The type of the request that failed.|
|HttpStatusCode|int32|The HTTP status code of the failed request.|
|HttpStatusString|String|The HTTP status string of the failed request.|
|PlayFabErrorCode|int32|The PlayFab error code.|
|ErrorName|String|The PlayFab error name.|
|ErrorMessage|String|The PlayFab error message.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
