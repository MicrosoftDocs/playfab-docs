---
title: VmStateChangeEventPayload
author: valexao
description: VmStateChangeEventPayload data type.
ms.author: vorelien
ms.date: 12/10/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# VmStateChangeEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The guid string ID of the multiplayer server build that regions were updated on.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|VmId|String|The virtual machine ID of the multiplayer vm.|
|State|String|The multiplayer virtual machine's state to report on.|
|DurationSeconds|ulong|The amount of time spent getting to this state.|
