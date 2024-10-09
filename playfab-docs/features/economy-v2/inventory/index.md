---
title: PlayFab Inventory APIs
author: wesjong
description: Overview of the PlayFab Inventory APIs  
ms.author: wesjong
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, inventory
ms.localizationpriority: medium
---

# Inventory

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The PlayFab Inventory APIs gives you the ability to manage and store your player inventories and inventory data. Features such as Stacks and Collections allow for flexibility in structuring player inventories and allow this system to work with any game

## Managing Player Inventories

The following APIs are used to help add, remove, update and delete items in a player's inventory. The current limit is 10000 items and you'll get an error if you go above that.

### Getting a Player's Inventory

#### [Game Manager](#tab/inventory-game-manager)

1. In [Game Manager](../../../gamemanager/index.md), navigate to `Players`
1. Select the player you wish to view or create a `New Player`, then go to `Inventory (V2)`

#### [API](#tab/inventory-api)

You can use the `GetInventoryItems` to get player's inventory. Player's are limited to only accessing and manipulating their own Inventory. Title Entities can pass in an `Entity` parameter to indicate which player's inventory they wish to access.

An example `GetInventoryItems` request:

```json
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "ABCD12345678"
  },
  "CollectionId": "main_character",
  "Count": 15,
  "ContinuationToken": "abc="
}
```

***

More information about using `CollectionId`and having multiple inventories per player can be found [here](collections.md).

##### Continuation Tokens

The `ContinuationToken` field that is returned from a search response can be passed into an inventory request to paginate through multiple counts of results.

### Add Inventory Items

The `AddInventoryItems` API is used to directly add items to a specific player's Inventory. It takes an `EntityId`,`ItemId`, and `Amount` parameters, and adds the given item to a player’s inventory

An example `AddInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "Amount": 10,
}
```

### Subtract Inventory Items

The `SubtractInventoryItems` API is used to directly reduce an item in a player's Inventory by a specific amount. It takes an `EntityId`,`ItemId`, and `Amount` parameters, and removes the given amount of the item. This API will throw an error if attempting to remove more than the currently available amount.

An example `SubtractInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "Amount": 10,
}
```

### Update Inventory Items

The `UpdateInventoryItems` API is used to directly set an item in a player's Inventory to a specific amount. It takes an `EntityId`,`ItemId`, and `Amount` parameters, and sets the given amount of the item. This API can be used to both increase or reduce the amount of an item and add items to a player's inventory should the item not exist.

An example `UpdateInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "Amount": 10
    }
}
```

### Delete Inventory Items

The `DeleteInventoryItems` API is used to delete an entire stack of items from a player's inventory.

An example `DeleteInventoryItems` request:

```json
{
   "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
}
```

### Purchase Inventory Items

The `PurchaseInventoryItems` API uses the catalog-defined price of the item, and deducts the cost of the player's inventory and exchanges it with the desired amount of the item. You must specify the `Item` you wish to purchase and the `Amount` of the item you wish to purchase.

There are a few key parameters specific to the `PurchaseInventoryItems` API:

* `PriceAmounts` is a list of items and amounts that are **per-item** prices of the item. These prices must match a value configured in the Catalog or specified Store.
* `StoreId` is an optional parameter of the Store the item is to be purchased from. More about Stores can be found [here](../stores.md)

An example `PurchaseInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "LaserSword",
    },
    "Amount": 10,
    "PriceAmounts": [
        {
            "ItemId": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
            "Amount": 5
        }
    ],
}
```

### Transfer Inventory Items

The `TransferInventoryItems` API can be used in three different ways.

1. For transferring items between players (for example, Player A gives three apples to Player B)
1. For transferring items between a single player's inventory collections (for example, Player A moves their Long sword from their Wizard Characters inventory to their Warrior Character's inventory)
1. For transferring items within a single player's inventory to create, remove, and manipulate item Stacks (for example, Player A splits their Stack of 10 gold coins into two stacks of three and seven gold coins)

The `GivingItem` and `Amount` parameters are used to represent the amount and the item being transferred. The `ReceivingItem` represents the item destination for the receiving player's account. Both the `GivingItem` and `ReceivingItem` parameters are `InventoryItemReference` objects that contain the `Id` of the Item and the `StackId`. Both `GivingItem` and `ReceivingItem` can be empty to handle transfers where one entity isn't transferring items. Unless specified, all items are set to `default` for the `StackId` when added/transferred to a player's inventory.

#### 1. Transfer between Players

For a transfer between players, the `GivingEntity` and `ReceivingEntity` should be specified, representing the player transferring the items and the player receiving the items, respectively.

