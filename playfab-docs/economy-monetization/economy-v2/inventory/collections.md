---
title: Inventory Collections
author: wesjong
description: Overview of using Economy v2 Inventory Collections.
ms.author: wesjong
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, inventory
ms.localizationpriority: medium
---

# Collections

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The Economy v2 Inventory service introduces the concept of collections that can add greater flexibility and support for your inventory needs. Collections are the mechanism that allows for a single player/PlayerId to have multiple inventories. This feature can be used to manage multiple inventories for different characters for the same player, having separate inventories for different platforms, and more!

Inventory API calls can take in a `CollectionId` parameter that specifies the collection/inventory to perform the action in. Creating a new collection is done by adding an item/stack to an unused CollectionId.

## Managing Inventory Collections

### GetInventoryCollectionIds

Using the `GetInventoryCollectionIds` API, you can get a list of `CollectionId`s for a given player. Players are limited to only accessing their own list of IDs. Title Entities can pass in an `Entity` parameter to indicate which player's inventory they wish to access.

An example `GetInventoryCollectionIds` request:

```csharp
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "ABCD12345678"
  },
  "Count": 15,
  "ContinuationToken": "abc="
}
```

This request would return the following response:

```csharp
{
  "data": {
  "CollectionIds": [
    "default".
    "main_character"
    ]
  }
}
```

#### Continuation Tokens

The `ContinuationToken` field that is returned from a search response can be passed into an inventory request to paginate through multiple counts of results.

### Adding a New Inventory Collection

Creating a new collection for a player is done by performing any write request with a new CollectionId.

For example, the following `AddInventoryItems` request uses the collectionId `main_character`

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "CollectionId": "main_character",
    "Item": {
        "Id": "0b440353-bdbc-48d8-8873-f0988c1f9d8b",
    },
    "Amount": 10,
}
```

The above request would either create a brand new inventory collection of and add 5 of the item to it or add 5 to the existing `main_character` inventory collection if it already existed.

### DeleteInventoryCollection

In the `DeleteInventoryCollectionId` API, you can define the `CollectionId`
you wish to delete. Deleting is an asynchronous operation and may take longer for collections that are large. The collection won't be able to be remade until the delete operation is complete.

An example `DeleteInventoryCollectionIds` request:

```json
{
  "Entity": {
    "Type": "title_player_account",
    "Id": "ABCD12345678"
  },
  "CollectionId": "main_character"
}
```

> [!NOTE]
> Currently, APIs are the only way to delete Inventory Collections. Game Manager can currently only be used to view and add items to new and existing collections. Additional functionality will be added in the future.

### ExecuteInventoryOperations API

You can set a `CollectionId` parameter in the `ExecuteInventoryOperations` API. This parameter allows you to define the collection where you want the operations to be performed in.

An example `ExecuteInventoryOperations` request with stacks:

```json
{
    "Entity": {
        "Type": "title_player_account",
        "Id": "ABCD12345678"
    },
    "CollectionId": "main_character",
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
