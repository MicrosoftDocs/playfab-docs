---
title: VmGameCertificatesDeployedEventPayload
author: valexao
description: VmGameCertificatesDeployedEventPayload data type.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# VmGameCertificatesDeployedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The GUID string ID of the build.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|VmId|String|The ID of the virtual machine that was assigned.|
|GameCertificates|[List\<GameCertificateDeployed>](gamecertificatedeployed.md)|The list of game certificates deployed.|
