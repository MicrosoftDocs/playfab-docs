---
title: Inventory ETags
author: wesjong
description: Using ETags for optimistic concurrency control with PlayFab Inventory APIs.
ms.author: wesjong
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, inventory, etags, concurrency
ms.localizationpriority: medium
---

# Inventory ETags

[!INCLUDE [notice](../../../includes/_economy-release.md)]

ETags provide optimistic concurrency control for the PlayFab Inventory APIs. They allow you to detect and prevent conflicting writes when multiple sources are modifying a player's inventory simultaneously.

## How Inventory ETags work

Inventory read APIs such as `GetInventoryItems` return an `ETag` in the response body. This value represents the current version of the player's inventory collection. You can pass this value in subsequent write requests to ensure your changes don't conflict with other updates that might have occurred since you last read the inventory.

### Example `GetInventoryItems` response with ETag

```json
{
  "code": 200,
  "status": "OK",
  "data": {
    "Items": [
      {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "default",
        "Amount": 10,
        "Type": "catalogItem"
      }
    ],
    "ETag": "1/MQ=="
  }
}
```

## Supported HTTP Headers

Inventory write APIs support ETags through the following HTTP headers:

- **`X-PlayFab-Economy-If-Match`**—Pass a previously received `ETag` value. The request succeeds only if the inventory's current ETag matches. Use this check when you need to guarantee that no other write has occurred since you last read the inventory.
- **`X-PlayFab-Economy-If-None-Match`**—Pass `*` as the value. The request succeeds only if the item doesn't already exist in the inventory. Useful for "create-only" scenarios.

## Supported APIs

The following Inventory write APIs support ETag headers:

- [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items)
- [SubtractInventoryItems](/rest/api/playfab/economy/inventory/subtract-inventory-items)
- [UpdateInventoryItems](/rest/api/playfab/economy/inventory/update-inventory-items)
- [PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items)
- [DeleteInventoryItems](/rest/api/playfab/economy/inventory/delete-inventory-items)
- [TransferInventoryItems](/rest/api/playfab/economy/inventory/transfer-inventory-items)
- [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)

## Usage Example

A typical workflow using inventory ETags:

1. Call `GetInventoryItems` and store the `ETag` from the response.
2. Perform your inventory write (for example, `AddInventoryItems`) and include the `X-PlayFab-Economy-If-Match` header with the stored `ETag`.
3. If the inventory has been modified by another request since you read it, the API returns a **412 Precondition Failed** error. In that case, re-read the inventory, get the latest `ETag`, and retry.

```
POST /Inventory/AddInventoryItems
Content-Type: application/json
X-EntityToken: <entity-token>
X-PlayFab-Economy-If-Match: 1/MQ==

{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b"
    },
    "Amount": 5
}
```

## See also

- [Inventory Overview](index.md)
- [Catalog ETags](../catalog/etags.md)
- [Idempotency](index.md#idempotency)
