---
title: marketplace_transaction_redeemed
author: ernestoc
description: marketplace_transaction_redeemed event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# marketplace_transaction_redeemed

This event is triggered when a bundle or subscription has been redeemed to an inventory.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| Marketplace | String | The name of the marketplace the items were redeemed from. |
| MarketplaceTransctionId | String | The transaction Id from the marketplace the items were redeemed from. |
| MarketplaceAlternateId | String | The alternate Id of the item for the marketplace. |
| Amount | int? | The amount that was redeemed. |
| DurationInSeconds | long? | The amount of subscription that was redeemed. |
| ItemId | String | The identifier of the item that was redeemed. |
| ItemType | String | The type of the catalog item that was redeemed. |
| RealMoneyPrices | Dictionary<string, int> | The multi-currency unit price, in real money, of the item that was redeemed. The property is a dictionary where the key is the three-letter currency code as defined in ISO 4217, and the value is the currency amount in the smallest unit (for example, cents, pence) in accordance with ISO 4217. Only United States Dollar (USD) is currently supported. Example: If the product price in USD is $1.39, the dictionary entry would be: ["USD"] = 139; |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv2.md)]
