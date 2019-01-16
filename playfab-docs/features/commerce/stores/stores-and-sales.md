---
title: Stores and Sales
author: v-thopra
description: Describes how to configure a Store with a catalog of items available in real money or virtual currency.
ms.author: v-thopra
ms.date: 26/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, stores, catalogs, currencies
ms.localizationpriority: medium
---

# Stores and Sales

**Stores** are built upon [Catalogs](../items/catalogs.md) and [Currencies](../economy/currencies.md). Your primary **Catalog** should define all of the items in your **Game**.

Alternately, a **Store** allows you to single out a specific set of **Items**, and make them available for a set time period. The definition of a **Store** is a small subset of **Items**, available for purchase at a specific price.

## Requirements

- [Game Manager](../../config/gamemanager/quickstart.md)
- One or more [Virtual Currencies](../economy/currencies.md) defined. The latter example on this guide uses:
    - **SS** (**Silver Shekels**)
    - **GS** (**Gold Shekels**).

- A primary [Catalog](../items/catalogs.md) with one or more items defined
  - The first example uses multiple **Item Bundles**, similar to the ones described in the [Drop Tables](../items/drop-tables.md) tutorial.
  - The second example in this tutorial uses **Small**, **Medium**, and **Large Health Potions**.

### Best Practice

**Catalog** prices should be fixed long-term, and define the *real* price of an **Item**.

**Stores** should be *temporary*, being added and removed according to your **LiveOps** strategies.

> [!NOTE]
> Expect to get most of your revenue by cycling **Stores**, and transitioning **Items** in and out of active **Stores**.

## General information about Stores and Catalog pricing

Please note the following information about **Stores** and **Currencies**:

- **Pricing**: The prices defined in the **Catalog** should be defined as the **regular** price of an **Item**. **Stores** allow you to define a temporary **sale** price for an **Item**, utilizing the common retail tactic. Alternately **Stores** can provide a temporary price for an **Item** that is not normally available for sale at all.

- **Zero Cost**: If a cost is unset (**null**) or **zero**, it cannot be purchased using that **Currency**. This is true for both **Catalogs** and **Stores**. You can make **Items** available for exclusively free **Currencies**, or exclusively premium **Currencies** by leaving entries blank, or resetting them to **zero**.

- **Real Money**: The **RM** currency is available in all **Catalogs** and **Stores**.  **RM** is a restricted **Currency Key** that indicates *real money transactions only*. You should only charge **RM** for **Items** of significant value, or **Bundles**/**Containers** which contain premium **Currency**.

- **Prices are Either/Or**: If two prices are defined on an **Item**, the **Item** can be purchased for one or the other. It is *not possible* to require two **Currencies** for a single **Item**.

## Defining a real-money Store

In your **Game Manager**:

- Navigate to your **Title**.
- Select **Economy** from your menu on the left.
- On your **Catalogs** tab on the **Edit Store** screen, select the **Stores** column.
- Select the **New Store** button.

In the [Drop Tables](../items/drop-tables.md) example, we created an **11-Item Drop Bundle**. For this example, we will make 3 similar **Bundles** available in a **Real Money Store**.

> [!NOTE]
> Any **Item** can be sold for **Real Money**, but it is a best practice to make only *specific* valuable **Items**/**Bundles** directly available.

The screenshot provided below demonstrates a complete new **Store**, placing three **Item Bundles** available for **Real Money**.

![Game Manager - economy - edit Store](media/tutorials/game-manager-economy-edit-store.png)  

The specifics for completing **Real Money** purchases are covered in our advanced tutorial, [non-receipt payment processing](../economy/non-receipt-payment-processing.md).

### Best practice

How you use **Real Money** is largely dependent on the specific design of your **Game**. Direct purchase of in-**Game Items** is valid, but less common.

More typically, your **Game** should allow purchase of a premium **Virtual Currency** using **Real Money**. You can cycle multiple **Stores** with different ratios of premium **Currency** to **Real Money**.

