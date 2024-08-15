---
title: Economy v2 Subscriptions
author: sranthar
description: Introduction to Economy v2 Subscriptions.
ms.author: sranthar
ms.date: 03/21/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, catalog, subscriptions
ms.localizationpriority: medium
---

# Economy v2 Subscriptions

Subscriptions allow you to grant time based access to durable goods. Items within a subscription are unpacked in a player's inventory after calling [GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items). 

> [!NOTE]
>This article focuses on virtual subscriptions, or the subscriptions that live inside of your game. We have a new feature in **Private Preview** where you can link virtual subscriptions to real-world marketplaces using PlayFab's Inventory Redeem APIs. Here is where you can find more information about how to do this:
>- [IOS Subscription Redemption](tutorials/marketplace-redemption/IOS-Subscription-Redemption.md)
>- [Google Play Store Subscription Redemption](tutorials/marketplace-redemption/Google-Subscription-Redemption.md)
>
>To access this feature, send an email to **PFEconomyPreviews@microsoft.com** with the subject **PlayFab Mobile Subscriptions** along with your PlayFab Title ID and we will enable the feature in your environment.

## Creating a Subscription

To create a subscription, you must first make sure you have published [Catalog Items](quickstart.md?pivots=API#step-3---publish-an-item-to-the-catalog), [Currency](quickstart.md?pivots=API#part-2-inventory-and-virtual-currencies-overview), or [User Generated Content (UGC)](ugc/quickstart.md) that you want to be accessible/purchaseable in your game. To set up your catalog before creating a subscription, see [Economy V2 Quickstart](quickstart.md)

### [GameManager](#tab/creating-store-game-manager)

1. Navigate to **Economy** > **Catalog (V2)**.

2. Under the **Subscriptions** tab, select **New Subscription**.

### [API](#tab/creating-store-api)

You can use the [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item) API to create a subscription.

An example `CreateDraftItem` API request to create a subscription:

```json
{
  "Item": {
   "Type": "subscription",
    "Title": {
      "NEUTRAL": "Holiday Skins Pass"
    },
    "StartDate": "2023-03-07T00:01:00.0000000Z",
    "ItemReferences":[
      {
        "Id":"{{GlowingGlovesItemID}}",
        "Amount": 1
      }, 
      {
        "Id":"{{ShinyShoesItemID}}", 
        "Amount": 1
      }
    ],
        "PriceOptions": {
          "Prices": [
        {
            "UnitDurationInSeconds":604800,
              "Amounts": [
                {
                    "ItemId": "{{DiamondItemID}}",
                    "Amount": 5
                },
                {
                    "ItemId": "{{GoldItemID}}",
                    "Amount": 10
                }
                ]
        },      
        {
            "UnitDurationInSeconds":2628000,
              "Amounts": [
                {
                    "ItemId": "{{DiamondItemID}}",
                    "Amount": 7
                },
                {
                    "ItemId": "{{GoldItemID}}",
                    "Amount": 12
                }
                ]
        } ]
          }
        },
  "Publish": true
}

```

***
The above Holiday Skins Pass subscription grants two items, `Glowing Gloves` and `Shiny Shoes` at two price points for two different validity periods. The first price set of 5 diamonds and 10 gold ensures that the subscription is valid for one week while the second price set of 7 diamonds and 12 gold ensures that the subscription is valid for one month. Do note time duration needs to be set in seconds. 

This should return a response that the subscription has been created and published:

```json
{
  "code": 200,
    "status": "OK",
    "data": {
        "Item": {
            "Id": "{{NewlyCreatedSubscriptionItemID}}",
            "Type": "subscription",
            "AlternateIds": [],
            "Title": {
                "NEUTRAL": "Holiday Skins Pass"
            },
    ...
}
```

***
## Subscriptions within Inventory

Subscriptions will be present in the player's inventory collection with an ID, StackId, expiration date, and display properties. Everything in a subscription can be modified just like any other item using Add, Subtract, and Update, etc.

You can use the [GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items) with a Type filter to retrieve all subscriptions a player currently has.

```json
{ 
    "Entity": {
        "Type": "title_player_account", 
        "Id": "ID" 
    }, 
    "CollectionId": "default", 
    "Filter": "type eq 'subscription'"
}

**Sample Response**

{
    "code": 200,
    "status": "OK",
    "data": {
        "Items": [
            {
                "Id": "{{SubscriptionID}}",
                "StackId": "default",
                "DisplayProperties": {},
                "Type": "subscription",
                "ExpirationDate": "2023-08-27T23:59:59Z"
            }
        ],
        "ETag": "1/Mw=="
    }
}
```

An unexpired subscription is unpacked at read time. The unpacked items have the expected ID, a unique compound StackId composed of the Subscription ID and the subscription's StackId. The amount is set to the amount configured in the subscription item reference. These unpacked items are immutable and can't be modified using Add, Subtract, Update, etc.

```json

{ 
    "Entity": {
        "Type": "title_player_account", 
        "Id": "ID" 
    }, 
    "CollectionId": "default", 
    "Filter": "StackId eq 'SubscriptionItemID:default'"
}

**Sample Response**

{
    "code": 200,
    "status": "OK",
    "data": {
        "Items": [
            {
                "Id": "{{GlowingGlovesItemID}}",
                "StackId": "{{SubscriptionID:default}}",
                "DisplayProperties": {},
                "Amount": 1,
                "Type": "catalogItem"
            },
            {
                "Id": "{{ShinyShoesItemID}}",
                "StackId": "{{SubscriptionID:default}}",
                "DisplayProperties": {},
                "Amount": 1,
                "Type": "catalogItem"
            }
        ],
        "ETag": "1/NQ=="
    }
}
```
Subscription unpacking occurs before filtering and paging such that subscription items can be reliably filtered and paged just like any other items in a collection.

You can use [UpdateInventoryItems](/rest/api/playfab/economy/inventory/update-inventory-items), [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items), and [SubtractIventoryItems](/rest/api/playfab/economy/inventory/subtract-inventory-items) to update the expiration date of a Subscription for a player.

`UpdateInventoryItems` API call here's updating the Subscription's expiration date.

```json
{
   "Entity": { 
      "Type": "title_player_account", 
      "Id": "{{ID}}" 
    }, 
  "CollectionId": "default", 
   "Item": { 
        "Id": "{{SubscriptionID}}", 
        "StackId": "default",
        "DisplayProperties": {},
        "Type": "subscription",
        "ExpirationDate": "2023-03-27T23:59:59Z" 
    } 
} 
```
`AddInventoryItems` API call here's extending the expiration date by increasing the DurationInSeconds parameter.

```json
{
    "Entity": { 
        "Type": "title_player_account", 
        "Id": "{{ID}}" 
    }, 
    "CollectionId": "default", 
    "Item": { 
        "Id": "{{SubscriptionID}}" 
    }, 
    "DurationInSeconds":2628000 
} 
```
`SubtractInventoryItems` API call here's decreasing the expiration date by reducing the DurationInSeconds parameter.

```json
{
    "Entity": { 
        "Type": "title_player_account", 
        "Id": "{{ID}}" 
    }, 
    "CollectionId": "default", 
    "Item": { 
        "Id": "{{SubscriptionID}}" 
    }, 
    "DurationInSeconds":60 
} 

```

