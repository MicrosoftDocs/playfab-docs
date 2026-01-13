---
title: MonitoringOutputSavedEventPayload
author: valexao
description: MonitoringOutputSavedEventPayload data type.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MonitoringOutputSavedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The Guid string ID of the build.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|ServerId|String|The multiplayer server ID.|
|SessionId|String|The Guid string ID of the session.|
|VmId|String|The virtual machine ID the multiplayer server is located on.|
|IsVmLevel|bool|True if the monitoring output was not associated with a running server.|
