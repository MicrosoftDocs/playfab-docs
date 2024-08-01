---
title: Crafting Game Part 3 - Coding
author: fprotti96
description: Getting started with coding and adding some practical examples.
ms.author: fprotti
ms.date: 09/26/2023
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Part 3 - Coding + Examples

Now that you have your environment ready and are familiar with Game Manager, we can start coding our game.

## Prerequisites

1. [Part 1 - Environment Setup](../craftingGame/crafting-game-environment.md)
2. [Part 2 - Using Game Manager](../craftingGame/crafting-game-game-manager.md)

## Step 1 - Configure Environment Settings

The first thing we recommend you do once you start coding, is to configure your environment settings. This way you can rest assured that every call you make will have a link to your Title and using your specific Developer Secret Key.

To get this step out of the way, you can specify anywhere in your code (hopefully somewhere easy to find for you), the TitleId and the DeveloperSecretKey variables and assign your values to them.

Do this by adding two separate lines of code as follows:

```csharp
PlayFabSettings.staticSettings.TitleId = "{Your Title ID}";
PlayFabSettings.staticSettings.DeveloperSecretKey = "{Your Developer Secret Key}";
```

## Step 2 - Get Authenticated

Once you have the environment set up, the PlayFab NuGet package installed and configured in your project, and both your Studio and Title created, we may start with coding our authentication.

> [!NOTE]
> There are several ways in which a user can get authenticated. In this example, we are going to use the **LoginWithCustomId** method. There are other ways to get authenticated, including platform-specific ones. For more information visit the [Login Basics](/gaming/playfab/features/authentication/login/login-basics-best-practices).

Next is a sample code made in C# in which we authenticate a user using the **LoginWithCustomID**, which is classified as an anonymous sign-in. Before calling the API to authenticate, we must first declare a global variable in which we store the **EntityKey** that is generated as part of the sign in process.

The **EntityKey** is used to make any kind of calls to the API and is what links every request and response to the user logged in.

The declaration of the global EntityKey variable is as follows:

```csharp
private static PlayFab.ClientModels.EntityKey entityKey;
```

***

Then the logic to get a user authenticated is:

### [C# SDK](#tab/login-csharp)

```csharp
var request = new LoginWithCustomIDRequest { CustomId = username };
var loginTask = PlayFabClientAPI.LoginWithCustomIDAsync(request);
entityKey = loginTask.Result.Result.EntityToken.Entity;
```

### [API](#tab/login-api)

```json
{
  "CustomId": "{{Username}}",
  "CreateAccount": false,
  "TitleId": "{{TitleId}}"
}
```

***

The above code looks for any existing players linked to your game title. But it fails if there's no user with a matching username. To bypass this, we can add a "CreateAccount = true" parameter to the request's body. This makes it so that PlayFab creates a new player if there's no match for whatever the user is sending as a username. This would result in a code looking like this:

### [C# SDK](#tab/login-csharp-new-user)

```csharp
var request = new LoginWithCustomIDRequest { CustomId = username, CreateAccount = true };
var loginTask = PlayFabClientAPI.LoginWithCustomIDAsync(request);
entityKey = loginTask.Result.Result.EntityToken.Entity;
```

### [API](#tab/login-api-new-user)

```json
{
  "CustomId": "{{Username}}",
  "CreateAccount": true,
  "TitleId": "{{TitleId}}"
}
```

***

