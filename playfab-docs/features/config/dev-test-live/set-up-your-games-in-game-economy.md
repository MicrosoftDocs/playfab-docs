---
title: Chapter 2 - Set up your game's in-game economy
author: v-thopra
description: Chapter 2 of a four-part Getting Started tutorial for PlayFab that covers setting up an in-game economy.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, players, economy, currencies
ms.localizationpriority: medium
---

# Chapter 2 - Setting up your Game's in-game Economy

This is **Chapter 2** of our tutorial [Getting Started with PlayFab](getting-started-with-playfab.md) that contains the following Chapters:

- [Chapter 1 - Getting started with Players and Tournaments](get-started-with-players-and-tournaments.md).

- **Chapter 2 - Set up your game's in-game economy**.
- [Chapter 3 - Explore automation](explore-automation.md).

- [Chapter 4 - Try out content management](try-out-content-management.md)

## Contents

**Chapter 2** contains the following steps to get you started setting up your game's in-game economy:

1. [Set up a virtual currency for your game](#step-1-setting-up-a-virtual-currency-for-your-game).

2. [Add catalog items](#step-2-add-catalog-items).
3. [Purchase an item using virtual currency](#step-3-purchase-an-item-using-virtual-currency).
4. [Create a store with a discounted price](#step-4-create-a-store-with-a-discounted-price)

## Step 1: Setting up a Virtual Currency for your game

**PlayFab** supports a robust game economy with multiple **Currencies**, **Item Bundles**, **Stores**, and **Random Result Tables** (**Drop Tables**).

### Rags to riches

1. Go to **Economy**, then **Currencies**.
2. Select **New Currency** and change these fields:
    - **Currency Code** (2 uppercase characters): **GO**
    - **Display Name**: **Gold**
3. Click **Save Currency**.

The **Deposit** and **Recharge** fields are useful for **Energy Currencies** that reset every day, but we won't use them for this example.

![Game Manager - Economy - New Currency](media/tutorials/game-manager-economy-new-currency.png)  

### Pay it forward

Now you can give **Virtual Currency** directly to **Players**. Since it can be dangerous to give **Clients** the ability to call [AddUserVirtualCurrency](xref:titleid.playfabapi.com.client.playeritemmanagement.adduservirtualcurrency), let's add money from the **Game Manager**.

1. Go to the **Player's Virtual Currency** tab.

   ![Game Manager - Players - Virtual Currency Tab](media/tutorials/game-manager-players-virtual-currency-tab.png)  

2. Select the **GO** currency.
3. Change the **Amount** to **100**.
4. Select the **Save Virtual Currency** button.

   ![Game Manager - Players - Modify Virtual Currency](media/tutorials/game-manager-players-modify-virtual-currency.png)  

Now you have **100 Gold**. What can you do with it? Buy an item! But first, we have to make some.

## Step 2: Add Catalog Items

No sense having money if you can't spend it. Let's create a **Catalog**, which is a collection of **Items**. You can create **Catalogs** that correspond to the platforms on which you're releasing your game, or major version numbers, whatever you like.

> [!TIP]
> We don't recommend creating **Catalogs** to differentiate types of **Items**, as you can filter **Items** effectively using classes, tags, and stores. Multiple **Catalogs** are better suited to different versions of your game.

### Make a Catalog

1. Go to Economy > **Catalogs**
2. Create a **New Catalog** named **main**.

   ![Game Manager - Economy - New Catalog](media/tutorials/game-manager-economy-new-catalog.png)  

3. An item with the **ID** of **One** has been added automatically.

   ![Game Manager - Catalog - main items](media/tutorials/game-manager-catalog-main-items.png)  

4. Click on **One** and change these fields:
    - **Item ID**: **apple**
    - **Display Name**: **Perfectly normal apple**
5. At the bottom of the form is the **Prices** section, where you define how much an **Item** costs in your game's **Virtual Currency**.
6. Set the apple's price in **Gold** (**GO**) to **5**.
7. Select the **Save item** button.

   ![Game Manager - Edit Catalog Item](media/tutorials/game-manager-edit-catalog-item.png)  

> [!TIP]
> If you plan on selling **Items** for **Real Money**, you can set how much the **Item** costs in **Real Money** (**RM**), which is expressed in United States cents. An **Item** that costs **$4.99** should have a **RM** value of **499**. This is a more advanced topic than this tutorial though.

> [!WARNING]
> If you remove **all** of the **Items** from a **Catalog**, the **Catalog** disappears.

## Step 3: Purchase an item using Virtual Currency

Who's hungry for apples? Jerry? Let's get the **Catalog** and attempt to make a purchase.

1. In your game, call [GetCatalogItems](xref:titleid.playfabapi.com.client.title-widedatamanagement.getcatalogitems).
    - **CatalogVersion**: **main**
2. Verify that you see an **apple** with a **GO** price of **5**.

   ![GetCatalogItems Results - VC Price](media/tutorials/getcatalogitems-results-vc-price.png)  

3. Then call [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) to buy the **apple**.
    - **CatalogVersion**: **main**
    - **ItemId**: **apple**
    - **VirtualCurrency**: **GO**
    - **Price**: **5**

   ![PurchaseItem Results - VC Purchase](media/tutorials/purchaseitem-results-vc-purchase.png)  

4. Finally, call [GetUserInventory](xref:titleid.playfabapi.com.client.playeritemmanagement.getuserinventory) and take a look at your **Inventory**.

   ![GetUserInventory Results - New Inventory Item](media/tutorials/getuserinventory-results-new-inventory-item.png)  

Now you have an apple!

Check the **Player's PlayStream** tab, you should have seen a **"Player vc item purchased" Event**.

![Game Manager - Dashboard - item purchased event](media/tutorials/game-manager-dashboard-item-purchased-event.png)  

That **Player's Inventory** tab will show the **apple**. You can also *revoke* the **Item** or grant yourself *more* **apples** on the **Inventory** tab.

![Game Manager - Players - Inventory](media/tutorials/game-manager-players-inventory.png)  

And now the **Player** has only **95 gold coins** left...

![Game Manager - Players - Virtual Currency updated](media/tutorials/game-manager-virtual-currency-updated.png)  

## Step 4: Create a Store with a discounted price
Buying **Items** out of the **Catalog** is fine, but it's not how *most* games structure their purchases. Whether you're making an idle clicker, an RPG, a FPS, or an endless runner, you probably have **Stores** in your game where **Players** can buy weapons, armor, or running shoes.

Our solution for this is **Stores**, a subset of your **Catalog** with prices you can override. It also enables some amazing functionality in **PlayStream** (we'll get to that later).

As this tutorial is slowly evolving into Harvest Moon, let's make a **Store** to sell fruit.

### Add more items

It's not much of a **Store** if you only have one thing to sell (that would be the **Apple Store**... *rimshot!*).

1. Go to **Economy**, then **Catalogs**.
2. Select your **main Catalog**.
3. Then choose **New item** a few times, and create some items. How about:
    - An **apricot** with **GO** cost of **4**.
    - A **pear** with **GO** cost of **3**.
    - A **grape** with no **GO** cost (don't select any prices).

> [!NOTE]
> You don't have to assign a **Virtual Currency** price to **Items** in the **Catalog** for them to appear in a **Store**.

![Game Manager - New Catalog Item](media/tutorials/game-manager-new-catalog-item.png)  

![Game Manager - Main Items - updated](media/tutorials/game-manager-main-items-updated.png)  

### Stocking the shelves

You should now have a few **Items** with prices. Let's make a **Store** to sell them to the **Player**.

1. Go to the **Stores** tab in the main **Catalog**.
2. Select **New Store**, and give it an **ID**:
    - **Store ID**: **fruits**
3. Select **Add to Store**.
4. This pop-up shows all **Items**, **Bundles**, and **Containers** in the current **Catalog**.

   ![Game Manager - Pick store contents](media/tutorials/game-manager-pick-store-contents.png)  

5. Select the **Add** button next to a few items to add them to your **Store**.

You should see your **Items** listed in the **Store**, but they're *not* valid until they have at least *one* price.

![Game Manager - New Store](media/tutorials/game-manager-new-store.png)  

### How to use Stores

- The little static number with the arrow (e.g. **<5**) next to the **Price** text box is the original **Catalog** price.

- Drag and drop the rows to rearrange the order of the **Items**.
- You only have to enter a **Price** for one box in each row, but you can enter as many **Prices** as you want.
- If you don't enter a **Price** for an **Item**, it will be removed from the store.
- If a **Store Item** doesn't have a **Price** in a **Currency**, it can't be bought using that **Currency**.
- Store **Prices** can be higher than **Catalog Prices**.
- **Zero** is a valid price for an **Item**.

### Price it out

1. Add some **GO Prices** to your **Items**, but make them *lower* than the **Catalog Price**:
    - **apple**: **4**
    - **pear**:**2**
    - **grape**: **1**
2. Select the **Save Store** button when you're finished.

   ![Game Manager - New Store - Save](media/tutorials/game-manager-new-store-save.png)  

### Going shopping

You have a **Store**. Let's buy something!

1. In your game, call [GetStoreItems](xref:titleid.playfabapi.com.client.title-widedatamanagement.getstoreitems) and get your **Store**:
    - **CatalogVersion**: **main**
    - **StoreId**: **fruits**
2. Verify you received an object with the list of **Items** in the **Store** and their **Prices**, in the order you selected.

   ![GetStoreItems Results - Before Purchase](media/tutorials/getstoreitems-results-before-purchase.png)  

3. In your game, call [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) and give it the **Currency** and **Store** price of the **Item** you want to buy

    - **CatalogVersion**: **main**
    - **StoreId**: **fruits**
    - **ItemId**: **pear**
    - **VirtualCurrency**: **GO**
    - **Price**: **2**

   ![PurchaseItems Results - Bought Pear](media/tutorials/purchaseitems-results-bought-pear.png)  

4. Look in your **Player's Inventory** tab for the **pear**, and check their **Virtual Currency** to check that they only spent **2 Gold**.

You will once again see **Events** in the **PlayStream Debugger** showing the purchase flow from the **Store**.

![Game Manager - Dashboard - Purchase flow](media/tutorials/game-manager-dashboard-purchase-flow.png)  

> [!NOTE]
> If you *don't* specify the **StoreId** when calling [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem), the **Purchase** will be attempted against the **Catalog Price**.

### Going further

**Stores** are the *best* way to let **Players** purchase **Items** in your game. You can use the **Game Manager** to change the order of **Items**, and adjust **Prices** at any time.

Using **Segments**, you can even give special **Prices** to certain **Players** without touching your game code.

Now let's look at another way to interact with **Players** that doesn't require resubmitting your code to an **App Store**.

[Go to chapter 3 - Exploring automation](explore-automation.md)
