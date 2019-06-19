---
title: Stores and sales
author: v-thopra
description: Describes how to configure a Store with a selection of items available in real money or virtual currency.
ms.author: v-thopra
ms.date: 10/26/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores, catalogs, currencies
ms.localizationpriority: medium
---

# Stores and sales

In PlayFab, **Stores** are built upon [Catalogs](../items/catalogs.md) and [Currencies](../economy/currencies.md). Your primary catalog should define all of the items in your game and assign them prices in the currencies that you've created. Your stores will define subsets of those items - making them available for purchase at specific prices that can be different than the catalog prices.

A store allows you to single out a specific set of items, and make them available at specific prices for a set time period.

This tutorial illustrates the best practices for defining stores based on virtual currency and real money.

## Requirements

- Familiarity with the PlayFab [Game Manager](../../config/gamemanager/quickstart.md).
- You must have defined one or more [Virtual Currencies](../economy/currencies.md). The latter example in this tutorial uses:
  - **SS** (**Silver Shekels**)
  - **GS** (**Gold Shekels**).

- You must have a *primary catalog* with one or more items defined.
  - The first example uses multiple item/bundles, similar to the ones described in the [Drop Tables](../items/drop-tables.md) tutorial.
  - The second example in this tutorial uses small, medium, and large health potions.

### Best practice

Catalog prices should be fixed long-term - they define the *real* price of an item.

Stores should be *temporary*, being added and removed according to your LiveOps strategies.

> [!NOTE]
> Expect to get most of your revenue by cycling stores, and transitioning items in and out of active stores.

## General information about stores and catalog pricing

Please note the following information about stores and currencies:

- **Pricing**: The prices defined in the catalog should be defined as the *regular* price of an item. Stores allow you to define a temporary sale price for an item, utilizing the common retail tactic. Alternately, stores can provide a temporary price for an item that is not normally available for sale at all.

- **Zero Cost**: If the cost of an item in a particular currency is unset (**null**) or **zero**, it cannot be purchased using that currency. This is true for both catalogs and stores. This allows you to make items available for exclusively free currencies, or exclusively premium currencies, by leaving the entries for the other currencies blank or by resetting them to **zero**.

- **Real Money**: The **RM** currency is available in all catalogs and stores. RM is a restricted currency key that indicates *real money transactions only*. You should only charge RM for items of significant value, or bundles/containers which contain premium currency.

- **Prices are Either/Or**: If two prices are defined on an item, the item can be purchased for one or the other. It is *not possible* to require two currencies for a single item.

## Defining a real money store

In your **Game Manager**:

- Navigate to your **Title**.
- Select **Economy** from your menu on the left.
- On the **Catalogs** tab, select your primary catalog and select **Stores**.
- Select the **New Store** button.

In the [Drop Tables](../items/drop-tables.md) example, we created an 11-item drop bundle. For this example, we will make 3 similar bundles available in a real money store.

> [!NOTE]
> Any item can be sold for real money, but it is a best practice to make only *specific* valuable items or bundles directly available.

The screenshot provided below shows a complete new **Store**, containing three **Item Bundles** available for **Real Money**.

![Game Manager - economy - edit Store](media/tutorials/game-manager-economy-edit-store.png)  

The specifics for completing real money purchases are covered in our advanced tutorial, [non-receipt payment processing](../economy/non-receipt-payment-processing.md).

### Best practice

How you use real money is largely dependent on the specific design of your game. Direct purchase of in-game items is valid, but less common.

More typically, your game should allow purchase of a premium virtual currency using real money. You can cycle multiple stores with different ratios of premium currency to real money.

> [!TIP]
> The primary takeaway is - make sure your players can *always* give you money.

## Defining a virtual-currency store

Let's get into the gritty details and code for purchasing in-game items with virtual currency.

The initial steps are nearly identical to the preceding example:

- Create 3 new items: **Small**, **Medium**, and **Large Health Potions** with a *free* **Currency** price, and a *premium* **Currency** price.
- Create a new store which puts these items on sale.

![Game Manager - Economy - New Store](media/tutorials/game-manager-economy-new-store.png)  

To purchase a single item for virtual currency, use the [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) method, as described in our [Stores quickstart](quickstart.md).

This tutorial, however, will cover the more advanced topic of purchasing multiple items in a single purchase.

Your first step in this process should be to get the store, and display it to the user.

```csharp
void GetVcStore()
{
    var primaryCatalogName = "TestCatalog-001"; // In your game, this should just be a constant matching your primary catalog
    var storeId = "Potion Store"; // In your game, this should be a constant for a permanent store, or retrieved from titleData for a time-sensitive store
    var request = new GetStoreItemsRequest
    {
        CatalogVersion = primaryCatalogName,
        StoreId = storeId
    };
    PlayFabClientAPI.GetStoreItems(request, LogSuccess, LogFailure);
}
```