After a successful sign-in, the API will return some sets of data, such as the **SessionTicket**, the user's **PlayFab ID**, and the **EntityToken**. These can be seen in the direct response from the API, detailed below.

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "SessionTicket": "{{SessionTicket}}",
        "PlayFabId": "{{PlayFabID}}",
        "NewlyCreated": false,
        "SettingsForUser": {
            "NeedsAttribution": false,
            "GatherDeviceInfo": true,
            "GatherFocusInfo": true
        },
        "LastLoginTime": "2023-08-01T17:09:54.508Z",
        "EntityToken": {
            "EntityToken": "{{EntityToken}}",
            "TokenExpiration": "2023-08-04T21:20:35Z",
            "Entity": {
                "Id": "{{Player ID}}",
                "Type": "title_player_account",
                "TypeString": "title_player_account"
            }
        },
        "TreatmentAssignment": {
            "Variants": [],
            "Variables": []
        }
    }
}
```

***

Once you get the `"code":200` returned from the API or you get information in the `loginTask` from the C# example above, you're authenticated and good to go on to the next step!

## Step 3 - Set up your starting inventory

Now that you're logged in with a valid player (or created a new player), your first step should be to set that player's starting inventory. For this, we'll use the [ExecuteInventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations) API call.

> [!NOTE]
> The ExecuteInventoryOperations call allows us to execute multiple/batch [InventoryOperations](/rest/api/playfab/economy/inventory/execute-inventory-operations) on the player's inventory. The types of operations supported are:
>
> - Add
> - Delete
> - Purchase
> - Subtract
> - Transfer
> - Update

For this example, we'll add the items corresponding to our game. These are three instances of Stone, one instance of Cream, and one instance of Gold (this is assuming that you have created more items, if not, please do so before continuing). But instead of simply using the **Add** operation, we use the **Purchase** operation, and we purchase the required instances as free.

> [!NOTE]
> For this step to work, you must first have created the items in your title in Game Manager.

The snippets below will show you how to make those calls in bulk in both C# and using PlayFab's API.

### [C# SDK](#tab/starting-inventory-csharp)

In this C# example, you can see that we start by setting the purchasePrice as a standard value for all transactions, this is because we'll make them all have a price of 0.

Any one item can have multiple prices, hence why the `purchasePrice` variable is of type `List<PurchasePriceAmount>`.

The next aspect you may notice is that the request takes, besides the list of `InventoryOperation`, and Entity. For which we'll create a new one using the values we got from the sign in we did before.

Finally, each `InventoryOperation` takes a `Purchase` value, though this could be each of the ones available under the **ExecuteInventoryOperations** call (Add, Delete, Purchase, Subtract, Transfer, and Update). In this case we use the `Purchase` identifier, hence we need a `new PurchaseInventoryItemsOperation`.

You also need to be clear that is the item you're looking to purchase. You do this by using the `InventoryItemReference`, which takes the item's ID as its sole parameter.

In our code, we have a method called **SearchItem({itemName})**, but you can easily replace this with a string representing the item's ID. Make sure to match each item's name (or ID) with the corresponding amount.

```csharp
var purchasePrice = new List<PurchasePriceAmount> { new PurchasePriceAmount { ItemId = freeItemId, Amount = 0 } };
var request = new ExecuteInventoryOperationsRequest 
{ 
    Entity = new PlayFab.EconomyModels.EntityKey { Id = entityKey.Id, Type = entityKey.Type },
    Operations = new List<InventoryOperation> {
        new InventoryOperation
        {
            Purchase = new PurchaseInventoryItemsOperation { 
                Item = new InventoryItemReference {AlternateId = new AlternateId { Type = "FriendlyId", Value = "Stone" } }, 
                Amount = 3, 
                PriceAmounts = purchasePrice
            }
        },
        new InventoryOperation
        {
            Purchase = new PurchaseInventoryItemsOperation {
                Item = new InventoryItemReference { AlternateId = new AlternateId { Type = "FriendlyId", Value = "Gold" } },
                Amount = 1,
                PriceAmounts = purchasePrice
            }
        },``
        new InventoryOperation
        {
            Purchase = new PurchaseInventoryItemsOperation {
                Item = new InventoryItemReference {AlternateId = new AlternateId { Type = "FriendlyId", Value = "Cream" }},
                Amount = 1,
                PriceAmounts = purchasePrice
            }
        }
    }
};
await PlayFabEconomyAPI.ExecuteInventoryOperationsAsync(request);
```

In the above code, to successfully use `AlternateId` and `FriendlyId` in your code, your items must have those values configured in Game Manager. To do this, I suggest you check [Part 2 - Using Game Manager](../craftingGame/crafting-game-game-manager.md), where we detail the steps you should follow.

### [API](#tab/starting-inventory-api)

Call the **ExecuteInventoryOperations** API endpoint with the request body shown below. Replacing the IDs with the corresponding ones. Note that `Operations` is an array, you can fill it out with multiple types of operations simultaneously.

It's important to understand that for each of the API calls you make, you must set an `X-EntityToken` header with the **EntityToken** specific to your active session or logged in user. In other words, before making any API calls, you should first **LoginWithCustomID** (in this example) and from the return message, get the **EntityToken** to be used as a header in all API calls.

```json
{
  "Operations": [
    {
      "Purchase": {
            "Item": {
                "Id": {Stone ID}
            },
            "Amount": 3,
            "PriceAmounts": [
                {
                "ItemId": {Free Item ID},
                "Amount": 0
                }
            ]
        }
    },
    {
      "Purchase": {
            "Item": {
                "Id": {Gold ID}
            },
            "Amount": 1,
            "PriceAmounts": [
                {
                "ItemId": {Free Item ID},
                "Amount": 0
                }
            ]
        }
    },
    {
      "Purchase": {
            "Item": {
                "Id": {Cream ID}
            },
            "Amount": 1,
            "PriceAmounts": [
                {
                "ItemId": {Free Item ID},
                "Amount": 0
                }
            ]
        }
    }
  ]
}
```

The next JSON is an example of a successful return message after making the call above. You'll see three distinct transactions IDs being returned because IDs are given on a per-modification basis, though this doesn't mean that there are three separate transactions. Rather the opposite, it's handled as one single transaction but with three modifications, hence we only return a single success or failure for the entire transaction regardless of the number of modifications.

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "IdempotencyId": {Idempotency ID},
        "TransactionIds": [
            "200",
            "201",
            "202"
        ],
        "ETag": "1/MjAy"
    }
}
```

