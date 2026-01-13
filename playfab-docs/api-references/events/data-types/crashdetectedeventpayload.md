---
title: CrashDetectedEventPayload
author: valexao
description: CrashDetectedEventPayload data type.
ms.author: vorelien
ms.date: 12/30/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# CrashDetectedEventPayload

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|BuildId|String|The guid string ID of the multiplayer server build that regions were updated on.|
|Region|[AzureRegion](azureregion.md)|The build region.|
|ServerId|String|The guid string ID of the session.|
|VmId|String|The virtual machine ID the multiplayer server is located on.|
|CrashDumpUploaded|bool|If true, the crash dump was uploaded with the server's logs.|
|CrashDumpStatus|String|The reason a crash dump wasn't uploaded. If null, assume no crash dump was found.|
