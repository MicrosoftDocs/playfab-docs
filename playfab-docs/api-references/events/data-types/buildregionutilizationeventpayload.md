---
title: BuildRegionUtilizationEventPayload
author: valexao
description: BuildRegionUtilizationEventPayload data type.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# BuildRegionUtilizationEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The guid string ID of the multiplayer server build that regions were updated on.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|Active|Int|The number of active servers.|
|StandingBy|Int|The number of standingby servers.|
|Propping|Int|The number of servers still downloading game resources.|
|Total|Int|The total number of servers.|
|VmCount|Int|The total number of running virtual machines.|