***

## Step 4 - Create a bundle

Bundles allow you to group multiple items into a single item. For more information on Bundles, see our **Bundles Documentation** following [this link](/gaming/playfab/features/economy-v2/bundles).

For our example, we'll use a **Bundle** to group the items returned by the **Kitchen**, this helps us maintain the **Icebox** item. The idea behind the ice box is to be a nonconsumable item when purchasing an ice cream, even though the ice box is one of the required materials.

A high level overview of how this works is as follows. Imagine a player that has one Cream and one Icebox in its inventory. Once accessing the Kitchen store, said player must use both of those items to purchase/make one Ice Cream. Given the Icebox is nonconsumable, the expected function is to have a resulting inventory of one Ice Cream and one Icebox, having consumed only the one Cream item.

The way we handle it behind the scenes is by using a bundle with a price of one Icebox and one Cream and its return items are one Ice Cream and one Icebox. This means that the Icebox in the player's inventory will be consumed, but the same transaction that consumes it returns another one, giving the player the impression that the Icebox is always in the inventory, when in reality, the Icebox instances are different, but invisible to the player.

In order to create a bundle, you must go to the **Economy** section of your title, as you did when creating a new item. There will be a tab called **Bundles** alongside **Items**, **Currency**, and others. Once selected, a blue button appears on the top right corner of the screen saying **New bundle**.

This will then display a form similar to the one for creating a new item, with the key difference that, if you scroll down, you'll find a section titles **Items**. Here you can add the items you want the bundle to contain, which will be transferred to the player's inventory when purchased.

After clicking the **Add** button, a searchable list of all items in your catalog will pop up, here you can select the items you want to include in the bundle. As soon as you selected your items and added them, you can proceed to **Save and publish** and your bundle will now be active and selectable from stores as a purchase price.

## Step 5 - Create a store

Following our crafting game example, we must have the player purchase items from a store. There will be three distinct stores (in this case locations), the **Science Machine**, the **Alchemy Engine**, and the **Kitchen**.

We'll focus on the **Kitchen**. Here, players are able to purchase an **Ice Cream** (new item that should be created) for the price of **1 Cream** and **1 Icebox** (new item that should be created). This particular case has been chosen because it showcases how **Bundles** work alongside stores and transactions.

