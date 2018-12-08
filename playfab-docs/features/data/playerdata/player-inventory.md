---
title: Using Player inventory
author: v-thopra
description: Describes how to view and work with the player inventory using the PlayFab API.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, playfab api, player data, inventory
ms.localizationpriority: medium
---

# Player inventory

## Requirements

In order to use the **Player Inventory**, you must have a **Catalog** defined for your **Title**. Please read our [Catalogs](../../commerce/items/catalogs.md) tutorial for more information. 

> [!NOTE]
> Optionally, you can also define **Stores** for your **Catalog**.

While a **Catalog** is the list of all of the **Items** available in the game, a **Store** is a subset of **Items** from the **Catalog** that has the option of unique pricing.

Multiple **Stores** can be defined per **Catalog**, so that you can have distinct sets of **Items** for presentation to the **Player** based upon user segmentation or other factors.

Once you have defined a **Catalog** through the **[Game Manager](https://developer.playfab.com/)** or though our **Admin [SetCatalogItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.setcatalogitems)** or **[UpdateCatalogItems](xref:titleid.playfabapi.com.admin.title-widedatamanagement.updatecatalogitems) API** calls, you will be able to use a wide variety of **Inventory API** calls on the **Client** and **Server**.

## API Overview

All **Inventory API** calls are designed to be *server-authoritative* and secure. Used properly, customers will not be able to cheat or acquire items they did not earn.

**Clients**:

- Buy Items with **Virtual Currency**: **[PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem)**
- Make **Real Mone**y purchases: **[StartPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.startpurchase), [PayForPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.payforpurchase), [ConfirmPurchase](xref:titleid.playfabapi.com.client.playeritemmanagement.confirmpurchase)**
- Can view the **Items** a **Player** has: **[GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory)**
- Can remove **Items**: **[ConsumeItem](xref:titleid.playfabapi.com.client.playeritemmanagement.consumeitem), [UnlockContainerInstance](xref:titleid.playfabapi.com.client.playeritemmanagement.unlockcontainerinstance)**
- Can trade **Items**: **[OpenTrade](xref:titleid.playfabapi.com.client.trading.opentrade), [GetPlayerTrades](xref:titleid.playfabapi.com.client.trading.getplayertrades), [AcceptTrade](xref:titleid.playfabapi.com.client.trading.accepttrade), [CancelTrade](xref:titleid.playfabapi.com.client.trading.canceltrade)**

Server:

- May Gift/Grant **Items**: **[GrantItemsToUser](xref:titleid.playfabapi.com.server.playeritemmanagement.grantitemstouser)**
- Can view the  **Items**: **[GetUserInventory](xref:titleid.playfabapi.com.server.playeritemmanagement.getuserinventory)**
- Can modify **items**: **[ModifyItemUses](xref:titleid.playfabapi.com.server.playeritemmanagement.modifyitemuses), [UpdateUserInventoryItemCustomData](xref:titleid.playfabapi.com.server.playeritemmanagement.updateuserinventoryitemcustomdata)**
- Can remove **Items**: **[RevokeInventoryItem](xref:titleid.playfabapi.com.server.playeritemmanagement.revokeinventoryitem), [ConsumeItem](xref:titleid.playfabapi.com.server.playeritemmanagement.consumeitem), [UnlockContainerInstance](xref:titleid.playfabapi.com.server.playeritemmanagement.unlockcontainerinstance)**

The following example illustrates the code blocks that call these **API** methods, and sets up basic use-cases for **Player Inventory**.

> [!NOTE]
> For reference, these examples come from **Unicorn Battle**, a game we built as an example to demonstrate the **PlayFab** features.

The **AU Virtual Currency** used below is **Gold**, a free currency earned by fighting monsters (See our [Currencies](../../commerce/economy/currencies.md) tutorial).

Before we get started, we will be defining a few utility functions that will be used and reused in most of the examples in this guide.

```csharp
// **** Shared example utility functions ****

// This is typically NOT how you handle success
// You will want to receive a specific result-type for your API, and utilize the result parameters
void LogSuccess(PlayFabResultCommon result) {
    var requestName = result.Request.GetType().Name;
    Debug.Log(requestName + " successful");
}

// Error handling can be very advanced, such as retry mechanisms, logging, or other options
// The simplest possible choice is just to log it
void LogFailure(PlayFabError error) {
    Debug.LogError(error.GenerateErrorReport());
}
```

## Client-only Example: Purchase and Consume a Health Potion

**Client API** call order: [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem), [GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory), [ConsumeItem](xref:titleid.playfabapi.com.server.playeritemmanagement.consumeitem)

First we must begin by defining the item in our **Catalog**.

![PlayFab - Economy - Edit Catalog Item](media/tutorials/playfab-edit-catalog-item.png)  

Here are the **CatalogItem** requirements for the **Health Potion**.

- **PurchaseItem** requires a positive **Item Price (5 AU)**.
- **ConsumeItem** requires the **Item** to be **Consumable**, with a positive **Item Count (3**).
- The **Player** making the purchase must have **5 AU** available in their **Virtual Currency** balance.

The code for each call is provided below.

```csharp
void MakePurchase() {
    PlayFabClientAPI.PurchaseItem(new PurchaseItemRequest {
        // In your game, this should just be a constant matching your primary catalog
        CatalogVersion = "CharacterClasses",
        ItemId = "MediumHealthPotion",
        Price = 5,
        VirtualCurrency = "AU"
    }, LogSuccess, LogFailure);
}

void GetInventory() {
    PlayFabClientAPI.GetUserInventory(new GetUserInventoryRequest(), LogSuccess, LogFailure);
}

void ConsumePotion() {
    PlayFabClientAPI.ConsumeItem(new ConsumeItemRequest {
        ConsumeCount = 1,
        // This is a hex-string value from the GetUserInventory result
        ItemInstanceId = "potionInstanceId"
    }, LogSuccess, LogFailure);
}
```

## Example: Player is Granted and Opens a Container

**API** call order: **Server**/[GrantItemsToUser](xref:titleid.playfabapi.com.server.playeritemmanagement.grantitemstouser), **Client**/[UnlockContainerInstance](xref:titleid.playfabapi.com.client.playeritemmanagement.unlockcontainerinstance)

First, we must begin with a **Container** defined in our **Catalog**. For our **Container** in this example, we selected a **Crystal Container**. 

This example *also* demonstrates opening the container with a **Key** - an *optional* item which must also be in the **Player Inventory** for the **UnlockContainerInstance** call to be successful.

![PlayFab - Economy - Edit Catalog Container](media/tutorials/playfab-edit-catalog-container.png)

**CatalogItem** requirements for our **Crystal Container** in this example include:

- That the **Crystal Container** be defined as a **Container**.

- That **Containers** can optionally define a **Key Item**, which is then required to unlock the **Container** - in this case, a **Crystal Key**.
- It is highly suggested that your **Container** and any **Key** *both* be **Consumable**, with a positive use count, so that they are removed from the **Player Inventory** after use.

**Server Code**

```csharp
void GrantItem() {
    PlayFabServerAPI.GrantItemsToUser(new GrantItemsToUserRequest {
        // In your game, this should just be a constant
        CatalogVersion = "CharacterClasses",
        // Servers must define which character they're modifying in every API call
        PlayFabId = "playFabId",
        ItemIds = new List<string> { "CrystalContainer" }
    }, LogSuccess, LogFailure);
}
```

**Client Code**

```csharp
void OpenContainer() {
    PlayFabClientAPI.UnlockContainerInstance(new UnlockContainerInstanceRequest {
        // In your game, this should just be a constant matching your primary catalog
        CatalogVersion = "CharacterClasses",
        ContainerItemInstanceId = "containerInstanceId",
        KeyItemInstanceId = "keyInstanceId"
    }, LogSuccess, LogFailure);
}
```

### Consuming Keys and Containers

In the previous example, it is suggested that the **Key** and/or **Container** is **Consumable**, though that's only a recommendation.

But if a **Container** and its **Key** (if any) are *not consumable*, the **Container** can be re-opened *infinitely*, granting its contents to the **Player** each time.

Because the **Player Inventory** capacity is *not infinite*, this pattern is greatly discouraged. When a consumable **Container** is unlocked, both it and the consumable **Key** that was used will automatically have their usage count *decreased*, removing them from the **Player Inventory** when the usage count reaches zero.

### Viable options

**Consumable Container**, no **Key**: The most basic pattern, in which the **Container** is consumed when opened, and there is no **Key**.

**Consumable Container, consumable Key**: The simple locked **Container** case, which allows the **Player** to open the **Container** with they **Key**. *Both* are consumed, and the **Player** can only open a **Container** with uses remaining with a **Key** with uses remaining.

**Durable Container, consumable Key**: This allows a **Player** to open the **Container** every time they find a **Key**. The **Key** is consumed, and the **Container** is only opened while the **Key** has uses remaining.

**Consumable Container, durable Key**: This allows a **Player** to keep a **Key** that can open *all* of the **Containers** for which it is the **Key** item. The **Container** is consumed, but the **Player** retains the ability to open **Containers** with the **Key** later.

## Example: Buying Inventory Items from the Player

There is no built-in **API** for buying back **Inventory Items** from the **Player**, as the process is game-specific. However, you can use the *existing* **API** methods to craft your own **Sell Item** experience: 
- **Server/[RevokeInventoryItem](xref:titleid.playfabapi.com.server.playeritemmanagement.revokeinventoryitem)** allows you to remove an **Inventory Item**.

- **Server/[AddUserVirtualCurrency](xref:titleid.playfabapi.com.server.playeritemmanagement.adduservirtualcurrency)** can return an appropriate amount of **Virtual Currency**. It is *not* currently possible to return **Real Money** through **PlayFab API** methods.

> [!NOTE]
> **Items** and **Virtual Currencies** have a close relationship. For more information, see our [Currencies](../../commerce/economy/currencies.md) tutorial.

The following **CloudScript** function combines the two described server calls into a single **Client**-accessible call.

```javascript
var SELL_PRICE_RATIO = 0.75;
function SellItem_internal(soldItemInstanceId, requestedVcType) {
    var inventory = server.GetUserInventory({ PlayFabId: currentPlayerId });
    var itemInstance = null;
    for (var i = 0; i < inventory.Inventory.length; i++) {
        if (inventory.Inventory[i].ItemInstanceId === soldItemInstanceId)
            itemInstance = inventory.Inventory[i];
    }
    if (!itemInstance)
        throw "Item instance not found"; // Protection against client providing incorrect data
    var catalog = server.GetCatalogItems({ CatalogVersion: itemInstance.CatalogVersion });
    var catalogItem = null;
    for (var c = 0; c < catalog.Catalog.length; c++) {
        if (itemInstance.ItemId === catalog.Catalog[c].ItemId)
            catalogItem = catalog.Catalog[c];
    }
    if (!catalogItem)
        throw "Catalog Item not found"; // Title catalog consistency check (You should never remove a catalog/catalogItem if any player owns that item
    var buyPrice = 0;
    if (catalogItem.VirtualCurrencyPrices.hasOwnProperty(requestedVcType))
        buyPrice = catalogItem.VirtualCurrencyPrices[requestedVcType];
    if (buyPrice <= 0)
        throw "Cannot redeem this item for: " + requestedVcType; // The client requested a virtual currency which doesn't apply to this item
    // Once we get here all safety checks are passed - Perform the sell
    var sellPrice = Math.floor(buyPrice * SELL_PRICE_RATIO);
    server.AddUserVirtualCurrency({ PlayFabId: currentPlayerId, Amount: sellPrice, VirtualCurrency: requestedVcType });
    server.RevokeInventoryItem({ PlayFabId: currentPlayerId, ItemInstanceId: soldItemInstanceId });
}

handlers.SellItem = function (args) {
    if (!args || !args.soldItemInstanceId || !args.requestedVcType)
        throw "Invalid input parameters, expected soldItemInstanceId and requestedVcType";
    SellItem_internal(args.soldItemInstanceId, args.requestedVcType);
};
```

### Best Practices

- Make sure to verify all **Client** input information as *valid* before making any changes.

- **CloudScript** is *not* atomic, so call order matters: **AddUserVirtualCurrency** may succeed and **RevokeInventoryItem** may fail. 

> [!TIP]
> It is generally better to give the **Player** something they *didn't* earn in this process, than to take something away *without* compensation.

This **CloudScript** function can then be accessed from the **Client**.

```csharp
void SellItem()
{
    PlayFabClientAPI.ExecuteCloudScript(new ExecuteCloudScriptRequest
    {
        // This must match "SellItem" from the "handlers.SellItem = ..." line in the CloudScript file
        FunctionName = "SellItem", 
        FunctionParameter = new Dictionary<string, string>{
            // This is a hex-string value from the GetUserInventory result
            { "soldItemInstanceId", "sellItemInstanceId" },
            // Which redeemable virutal currency should be used in your game
            { "requestedVcType", "AU" },
        }
    }, LogSuccess, LogFailure);
}
```