The `LogSuccess` callback in this example receives a [GetStoreItemsResult](xref:titleid.playfabapi.com.client.title-widedatamanagement.getstoreitems#getstoreitemsresult) that contains a full description of all the items in the store, their *store* prices, and any additional metadata contained in the store itself.

### Best practice

Games with stores should call and cache their primary catalog using the [GetCatalogItems](xref:titleid.playfabapi.com.server.title-widedatamanagement.getcatalogitems) method. This allows you to display both the catalog price and the store price, along with a 10% OFF or similar bonus decoration beside items for sale.

> [!TIP]
> Players are more likely to buy items on sale, especially if the sale is a limited-time offer.

At this point, it is the responsibility of your GUI code to present the user with the opportunity to select which items they wish to buy and how many.

- Between your game and PlayFab, the remaining steps are several separate API calls, but you can make the sequence of multiple calls invisible to the player.

- Collect all information about the purchase up front, and make the full sequence of calls after *all* player input is collected.

```csharp
void DefinePurchase()
{
    var primaryCatalogName = "TestCatalog-001"; // In your game, this should just be a constant matching your primary catalog
    var storeId = "Potion Store"; // At this point in the process, it's just maintaining the same storeId used above
    var request = new StartPurchaseRequest
    {
        CatalogVersion = primaryCatalogName,
        StoreId = storeId,
        Items = new List<ItemPurchaseRequest> {
             // The presence of these lines are based on the results from GetStoreItems, and user selection - Yours will be more generic
            new ItemPurchaseRequest { ItemId = "Small Health Potion", Quantity = 20,},
            new ItemPurchaseRequest { ItemId = "Medium Health Potion", Quantity = 100,},
            new ItemPurchaseRequest { ItemId = "Large Health Potion", Quantity = 2,},
        }
    };
    PlayFabClientAPI.StartPurchase(request, result => { Debug.Log("Purchase started: " + result.OrderId); }, LogFailure);
}
```

During the item selection process, you must allow the user to select which currency they wish to spend for these items. In this example, all items have costs in **SS** and **GS**, which means the user has a choice of which currency to spend.

### Restriction

Only *one* virtual currency is allowed in a single purchase. All selected items must be purchasable with a *single currency*.

The currency must be specified in the call, which is important when there are multiple possible currencies. The sequence will fail if there are items in the request which don't have corresponding costs in the selected currency.

### Best practice

Avoid confusion for your player by ensuring that all items in a store have consistent options.

Real money items should be in a separate store from premium VC items, and again separate from free VC items. If a single store allows multiple currencies, then *all* items in that store should consistently use the same set of multiple currencies. Create as many stores as you need to provide a smooth customer experience.

```csharp
void DefinePaymentCurrency(string orderId, string currencyKey)
{
    var request =new PayForPurchaseRequest {
        OrderId = orderId, // orderId comes from StartPurchase above
        Currency = currencyKey, // User defines which currency they wish to use to pay for this purchase (all items must have a defined/non-zero cost in this currency)
        ProviderName = "Facebook" // Payment provider used to fund the purchase.
    };
    PlayFabClientAPI.PayForPurchase(request, LogSuccess, LogFailure);
}
```

Finally, once the purchase is fully defined, you can complete the process, as shown below.

```csharp
// Unity/C#
void FinishPurchase(string orderId)
{
    var request = new ConfirmPurchaseRequest { OrderId = orderId };
    PlayFabClientAPI.ConfirmPurchase(request, LogSuccess, LogFailure);
}
```

### Best practice

Any single API call can fail for a variety of reasons. Wireless devices such as phones can often have intermittent connectivity, and any internet call can fail due to random latency.

Each call should check for multiple failure conditions. If the response indicates that the purchase request is invalid (unable to buy multiple items with a single currency for example) then you should abort (and possibly re-design your store).

If the response indicates a connectivity failure, you can try again with an exponential back-off delay.

## Conclusion

Stores are a great mechanism for encouraging your players to purchase items.

Stores work with any kind of virtual currency. Stores can also work with real money through an alternate set of API methods.

- You can set up a single-item purchase with VC via [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem).
- You can set up a multiple-item purchase with real money via the sequence:
  - [StartPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.startpurchase)
  - [PayForPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.payforpurchase)
  - [ConfirmPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.confirmpurchase)

For more information on real money purchases, consult our advanced tutorial [Non-Receipt Payment Processing](../economy/non-receipt-payment-processing.md).

For advanced store usage, see our [Custom Stores for Player Segments](../../commerce/stores/custom-stores-for-player-segments.md) tutorial.
