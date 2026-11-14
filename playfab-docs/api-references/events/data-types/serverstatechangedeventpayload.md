---
title: ServerStateChangedEventPayload
author: joannaleecy
description: ServerStateChangedEventPayload data type.
ms.author: jenelleb
ms.date: "11/13/2026"
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# ServerStateChangedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The GUID string ID of the build.|
|NewState|String|The new multiplayer server state.|
|OldState|String|The old multiplayer server state.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|ServerId|String|The multiplayer server ID.|
|SessionId|String|The GUID string ID of the session.|
|VmId|String|The virtual machine ID the multiplayer server is located on.|
