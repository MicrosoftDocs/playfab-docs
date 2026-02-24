---
title: PlayerCustomPropertiesChangedDetails
author: ronnyparedes
description: PlayerCustomPropertiesChangedDetails data type.
ms.author: ronnyparedes
ms.date: 02/12/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# PlayerCustomPropertiesChangedDetails

Details about a custom property change.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Name|String|The name of the custom property that was changed.|
|OperationType|[PlayerCustomPropertiesChangedOperationTypes](playercustompropertieschangedoperationtypes.md)|The operation that was performed.|
|Value|object|The last set value of the custom property.|
