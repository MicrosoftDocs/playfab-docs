---
title: VmUnhealthyEventPayload
author: joannaleecy
description: VmUnhealthyEventPayload data type.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# VmUnhealthyEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The guid string ID of the build.|
|HealthStatus|String|The health status of the virtual machine.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|VmId|String|The ID of the unhealthy virtual machine.|
