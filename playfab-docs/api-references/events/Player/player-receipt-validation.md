---
title: player_receipt_validation
author: ernestoc
description: player_receipt_validation event.
ms.author: ernestoc
ms.date: 02/18/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, playstream events
ms.localizationpriority: medium
---

# player_receipt_validation

This event is triggered when a player attempts to make a real money purchase and the purchase receipt is being validated.

## Properties

| Name | Type | Description |
| :--- | :--- | :--- |
| Error | String | The error that occurred during a receipt validation. |
| PaymentProvider | String | Payment provider used to make the purchase attempt. |
| PaymentType | [PaymentType](../data-types/paymenttype.md) | Type of payment used to make the purchase attempt. |
| ReceiptContent | String | The receipt data during a real money purchase event attempt. |
| TitleId | String | The ID of the title to which this player event applies. |
| Valid | Boolean | Indicates if the receipt is valid. |

## Common Properties

[!INCLUDE [common-properties](../../../includes/_common-properties-eventsv1.md)]
