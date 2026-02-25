---
title: title_addon_changed
author: ronnyparedes
description: title_addon_changed event.
ms.author: ronnyparedes
ms.date: 02/06/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# title_addon_changed

This event is triggered when a marketplace AddOn is installed, or changes state.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AddOnId|String|Unique identifier of the AddOn affected.|
|AddOnName|String|Name of the AddOn affected.|
|DeveloperId|String|Developer/Studio ID.|
|State|[AddOnProvisioningState](../data-types/addonprovisioningstate.md)|Current state of the AddOn. Values include Inactive, Paused, Active, Pending, and PendingWithError.|
|UserId|String|May be null if user is unknown (Admin API, partner source).|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
