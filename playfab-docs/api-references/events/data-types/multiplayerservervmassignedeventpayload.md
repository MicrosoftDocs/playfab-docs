---
title: MultiplayerServerVmAssignedEventPayload
author: joannaleecy
description: MultiplayerServerVmAssignedEventPayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MultiplayerServerVmAssignedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AssignmentEventTimestamp|DateTime|The time (UTC) the virtual machine was assigned.|
|BillingAssignmentCorrelationId|String|The guid string ID of the billing assignment.|
|BuildId|String|The guid string ID of the build.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|SessionId|String|The guid string ID of the session.|
|VmId|String|The ID of the virtual machine that was assigned.|