Stores can only be created from [Game Manager](https://developer.playfab.com) by going to the **Economy** section on your left navbar, then from the different tab options, choose **Stores** and select the blue **New store** button.

This displays a form similar to the one used when creating new items, in which the only mandatory fields are the Start Date and the Title you want to give your store. Scrolling down, you'll

## Step 6 - Add a Bundle to a Store

Now that you have your Bundle and your Store created and published. You may add the Bundle as a returnable item in your Store. To do this, go into your Store, scroll down until you see the **Items** title and select the **Add** button.

This displays the list of items in the Catalog. On the left side of the search bar, there will be a dropdown menu filled with the different types of objects, such as **Items**, **UGC Items**, **Bundles**, and **Subscription**. If you choose **Bundles** it filters the list to reflect only Bundle type items, here you should see the Bundle you created previously. Once you select the **Add** button next to the Bundle's name, and then the **Add** button at the end of the window, the Bundle will be added as a possible transaction item for that particular store.

There's one last step before continuing, setting a price for your Bundle. This price works as any other item pricing in the sense that it requires the Player to have whatever price items are required, in their inventory before accepting the purchase. To set a price, you can select the **Add new price** button to the right of your Bundle and from the items list, select whatever items you want to be the price. In our case, we want the price to be **1 Icebox** and **1 Cream**.

Now that your Bundle has been added to your Store and has been priced accordingly, we can move on to the next step.

## Step 7 - Purchase a Bundle

Once your Bundle and your Store are created, and your Bundle is linked to your Store, you can now purchase that Bundle and get the resulting items into your inventory.

To purchase a Bundle, from a player perspective, you may use the PlayFab API's **PurchaseInventoryItems**. Which works not only with bundles, but with single items too.

### [API](#tab/purchase-items-api)

In the following case, we're looking to purchase **1 Bundle** with a price of **1 Icebox** and **1 Cream**. We're going to use **PriceAmount's** array properties to set more than 1 item as the price. Just make sure you have given your Bundle a **FriendlyId**.

```json
{
  "Item": {
    "AlternateId": {
        "Type": "FriendlyId",
        "Value": "Ice Cream and Ice Box"
    }
  },
  "Amount": 1,
  "PriceAmounts": [
    {
        "ItemId": "0d2ab329-2fc5-4ae1-9e3c-19f9fc9bbf86",
        "Amount": 1
    },
    {
        "ItemId": "e5276289-f839-4bde-acce-309ea7959e45",
        "Amount": 1
    }
  ],
  "DeleteEmptyStacks": true,
  "StoreId": "f116f1d4-64f9-4be7-9660-a3c1f021100b"
}
```

The next snippet is the expected return after a successful API call.

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "ETag": "1/MjEz",
        "IdempotencyId": "d710508f-defc-4382-bbd1-a3576417b3f7",
        "TransactionIds": [
            "212",
            "213"
        ]
    }
}
```

> [!NOTE]
> You'll notice in the response, that you get 2 different `TransactionIds`. This is because the `DeleteEmptyStacks` property is handled as an addiitonal transaction. In the previous example, transaction 212 corresponds to the purchase of the bundle, and transaction 213 to the deletion of the empty Cream stack (assuming you only had 1 Cream in your inventory).

### [C# SDK](#tab/purchase-items-csharp)

In terms of how the C# code should look like, below you may find a snippet of our example.

```csharp
var purchaseRequest = new PurchaseInventoryItemsRequest
{
    Entity = new PlayFab.EconomyModels.EntityKey { Id = entityKey.Id, Type = entityKey.Type },
    Item = new InventoryItemReference { Id = "34167d9f-c8d7-4e17-9a87-b6af1fc389b2" }, //bundle id
    Amount = 1,
    PriceAmounts = new List<PurchasePriceAmount>() { 
        new PurchasePriceAmount { 
            ItemId = "e5276289-f839-4bde-acce-309ea7959e45", 
            Amount = 1 
        }, //cream id and quantity
        new PurchasePriceAmount { 
            ItemId =  "0d2ab329-2fc5-4ae1-9e3c-19f9fc9bbf86", 
            Amount = 1 
        } //icebox id and quantity
    }, 
    StoreId = "f116f1d4-64f9-4be7-9660-a3c1f021100b",
    DeleteEmptyStacks = true
};

var result = await PlayFabEconomyAPI.PurchaseInventoryItemsAsync(purchaseRequest);
```

***

## See also

- [Economy v2 overview](/gaming/playfab/features/economy-v2/)

- [Settings](/gaming/playfab/features/economy-v2/settings)

- [Stores](/gaming/playfab/features/economy-v2/stores?tabs=creating-store-game-manager)
