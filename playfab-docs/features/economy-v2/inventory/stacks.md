---
title: Inventory Stacks
author: wesjong
description: Overview of using Economy v2 Inventory Stacks.
ms.author: wesjong
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, inventory
ms.localizationpriority: medium
---

# Stacks

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The Economy V2 Inventory service introduces the concept of stacks that can add greater flexibility and support for your inventory needs. Stacks allow for separate and distinct instances of the same item to exist within the same inventory. This feature allows for in-game organizational scenarios, the ability to set different item properties and more!

Items of the same `Id` can be stored as stacks of the item each with their own amount and differentiated by `StackId`. If not specified, inventory actions will typically use the default stack with the StackId: `default` The default stack can be deleted. The next time an add/transfer occurs without a StackId (or uses the default StackId), the default stack is recreated

## Managing Inventories and Stacks

The following are a detailed breakdown of the [Inventory APIs](index.md) and their interactions with Stacks.

### Add Inventory Items

In the `AddInventoryItems` API, you can define a `StackId` in the `Item` parameter. This parameter defines either the stack that is being increased or the ID of the new stack being created.

An example `AddInventoryItems` request with a `StackId`:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "NewStack"
    },
    "Amount": 5,
}
```

The above request would either create a brand new stack of the item with an amount of 5 and a StackId of `NewStack` or add 5 to the existing `NewStack` if it already existed

### Subtract Inventory Items

In the `SubtractInventoryItems` API, the StackId is used to define which stack is being subtracted from. In addition, there's a `DeleteEmptyStacks` boolean that can be set which deletes the stack if the subtracted amount results in the stack having an amount of 0.

Trying to subtract more from a stack than the current stack amount will throw an error.

An example `SubtractInventoryItems` request with StackId:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "NewStack"
    },
    "Amount": 5,
    "DeleteEmptyStacks": true,
}
```

The above request would subtract 5 from the stack with the ID of `NewStack` and would delete the stack if it had the exact amount of 5.

### Update Inventory Items

In the `UpdateInventoryItems` API, you can define a `StackId` in the `Item` parameter. This parameter defines either the stack that is being updated or the ID of the new stack being created.

An example `UpdateInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "NewStack",
        "Amount": 5
    }
}
```

The above request would either create a brand new stack of the item with an amount of 5 and a StackId of `NewStack` or set the amount of `NewStack` to 5 if it already existed

### Delete Inventory Items

The `DeleteInventoryItems` API is used to delete an entire stack of items from a player's inventory. A `StackId` can be provided to define the specific stack of the Item to be deleted.

An example `DeleteInventoryItems` request:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
        "StackId": "NewStack"
    },
}
```

### Purchase Inventory Items

The `PurchaseInventoryItems` API uses the catalog-defined price of the item, and deducts the cost from the player's inventory and exchanges it with the desired amount of the item. You must specify the `Item` you wish to purchase and the `Amount` of the item you wish to purchase.

When you make purchases with stacks, there are a few parameters that are relevant:

- For `PriceAmounts` you can define an optional `StackId` for each price item (that is, the items being spent) to define which stack the spent items will be deducted from
- For the `Item` object, you can define an optional `StackId` that represents the stack the receiving items will be placed in
- There's a`DeleteEmptyStacks` boolean that can be set which deletes the stack if the subtracted amount results in the stack having an amount of 0.

> TODO Add link

An example `PurchaseInventoryItems` request with stacks:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "Item": {
        "Id": "LaserSword",
        "StackId": "MyLaserSwordStack"
    },
    "Amount": 10,
    "PriceAmounts": [
        {
            "ItemId": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
            "Amount": 5,
            "StackId": "MyNewStack",
        }
    ],
    "DeleteEmptyStacks": true,
}
```

### Transfer Inventory Items

When you use the `TransferInventoryItems` API with stacks, there are a few relevant parameters:

- In the `GivingItem` object, you can define an optional `StackId` that represents the stack the given items will be taken from
- In the `ReceivingItem` object, you can define an optional `StackId` that represents the stack the receiving items will be placed in
- There's a`DeleteEmptyStacks` boolean that can be set which deletes the stack if the `GivingItem` amount results in the stack having an amount of 0

An example `TransferInventoryItems` request with stacks:

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
    "Amount": 10,
    "DeleteEmptyStacks": true
}
```

### ExecuteInventoryOperations API

You can use the `StackId` and `DeleteEmptyStacks` parameters in the `Operation` objects in the `ExecuteInventoryOperations` API. These parameters allow you to batch multiple inventory operations using stacks.

An example `ExecuteInventoryOperations` request with stacks:

```json
"Entity": {
    "Type": "title_player_account",
    "Id": "ABCD12345678"
 },
"Operations": [
    {
        "Update": {
            "Item": {
                "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
                "StackId": "default",
                "Amount": 10
            }
        }
    },
    {
        "Subtract": {
            "Item": {
                "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
                "StackId": "MyNewStack"
            },
            "Amount": 5
        }
    }
]
```

### Adding Custom Properties with DisplayProperties and NewStackValues

You can set custom item properties to inventory Items with the `DisplayProperties` parameter. Setting properties can be done in the `AddInventoryItems`, `PurchaseInventoryItems` and `TransferInventoryItems` APIs, but **only** when a new stack is created. To set Display Properties for new items, the `NewStackValues` parameter must be set in the API request.

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


To update Display Properties on existing items, the `UpdateInventoryItems` API can be used to directly modify properties.

