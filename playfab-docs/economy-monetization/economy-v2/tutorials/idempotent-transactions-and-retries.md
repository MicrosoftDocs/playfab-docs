---
title: Idempotent transactions and retry patterns in Economy v2
author: ernestoc
description: How to use IdempotencyId to safely retry inventory operations and prevent duplicate transactions
ms.author: ernestoc
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy, idempotent, retry
ms.localizationpriority: medium
---

# Idempotent transactions and retry patterns

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Network failures, timeouts, and duplicate requests are inevitable in live games. Economy v2 provides **IdempotencyId** to prevent duplicate transactions. This feature ensures an operation is processed only once even if the same request is sent multiple times.

For optimistic concurrency control (ensuring a write only succeeds if inventory didn't change since you last read it), see [ETags and concurrency control](etags-and-concurrency-control.md).

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A title created in [Game Manager](https://developer.playfab.com/).
- At least one published catalog item and one virtual currency.

## How it works

When you include an `IdempotencyId` in an inventory write request, PlayFab stores that ID for **14 days**. If another request arrives with the same `IdempotencyId`, PlayFab returns the result of the original request without processing the operation again.

## Supported APIs

`IdempotencyId` is supported on all inventory write APIs:

- [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items)
- [SubtractInventoryItems](/rest/api/playfab/economy/inventory/subtract-inventory-items)
- [PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items)
- [TransferInventoryItems](/rest/api/playfab/economy/inventory/transfer-inventory-items)
- [DeleteInventoryItems](/rest/api/playfab/economy/inventory/delete-inventory-items)
- [UpdateInventoryItems](/rest/api/playfab/economy/inventory/update-inventory-items)
- [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)

## Example: Safe purchase with retry

In this scenario, a player buys a Laser Sword. The client generates a unique `IdempotencyId` (for example, a GUID) before sending the request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    },
    "Item": {
        "Id": "{{LaserSwordID}}"
    },
    "Amount": 1,
    "PriceAmounts": [
        {
            "ItemId": "{{DiamondCurrencyID}}",
            "Amount": 5
        }
    ],
    "IdempotencyId": "b7e3f1a2-9c4d-4e8f-a1b2-3c4d5e6f7a8b"
}
```

If the client doesn't receive a response (for example, network timeout), it can safely retry the exact same request with the same `IdempotencyId`. PlayFab recognizes the duplicate and returns the original result. The player is charged only once.

## Best practices

- **Generate a unique ID per logical operation**—Use a GUID or UUID. Don't reuse the same ID for different operations.
- **Generate the ID client-side before the first attempt**—This practice ensures all retries use the same ID.
- **Don't change the request body between retries**—Using the same `IdempotencyId` with a different request body causes a conflict error.
- **IDs expire after 14 days**—After that, the same ID can be used again for a new operation.

## Redeem APIs are automatically idempotent

The marketplace redeem APIs (`RedeemAppleAppStoreInventoryItems`, `RedeemGooglePlayInventoryItems`, `RedeemMicrosoftStoreInventoryItems`, `RedeemSteamInventoryItems`) don't require an `IdempotencyId`. They're inherently idempotent. Each marketplace receipt or token can only be redeemed once. A second call with the same receipt returns success but grants nothing.

## Common scenarios

| Scenario | Recommended approach |
|---|---|
| Client-side purchase (player buys an item) | Generate a GUID before the first attempt, retry with the same ID on timeout. |
| Server-side reward grant (quest completion) | Use a deterministic ID derived from the quest and player (for example, `questId-playerId`) to prevent double-grants. |
| Marketplace redemption | No `IdempotencyId` needed—redeem APIs are automatically idempotent. |

## See also

- [ETags and concurrency control](etags-and-concurrency-control.md)
- [Inventory overview](../inventory/index.md#idempotency)
- [Fraud prevention](../fraud-prevention/index.md)
- [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)
