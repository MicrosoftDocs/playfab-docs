---
title: ETags and concurrency control in Economy v2
author: ernestoc
description: How to use ETags for optimistic concurrency control in inventory operations to prevent conflicting writes
ms.author: ernestoc
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy, etags, concurrency, optimistic, inventory
ms.localizationpriority: medium
---

# ETags and concurrency control

[!INCLUDE [notice](../../../includes/_economy-release.md)]

When multiple sources (for example, game servers, Azure Functions, or concurrent player actions) modify a player's inventory simultaneously, writes can conflict and overwrite each other. Economy v2 provides **ETags** for optimistic concurrency control—ensuring a write only succeeds if the inventory didn't change since you last read it.

To prevent duplicate transactions from network retries, see [Idempotent transactions and retry patterns](idempotent-transactions-and-retries.md).

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A title created in [Game Manager](https://developer.playfab.com/).
- At least one published catalog item.

## How it works

Inventory read APIs (such as `GetInventoryItems`) return an `ETag` representing the current version of the inventory. You can pass this value in subsequent write requests by using the `X-PlayFab-Economy-If-Match` HTTP header. If the inventory was modified since you read it, the write is rejected with a **412 Precondition Failed** error.

## Supported HTTP headers

Inventory APIs support ETags through the following HTTP headers:

- **`X-PlayFab-Economy-If-Match`**—Pass a previously received `ETag` value. On **write** APIs, the request succeeds only if the inventory's current ETag matches (returns **412 Precondition Failed** otherwise). On **read** APIs (`GetInventoryItems`), the call returns **412 Precondition Failed** if the inventory version doesn't yet match the provided ETag—indicating the read data might not reflect your latest write. Your client should retry the read until it succeeds.
- **`X-PlayFab-Economy-If-None-Match`**—On **write** APIs, pass `*` as the value. The request succeeds only if the item doesn't already exist in the inventory. This header is useful for "create-only" scenarios. On **read** APIs (`GetInventoryItems`), pass a previously received `ETag` value. If the inventory didn't change, the API returns **304 Not Modified** with an empty body. If it changed, the API returns the full response with a new `ETag`.

## ETags on GetInventoryItems (read path)

You can use ETags on the read path to avoid redownloading an inventory that didn't change. This behavior is useful for polling scenarios or periodic inventory refreshes where the inventory is unlikely to change between calls.

### How it works

1. Call `GetInventoryItems` normally. The response includes an `ETag` in the response body.
2. On subsequent calls, pass the stored `ETag` in the `If-None-Match` HTTP header.
3. If the inventory didn't change, the API returns **304 Not Modified**—no body, no bandwidth cost.
4. If the inventory changed, the API returns the full inventory with a new `ETag`.

### Example

**First call (no ETag):**

```
POST /Inventory/GetInventoryItems
Content-Type: application/json
X-EntityToken: {{EntityToken}}
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    }
}
```

Response (200 OK):

```json
{
    "Items": [
        {
            "Id": "{{HealthPotionID}}",
            "StackId": "default",
            "Amount": 10
        }
    ],
    "ETag": "1/MQ=="
}
```

**Subsequent call (with ETag, inventory unchanged):**

```
POST /Inventory/GetInventoryItems
Content-Type: application/json
X-EntityToken: {{EntityToken}}
If-None-Match: 1/MQ==
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    }
}
```

Response: **304 Not Modified** (empty body). Your client keeps using the cached inventory.

**Subsequent call (with ETag, inventory changed):**

If the inventory changed since the last read, the API returns the full response with a new `ETag`:

Response (200 OK):

```json
{
    "Items": [
        {
            "Id": "{{HealthPotionID}}",
            "StackId": "default",
            "Amount": 7
        }
    ],
    "ETag": "2/Mg=="
}
```

Your client updates its cache and stores the new `ETag` for future calls.

### When to use read-path ETags

| Scenario | Benefit |
|---|---|
| Periodic inventory refresh (polling every N seconds) | Avoids redownloading unchanged data, reducing bandwidth and API response size. |
| Game startup check | Quickly verify if the player's inventory changed since the last session without transferring the full inventory. |
| Multi-screen UI | Different UI panels can check for changes independently without redundant full reads. |
| Read-after-write consistency | Ensure a `GetInventoryItems` call returns data that includes a write you made. |

### Read-after-write with X-PlayFab-Economy-If-Match

Inventory writes are eventually consistent. A `GetInventoryItems` call immediately after a write might return stale data. To verify that your read reflects a specific write, pass the `ETag` from the write response in the `X-PlayFab-Economy-If-Match` header on the next `GetInventoryItems` call. If the inventory isn't yet at that version, the API returns **412 Precondition Failed**. Your client should retry until the call succeeds with a 200 response.

**Step 1: Perform a write and capture the new ETag**

```
POST /Inventory/AddInventoryItems
Content-Type: application/json
X-EntityToken: {{EntityToken}}
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    },
    "Item": {
        "Id": "{{HealthPotionID}}"
    },
    "Amount": 5
}
```

Response (200 OK):

```json
{
    "ETag": "3/Mw==",
    "IdempotencyId": null,
    "TransactionIds": ["txn-abc-123"]
}
```

**Step 2: Read with the write's ETag**

```
POST /Inventory/GetInventoryItems
Content-Type: application/json
X-EntityToken: {{EntityToken}}
X-PlayFab-Economy-If-Match: 3/Mw==
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    }
}
```

- If the inventory is at the requested version → **200 OK** with the full inventory including the write.
- If the inventory isn't yet at the requested version → **412 Precondition Failed**. Retry after a short delay.

**Step 3: Retry loop (pseudocode)**

```
writeResult = AddInventoryItems(playerId, "HealthPotion", 5)
writeETag = writeResult.ETag

MAX_RETRIES = 5
DELAY_MS = 100

for attempt in 1..MAX_RETRIES:
    result = GetInventoryItems(
        playerId,
        headers: { "X-PlayFab-Economy-If-Match": writeETag }
    )

    if result.status == 200:
        return result.Items  // Read reflects the write
    else if result.status == 412:
        sleep(DELAY_MS)      // Not yet consistent, retry
        continue
    else:
        return error(result)

// Fallback: read without the header to get whatever is available
return GetInventoryItems(playerId)
```

This pattern is useful when your game UI needs to immediately display the result of a purchase or reward grant—without it, a fast read call might return the prewrite state.

## Supported APIs

### Write APIs (support `X-PlayFab-Economy-If-Match` and `X-PlayFab-Economy-If-None-Match`)

- [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items)
- [SubtractInventoryItems](/rest/api/playfab/economy/inventory/subtract-inventory-items)
- [UpdateInventoryItems](/rest/api/playfab/economy/inventory/update-inventory-items)
- [PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items)
- [DeleteInventoryItems](/rest/api/playfab/economy/inventory/delete-inventory-items)
- [TransferInventoryItems](/rest/api/playfab/economy/inventory/transfer-inventory-items)
- [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)

### Read APIs (support `X-PlayFab-Economy-If-None-Match` and `X-PlayFab-Economy-If-Match`)

- [GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items)

## Example: Read-modify-write with ETag

In this scenario, your game server reads a player's inventory, makes a decision based on current state, then writes an update. You want to guarantee that no concurrent change invalidates your logic.

**Step 1: Read the inventory and capture the ETag**

```
POST /Inventory/GetInventoryItems
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    }
}
```

Response:

```json
{
    "Items": [
        {
            "Id": "{{HealthPotionID}}",
            "StackId": "default",
            "Amount": 10
        }
    ],
    "ETag": "1/MQ=="
}
```

**Step 2: Write with the ETag**

```
POST /Inventory/SubtractInventoryItems
Content-Type: application/json
X-EntityToken: {{EntityToken}}
X-PlayFab-Economy-If-Match: 1/MQ==
```

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "{{PlayerID}}"
    },
    "Item": {
        "Id": "{{HealthPotionID}}"
    },
    "Amount": 3
}
```

If another operation modifies the inventory between step 1 and step 2, the ETag doesn't match and the request returns **412 Precondition Failed**.

**Step 3: Handle the conflict**

If you receive a 412, re-read the inventory to get the latest state and ETag, reevaluate your logic, and retry.

## Retry loop pattern (pseudocode)

```
MAX_RETRIES = 3
for attempt in 1..MAX_RETRIES:
    inventory, etag = GetInventoryItems(playerId)
    
    // Make your decision based on current inventory state
    if inventory["HealthPotion"].Amount < 3:
        return error("Not enough potions")
    
    result = SubtractInventoryItems(
        playerId, "HealthPotion", 3,
        headers: { "X-PlayFab-Economy-If-Match": etag }
    )
    
    if result.status == 200:
        return success
    else if result.status == 412:
        continue  // Retry with fresh data
    else:
        return error(result)

