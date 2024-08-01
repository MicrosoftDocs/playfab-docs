---
title: MultiplayerServerVmUnassignmentStartedEventPayload
author: joannaleecy
description: MultiplayerServerVmUnassignmentStartedEventPayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MultiplayerServerVmUnassignmentStartedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|AssignmentDurationMs|double|The duration (milliseconds) that the VM has been assigned.|
|BillingAssignmentCorrelationId|String|The guid string ID of the billing assignment.|
|BuildId|String|The guid string ID of the build.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|SessionId|String|The guid string ID of the session.|
|UnassignmentEventTimestamp|DateTime|The time (UTC) the virtual machine unassignment started.|
|VmId|String|The virtual machine ID that is being unassigned.|
|VmOs|String|The virtual machine's operating system.|
