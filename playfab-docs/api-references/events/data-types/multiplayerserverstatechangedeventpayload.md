---
title: MultiplayerServerStateChangedEventPayload
author: joannaleecy
description: MultiplayerServerStateChangedEventPayload data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# MultiplayerServerStateChangedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The guid string ID of the build.|
|NewState|String|The new multiplayer server state.|
|OldState|String|The old multiplayer server state.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|ServerId|String|The multiplayer server ID.|
|SessionId|String|The guid string ID of the session.|
|VmId|String|The virtual machine ID the multiplayer server is located on.|