return error("Max retries exceeded")
```

## Common scenarios

| Scenario | How ETags help |
|---|---|
| Server-side read-modify-write | To prevent stale-data writes, read inventory, validate state, and write with ETag. |
| Concurrent Azure Functions | Multiple functions processing the same player's inventory don't silently overwrite each other. |
| Admin tools | Game Manager or support tools modifying a player's inventory detect conflicts with in-game operations. |

## ETags vs. IdempotencyId

These two mechanisms serve different purposes and should be used independently. Using them together in the same request is **not recommended**, as their retry semantics conflict—an `IdempotencyId` expects identical retries, while an ETag-based flow requires re-reading state and issuing a new request on each attempt.

| Mechanism | Purpose | When to use |
|---|---|---|
| **IdempotencyId** | Prevents duplicate transactions from retries. | Purchases, grants, transfers—any operation where a retry could double-charge or double-grant. See [Idempotent transactions](idempotent-transactions-and-retries.md). |
| **ETags** | Prevents concurrent writes from conflicting. | Read-modify-write patterns where you need to guarantee consistency. |

## See also

- [Idempotent transactions and retry patterns](idempotent-transactions-and-retries.md)
- [Inventory ETags reference](../inventory/etags.md)
- [Catalog ETags reference](../catalog/etags.md)
- [Inventory overview](../inventory/index.md)
- [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations)
