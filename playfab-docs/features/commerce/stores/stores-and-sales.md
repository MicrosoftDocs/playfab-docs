# Stores and Sales

Stores are built upon [Catalogs](../items/catalogs.md) and [Currencies](../economy/currencies.md). Your primary catalog should define all of the items in your game. Alternately, a store allows you to single out a specific set of items, and make them available for a set time period. The definition of a store is a small subset of items, available for purchase at a specific price.

## Requirements

- [Game Manger](https://api.playfab.com/docs/tutorials/landing-analytics/game-manager-tour)
- One or more [Virtual Currencies](../economy/currencies.md) defined
  - The latter example on this guide uses: SS (Silver Shekels) and GS (Gold Shekels).

- A primary [Catalog](../items/catalogs.md) with one or more items defined
  - The first example uses multiple item bundles, similar to the ones described in the [Drop Tables](../items/drop-tables.md) tutorial.
  - The second example in this tutorial uses Small, Medium, and Large, Health Potions.

**Best Practice**: Catalog prices should be fixed long term and define the "real" price of an item. Stores should be temporary, being added and removed according to your LiveOps strategies. Expect to get most of your revenue from cycling stores, and transitioning items in and out of active stores.

Please note the following information about Stores and Currencies: 

- **Pricing**: Store and Catalog pricing is important. The prices defined in the Catalog should be defined as the "regular" price of an item. Stores allow you to define a temporary "sale" price for an item, utilizing the common retail tactic. Alternately stores can provide a temporary price for an item that is not normally available for sale at all.

- **Zero Cost**: If a cost is unset (null) or zero, it cannot be purchased using that currency. This is true for both Catalogs and Stores. You can make items available for exclusively free currencies, or exclusively premium currencies by leaving entries blank, or resetting them to zero.

- **Real Money**: The "RM" currency is available in all Catalogs and Stores.  RM is a restricted currency key that indicates real money transactions only. You should only charge RM for items of significant value, or bundles/containers which contain premium currency.

- **Prices are "Either/Or"**: If two prices are defined on an item, the item can be purchased for one or the other. It is not possible to require two currencies for a single item.

## Defining a Real-Money Store

Game Manager: Navigate to your title -> Economy -> {your primary catalog} -> Stores -> New Store

In the [Drop Tables](../items/drop-tables.md) example, we created an "11-Item Drop" Bundle. For this example, we will make 3 similar bundles available in a real-money store. Any item can be sold for real money, but it's a best practice to make only specific valuable items/bundles available directly for real money.

The following screenshot demonstrates a complete new store, placing three item-bundles available for real money:

![Game Manager - Economy - Edit Store](media/tutorials/game-manager-economy-edit-store.png)  

The specifics for completing real money purchases are covered in our advanced tutorial, [Non-Receipt Payment Processing](../economy/non-receipt-payment-processing.md).

**Best Practice**: How you use real money is largely dependent on the specific design of your game. Direct purchase of in-game items is valid, but less common. More typically, your game should allow purchase of a premium virtual currency using real money. You can cycle multiple stores with different ratios of premium currency to real-money.

The key takeaway should be: make sure your players can always give you money.

## Defining a Virtual-Currency Store

In this example we'll get into the gritty details and code for trading virtual currency for in-game items.

The steps are nearly identical to the preceding example.  This time we will create 3 new items: Small, Medium, and Large, Health Potions with a free currency price, and a premium currency price. We'll create a new store which puts these items on sale:

![Game Manager - Economy - New Store](media/tutorials/game-manager-economy-new-store.png)  

To purchase a single item for VC, you can use our [PurchaseItem](https://api.playfab.com/documentation/client/method/PurchaseItem) method, as described in our [Player inventory](../../data/playerdata/player-inventory.md) tutorial. This tutorial, however, will cover the more advanced topic of setting up multiple items in a single purchase.

First step, get the store and display it to the user:

```chsarp
// Unity/C#
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

The LogSuccess callback in this example gets a full description of all items in the store, their prices in the store, and any additional metadata stored within the store itself.

**Best Practice**: Games with stores should call and cache their primary catalog with GetCatalog. This allows you to display both the catalog price and the store price, along with a "10% OFF" or similar bonus decoration beside items for sale. Players are more likely to buy items on sale, especially if the sale is a limited-time offer.

At this point, it is the responsibility of your GUI code to present the user with the opportunity to select which items they wish to buy and how many.

**Best Practice**: Between your game and PlayFab, the remaining steps are several separate API calls, but you can make the sequence of multiple calls invisible to the player. Collect all information about the purchase up-front, and make the full sequence of calls after all player input is collected.

```chsarp
// Unity/C#
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

During the item selection process, you must allow the user to select which currency they wish to spend for these items. In this example, all items have costs in SS and GS, which means the user has a choice of which currency to spend.

**Restriction**: Only one VC is allowed in a single purchase. All selected items must be purchasable with a single currency. The currency must be specified in the call, which is important when there are multiple possible currencies. The sequence will fail if there are items in the request which don't have corresponding costs in the selected currency.

**Best Practice**: Avoid this confusion for your player. All items in a store should have consistent options. Real-Money items should be in a separate store from premium VC items, and again separate from free VC items. If a single store allows multiple currencies, then ALL items in that store consistently use the same set of multiple currencies. Create as many stores as you need to provide a smooth customer experience.

```chsarp
// Unity/C#
void DefinePaymentCurrency(string orderId, string currencyKey)
{
    var request =new PayForPurchaseRequest {
        OrderId = orderId, // orderId comes from StartPurchase above
        Currency = currencyKey // User defines which currency they wish to use to pay for this purchase (all items must have a defined/non-zero cost in this currency)
    };
    PlayFabClientAPI.PayForPurchase(request, LogSuccess, LogFailure);
}
```

Finally, once the purchase is fully defined, you can complete the process:

```chsarp
// Unity/C#
void FinishPurchase(string orderId)
{
    var request = new ConfirmPurchaseRequest { OrderId = orderId };
    PlayFabClientAPI.ConfirmPurchase(request, LogSuccess, LogFailure);
}
```

**Best Practice**: Any single API call can fail for a variety of reasons. Wireless devices such as phones can often have intermittent connectivity, and any internet call can fail due to random latency. Each call should check for multiple failure conditions. If the response indicates that the purchase request is invalid (unable to buy multiple items with a single currency for example) then you should abort (and possibly re-design your store). If the response indicates a connectivity failure, you can try again with an exponential back-off delay.

## Conclusion

Stores are a great mechanism for encouraging your players to purchase items. Stores work with any kind of virtual currency. Stores can also work with real-money through an alternate set of API methods.

You can set up a single-item purchase with VC via [PurchaseItem](https://api.playfab.com/documentation/client/method/PurchaseItem). You can set up a multiple-item purchase with VC via the sequence: [StartPurchase](https://api.playfab.com/documentation/client/method/StartPurchase), [PayForPurchase](https://api.playfab.com/documentation/client/method/PayForPurchase), and [ConfirmPurchase](https://api.playfab.com/documentation/client/method/ConfirmPurchase). To perform real money purchases, consult our advanced tutorial [Non-Receipt Payment Processing](../economy/non-receipt-payment-processing.md).

For advanced Store usage, see our [A/B Testing with Stores](https://api.playfab.com/docs/tutorials/landing-analytics/ab-store) tutorial.