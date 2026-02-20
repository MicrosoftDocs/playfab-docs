---
title: player_realmoney_purchase
author: ernestoc
description: player_realmoney_purchase event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_realmoney_purchase

This event is triggered when a player makes a real money purchase, and generates revenue for the game.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| OrderId | String | Unique identifier of the order. |
| OrderTotal | uint32 | Total value of the purchase in the system currency (defaults to USD). |
| PaymentProvider | String | Payment provider used to make the purchase. |
| PaymentType | [PaymentType](../data-types/paymenttype.md) | Type of payment used to make the purchase. |
| PurchasedProduct | [] | The ItemIds from the catalog of the purchased items, if applicable. |
| TitleId | String | The ID of the title to which this player event applies. |
| TransactionCurrency | [Currency](../data-types/currency.md) | Local currency used to make the purchase, if applicable. |
| TransactionId | String | Unique identifier of the transaction. |
| TransactionTotal | uint32 | Total value of the purchase in the local currency used to make the purchase, if applicable. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
