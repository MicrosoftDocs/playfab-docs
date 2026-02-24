---
title: access_policy_updated
author: ronnyparedes
description: access_policy_updated event.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# access_policy_updated

This event is triggered when a profile access policy has been updated.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AccessPolicy|String[]|The new access policy statements.|
|Operation|[OperationTypes](../data-types/operationtypes.md)|The type of operation that was performed on the access policy.|
|PreviousAccessPolicy|String[]|The previous access policy statements.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
