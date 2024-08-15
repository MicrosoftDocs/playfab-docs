---
title: MultiplayerServerBuildRegionStatusChangedEventPayload
author: joannaleecy
description: MultiplayerServerBuildRegionStatusChangedEventPayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MultiplayerServerBuildRegionStatusChangedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The GUID string ID of the build.|
|MinutesInOldStatus|double|The duration (minutes) in the old build status.|
|NewStatus|String|The new build region status.|
|OldStatus|String|The old build region status.|
|Region|[AzureRegion](azureregion.md)|The build region.|
