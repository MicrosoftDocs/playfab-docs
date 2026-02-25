---
title: entity_virtual_currency_balances_changed
author: joannaleecy
description: entity_virtual_currency_balances_changed event.
ms.author: jenelleb
ms.date: 02/19/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# entity_virtual_currency_balances_changed

This event is triggered when an entity's virtual currency balance changes.

## Properties

|Name|Type|Description|
| :--------------------|:-------------------|:----------------------|
|EntityChain|String|The chain of ownership for this entity.|
|EntityLineage|[EntityLineage](../data-types/entitylineage.md)|Entities that this entity is a child of.|
|SequenceId|String|Sequence id of the balance change to ensure updates are processed in order.|
|VirtualCurrencyBalances|Object|New virtual currency balances after the change. Only shows currencies that were updated.|
|VirtualCurrencyContainerId|String|Container whose balances changed.|
|VirtualCurrencyPreviousBalances|Object|Old virtual currency balances before the change. Only shows currencies that were updated.|

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
