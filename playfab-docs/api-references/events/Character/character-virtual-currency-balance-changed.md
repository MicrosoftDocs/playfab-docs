---
title: character_virtual_currency_balance_changed
author: ernestoc
description: character_virtual_currency_balance_changed event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# character_virtual_currency_balance_changed

This event is triggered when a character's virtual currency balance changes.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| OrderId | String | ID of the order that triggered the balance changes. |
| PlayerId | String |  |
| TitleId | String |  |
| VirtualCurrencyBalance | int32 | New virtual currency balance after the change. |
| VirtualCurrencyName | String | Virtual currency whose balance changed. |
| VirtualCurrencyPreviousBalance | int32 | Old virtual currency balance before the change. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