An example `TransferInventoryItems` request between players:

```json
{
    "GivingEntity": {
        "Type": "title_player_account",
        "Id": "DEFG98765432"
    },
    "ReceivingEntity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "GivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "ReceivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "Amount": 1
}
```

#### 2. Transfer between Collections

For a transfer between collections, the `GivingCollectionId` and `ReceivingCollectionId` should be set which represents inventory collection ID the request is transferring from and to, respectively.  

An example `TransferInventoryItems` request between collections:

```json
{
    "GivingEntity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "ReceivingEntity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "GivingCollectionId": "default",
    "ReceivingCollectionId": "main_character",
    "GivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "ReceivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "Amount": 10
}
```

The above request transfers 10 of the item from the player's `default` collection to their `main_character` collection.

More information about collections can be found [here](collections.md).

#### 3. Transfer between Stacks

For a transfer between stacks, the `StackId` for the `GivingItem` and the `ReceivingItem` of the request should be specified.

An example `TransferInventoryItems` request between stacks:

```json
{
    "GivingEntity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "ReceivingEntity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "GivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "default",
    },
    "ReceivingItem": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "MyNewStack",
    },
    "Amount": 10
}
```

The above request transfers 10 of the item from the player's `default` stack to their `MyNewStack` stack.

More information about stacks can be found [here](stacks.md).

### ExecuteInventoryOperations API

You can use the `ExecuteInventoryOperations` API to batch multiple inventory operations in a single request. Operations will happen in request order specified and if an operation is unable to be performed, the whole set of operations is canceled.

The `ExecuteInventoryOperations` takes in an `Operation` parameter that is a list of operations. There can be at most ten operations in the `Operation` list but operation types can repeat (for example, 10 Add operations are valid). There is also a limit to 250 items that can be modified/added in a single request. For example, adding a bundle with 50 items counts as 50 items modified. The valid operation types are:

* Add
* Subtract
* Update
* Purchase
* Transfer*
* Delete

> [!NOTE]
> *Only single-collection transfers are supported within a batch.

An example `ExecuteInventoryOperations` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Operations": [
        {
            "Update": {
                "Item" {
                    "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
                    "Amount": 10
                }
            }
        },
        {
            "Subtract": {
                "Item" {
                    "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
                },
                "Amount": 5
            }
        }
    ]
}
```

### Idempotency

When calling Inventory APIs, you can pass in an `IdempotencyId` that can be used in situation where repetitive calls are being made for fallback or redundancy purposes. If multiple API calls have the same `IdempotencyId`, the system will ensure that only one of those requests will be processed.

For example, the following `PurchaseItem` API request can be called multiple times, but since all the requests have the same `IdempotencyId`, only a single purchase will be made for that player's inventory.

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "LaserSword",
    },
    "Amount": 10,
    "PriceAmounts": [
        {
            "ItemId": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
            "Amount": 5
        }
    ],
    "IdempotencyId": "ABC123"
}
```

`IdempotencyId` are stored and enforced for 14 days, after which the ID can be used again.

> [!NOTE]
> Using the same `IdempotencyId` for different request types will cause a conflict and throw an error.

### Display Properties

Display Properties are custom item properties that can be added to items and item stacks in player inventories.

These properties can be added by `AddInventoryItems`, `PurchaseInventoryItems`, `TransferInventoryItems`, and `UpdateInventoryItems` operations.

#### Adding properties to New Stacks/Items

For the `AddInventoryItems`, `PurchaseInventoryItems` and `TransferInventoryItems` APIs, Display Properties can **only** be added when a new stack is created. To set Display Properties for new items, the `NewStackValues` parameter must be set in the API request.

An example `AddInventoryItems` request with `NewStackValues`:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "20a645ce-a3bf-4fcb-8e67-36aa7bf0331d",
        "StackId": "NewStack"
    },
    "Amount": 15,
    "NewStackValues": {
        "DisplayProperties": {
            "DifficultyRating":5,
            "IsMagic": true,
            "Rarity": "Legendary"
        }
    }
}
```

More information about stacks can be found [here](stacks.md).

#### Updating properties to existing Stacks/Items

To update Display Properties on existing items, the `UpdateInventoryItems` API can be used to directly modify properties.

An example `UpdateInventoryItems` request with `DisplayProperties`:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "20a645ce-a3bf-4fcb-8e67-36aa7bf0331d",
        "StackId": "NewStack",
        "Amount": 15,
        "DisplayProperties": {
            "DifficultyRating":5,
            "IsMagic": false,
            "Rarity": "Epic"
        }
    }
}
```