> [!TIP]
> The primary takeaway should be to make sure your **Players** can *always* give you money.

## Defining a virtual-currency store

Let's get into the gritty details and code for trading **Virtual Currency** for in-**Game Items**. The steps are nearly identical to the preceding example.

This time we will create 3 new items: **Small**, **Medium**, and **Large Health Potions** with a free **Currency** price, and a premium **Currency** price. We'll create a new **Store** which puts these **Items** on sale.

![Game Manager - Economy - New Store](media/tutorials/game-manager-economy-new-store.png)  

To purchase a single **Item** for **VC**, you can use our **[PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem)** method, as described in our [Player inventory](../../data/playerdata/player-inventory.md) tutorial. This tutorial, however, will cover the more advanced topic of setting up multiple **Items** in a single purchase.

Your first step in this process should be to get the **Store** and display it to the **User**.

```csharp
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

The **LogSuccess** callback in this example gets a full description of all **Items** in the **Store**, their prices in the **Store**, and any additional metadata stored within the **Store** itself.

### Best practice

Games with **Stores** should call and cache their primary **Catalog** with **GetCatalog**. This allows you to display both the catalog price and the **Store** price, along with a **10% OFF** or similar bonus decoration beside **Items** for sale.
> [!TIP]
> **Players** are more likely to buy **Items** on sale, *especially if the sale is a limited-time offer*.

At this point, it is the responsibility of your **GUI** code to present the **User** with the opportunity to select which **Items** they wish to buy and how many.

- Between your **Game** and **PlayFab**, the remaining steps are several separate **API** calls, but you can make the sequence of multiple calls invisible to the **Player**.

- Collect all information about the purchase up front, and make the full sequence of calls after *all* **Player** input is collected.

```csharp
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

During the **Item** selection process, you must allow the **User** to select which **Currency** they wish to spend for these **Items**. In this example, all **Items** have costs in **SS** and **GS**, which means the **User** has a choice of which **Currency** to spend.

### Restriction

Only *one* **VC** is allowed in a single purchase. All selected **Items** must be purchasable with a *single currency*.

The **Currency** must be specified in the call, which is important when there are multiple possible **Currencies**. The sequence will fail if there are **Items** in the request which don't have corresponding costs in the selected **Currency**.

### Best practice

Avoid confusion for your **Player** by ensuring that all **Items** in a **Store** have consistent options.

**Real-Money Items** should be in a separate store from premium **VC Items**, and again separate from free **VC Items**. If a single **Store** allows multiple **Currencies**, then *all* **Items** in that **Store** should consistently use the same set of multiple **Currencies**. Create as many **Stores** as you need to provide a smooth customer experience.

```csharp
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

Any single **API** call can fail for a variety of reasons. Wireless devices such as phones can often have intermittent connectivity, and any internet call can fail due to random latency.

Each call should check for multiple failure conditions. If the response indicates that the purchase request is invalid (unable to buy multiple items with a single currency for example) then you should abort (and possibly re-design your **Store**).

If the response indicates a connectivity failure, you can try again with an exponential back-off delay.

## Conclusion

**Stores** are a great mechanism for encouraging your **Players** to purchase **Items**.

**Stores** work with any kind of **Virtual Currency**. **Stores** can also work with **Real Money** through an alternate set of **API** methods.

- You can set up a single-item purchase with **VC** via [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem).
- You can set up a multiple-**Item** purchase with **VC** via the sequence: [StartPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.startpurchase), [PayForPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.payforpurchase), and [ConfirmPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.confirmpurchase). To perform **Real Money** purchases, consult our advanced tutorial [Non-Receipt Payment Processing](../economy/non-receipt-payment-processing.md).

For advanced **Store** usage, see our [Custom Stores for Player Segments](../../commerce/stores/custom-stores-for-player-segments.md) tutorial.
