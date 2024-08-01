---
title: CartItem
author: joannaleecy
description: CartItem data type.
ms.author: joanlee
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# CartItem

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|Description|String|Description of the catalog item.|
|DisplayName|String|Display name for the catalog item.|
|ItemClass|String|Class name to which catalog item belongs.|
|ItemId|String|Unique identifier for the catalog item.|
|ItemInstanceId|String|Unique instance identifier for this catalog item.|
|RealCurrencyPrices|Object|Cost of the catalog item for each applicable real world currency.|
|VCAmount|Object|Amount of each applicable virtual currency which will be received as a result of purchasing this catalog item.|
|VirtualCurrencyPrices|Object|Cost of the catalog item for each applicable virtual currency.|
