---
title: Chapter 3 - Exploring automation
author: v-thopra
description: Chapter 3 of a four-part Getting Started tutorial for PlayFab that covers automation.
ms.author: v-thopra
ms.date: 06/11/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, config, automation, cloudscript
ms.localizationpriority: medium
---

# Chapter 3 - Exploring automation

Welcome to **Chapter 3** of our tutorial [Getting Started with PlayFab](getting-started-with-playfab.md), the tutorial contains the following Chapters:

- [Chapter 1 - Get started with Players and tournaments](get-started-with-players-and-tournaments.md)
- [Chapter 2 - Set up your game's in-game economy](set-up-your-games-in-game-economy.md)
- **Chapter 3 - Explore automation**
- [Chapter 4 - Try out content management](try-out-content-management.md)

## Contents

**Chapter 3** contains the following steps to help you explore automation:

- [Step 1: Create a custom server-hosted CloudScript function](#step-1-write-a-cloudscript-function)
- [Step 2: Create a filtered segment of Players](#step-2-create-a-filtered-segment-of-players)
- [Step 3: Trigger an action when Players enter that Segment](#step-3-trigger-an-action-when-players-enter-that-segment)
- [Step 4: Target a custom Store to Players in that Segment](#step-4-override-a-store)

## Step 1: Write a CloudScript function

**CloudScript** is custom **JavaScript** that runs on **PlayFab's** servers. It's great for securely and consistently setting up **Players**, leveling them up, or making multi-step purchases.

When using **CloudScript**, you have secure access to the **Server APIs** (listed under **Server**, in the [PlayFab API Reference](../../../api-references/index.md)). This makes it simple to grant **Items** and change **Statistics** without worrying if the **Client** is allowed to do so.

> [!WARNING]
> Take care with the size of your functions. **CloudScript** isn't designed for generating procedural terrain or mining **Bitcoin**. Your functions will time out if they take too long (though you can upgrade that on the **Settings** > **Limits** tab).

### A bushel on your first day

Let's make it easy to give **Players** 500 gold, two apples, and 10 XP.

1. Go to **Automation** > **CloudScript**.
2. You can type directly in this window and add functions in any order...

   ![Game Manager - Servers - Add CloudScript](media/tutorials/game-manager-servers-add-cloudscript.png)  

3. Copy and paste the function shown below at the top of your **CloudScript**.

```javascript
handlers.bushelOnYourFirstDay = function(args) {
    // The server API can add virtual currency safely
    var addGoldResult = server.AddUserVirtualCurrency({
        PlayFabId: currentPlayerId,
        VirtualCurrency: "GO",
        Amount: 500
    });

    // When the server grants items, there's no cost to the player
    var appleBounty = server.GrantItemsToUser({
        PlayFabId: currentPlayerId,
        CatalogVersion: "main",
        ItemIds: ["apple", "apple"]
    });

    // Like AddUserVirtualCurrency, it's safer to call UpdatePlayerStatistics from CloudScript
    var updateStatistics = server.UpdatePlayerStatistics({
        PlayFabId: currentPlayerId,
        Statistics: [{
            "StatisticName": "xp",
            "Value": 10
        }]
    });

    log.info("I have 500 gold, two apples and 10 XP!");
}
```

4. Scroll to the top of the page and select **Save as revision 2**, then confirm in the pop-up.
5. Your revision has been saved, but it's *not* deployed and live yet.
6. Select **Deploy revision 2**, and confirm it in the pop-up.

   > [!NOTE]
   > You can manually call functions in a revision that's not live, but some areas of the **Game Manager** *only* look for **CloudScript** functions in your live revision.

   ![Game Manager - Servers - Deploy CloudScript](media/tutorials/game-manager-servers-deploy-cloudscript.png)  

### Test your CloudScript

Let's make sure this welcome package works.

1. In your game, call [ExecuteCloudScript](xref:titleid.playfabapi.com.client.server-sidecloudscript.executecloudscript)
    - FunctionName: **bushelOnYourFirstDay**
    - GeneratePlayStreamEvent: **true**

2. The response object shows any log **Events** you recorded, and how long the function took to execute.

   ![ExecuteCloudScript Results](media/tutorials/executecloudscript-results.png)  

3. Check the **Player's Statistics** tab to ensure they have **10 XP**.
4. Check the **Player's Inventory** tab to ensure they have **two apples**.

It's safer to grant **Items** and **Virtual Currency** this way if you're worried about **Players** hacking your game and cheating.

Once again, you can see the relevant **Events** in the **PlayStream Debugger**.

![Game Manager - Dashboard - Debugger - Execute CloudScript](media/tutorials/game-manager-dashboard-debugger-execute-cloudscript.png)  

### Going further

That's a sample of what you can do with **CloudScript**. You can use it to grant **Players XP** after a match ends, randomize starting **Statistics**,** or even run referral codes.

But there's *another* way to interact with **Players** that runs automatically, and *doesn't* involve writing any code.

Your secret weapon is **PlayStream**, **PlayFab's** powerful real-time segmentation engine.

## Step 2: Create a filtered Segment of Players

**PlayStream** is **PlayFab's** proprietary real-time engine. It allows you to instantly run actions against **Players** who match criteria you specify.

You could:

- Grant a special welcome package to **Players** who log in before a specific date.
- Send a congratulation notification to **Players** who reach the maximum level.
- Run an **A/B Test** to see which **Store** prices result in more purchases.
- Ban a **Player** who hacked their **Statistics** to an invalid value.
- Reward **Players** with a special **Item** if they link their **Facebook** account.
- Give gold to **Players** who come to your game via an advertisement.

*All of this without writing any game code!*

### Filter Players

It's possible to use **PlayStream** almost like game code. Let's reward **Players** who reach **500 - 600 XP** with an **Item** and some **Gold**.

1. Go to **Players** > **Segments**
2. Click **New Segment**
    - **Segment Name**: **Adventurers**
3. Change the filter to **Statistic value xp is greater than or equal to 500**.
4. Select **Add filter**.
5. Change the new filter to **Statistic value xp is less than or equal to 600**.

This defines a range of the **XP Statistic** between **500** and **600**.

**Players** who earn that much **XP** are said to be in the **Segment**. If the **Player** earns *more* **XP** than **600 XP** they leave the **Segment**.

![Game Manager - PlayStream - New Segment](media/tutorials/game-manager-playstream-new-segment.png)  

## Step 3: Trigger an Action when Players enter that Segment

Under **Actions** you'll see two tabs:

- **Entered Segment** (your filters apply to a **Player**).
- **Left Segment** (your filters no longer apply to the **Player** who was in the **Segment**).

To file an **Action** when the **Player** enters this **Segment**:

1. Make sure **Entered Segment** is highlighted.
2. Select **Add Action** and change the dropdown at the left.
    - Type: **Grant Item**.
1. Select **Select Item** and choose a **pear**.

That's one, but you can also give the **Virtual Currency** to the **Player**.

1. Select **Add action** and change the drop-down at the left.
    - Type: **Grant Virtual Currency**.
2. Change **Amount** to **1000**.
3. Select **Save Segment**.

   ![Game Manager - Save Segment](media/tutorials/game-manager-save-segment.png)  

### Brave, brave sir 8fa79815413d472d

Normally your **Player** would reach **550 XP** as the result of [UpdatePlayerStatistics](xref:titleid.playfabapi.com.client.playerdatamanagement.updateplayerstatistics) or a **CloudScript** function. But you can adjust **Player Statistics** manually.

1. First, open a tab to the **Dashboard** and keep it open, so you can see what happens.
2. In another tab, go to your **Player's Statistics**.
3. Select their **XP Statistic** and change it to **550**.
4. Save **Player Statistics**.

   ![Game Manager - Players - Save Player Statistics](media/tutorials/game-manager-players-save-player-statistics.png)  

5. In the **PlayStream** tab you should see three **Events**:
    - **Player Statistic changed** (the one you caused), with an orange line noting the **Segment** change and a red line for each triggered **Action**.
    - **Player inventory item added**, set on the **Segment Enter Action**.
    - **Player Virtual Currency balance changed**, also set on the **Segment Enter Action**.

   ![Game Manager - Dashboard - Debugger - Statistic changed](media/tutorials/game-manager-dashboard-debugger-statistic-changed.png)  

Pretty neat, huh?

Once you've set up **Push Notifications** (see [Push Notifications quickstart](../../engagement/push-notifications/quickstart.md)) you can send **Players** personalized messages when they enter and exit **Segments**.

Executing **CloudScript** is another *great* way to interact with your **Players** and test new rewards.

## Step 4: Override a Store

Another cool thing you can do with **Segments** is show different **Stores** to **Players** in different **Segments**.

This allows you to give different prices to your **VIP Players**, or incentivize lapsed **Players**. Since you have a **Store** and a **Player** in a **Segment**, you can see how this works.

### Check existing prices

Before we do anything fancy, let's get a baseline for your **Player**.

1. In your game, call [GetStoreItems](xref:titleid.playfabapi.com.client.title-widedatamanagement.getstoreitems) and get your **Store**.
    - **CatalogVersion**: **main**
    - **StoreId**: **fruits**

2. You should see the prices from before, with apples that cost 4 gold, pears that cost 2 and grapes for 1.

   ![GetStoreItems Results - Store Prices](media/tutorials/getstoreitems-results-store-prices.png)  

### Store override

Now to make magic.

1. Go to **Economy** > **Catalogs**.
2. Select your **main Catalog**.
3. Go to the **Stores** tab.
4. Check the box next to the **fruits Store**.
5. Select **Duplicate**, then confirm in the pop-up.

There should be a *new* **Store** in the list called **fruits** (**1**).

![Game Manager - Economy - Catalogs - Duplicate Store](media/tutorials/game-manager-economy-catalogs-duplicate-store.png)  

1. Select the  **fruits** (**1**) **Store**.
2. Change its **ID** to **fruits-adventurers**. (the name isn't actually important).

You could reduce prices manually, but let's use the auto-adjuster.

1. Select **Modify prices**.
2. In the pop-up, change the **percentage** to **50** to cut prices in half.
3. Select **Save**.

   ![Game Manager - Modify Store Prices](media/tutorials/game-manager-modify-store-prices.png)  

4. Instant savings! Select **Save Store**.

   ![Game Manager - Economy - Catalogs - Save Store Updates](media/tutorials/game-manager-economy-catalogs-save-store-updates.png)  

### Segment… ation

Maybe you saw the area labeled **Segment overrides**. Yep - we'll be using that. It *only* appears when you have at least *one* **Store** and one **Segment**.

1. Select on the original **Store**, **fruits**.
2. In the **Segment Overrides** section you'll see the **Segment "Adventurers"**.
3. Select the **Do not override** drop-down and change it to **fruits-adventurers**.
4. Select **Save Store**.

   ![Game Manager - Economy - Catalogs - Edit Store - Segment Overrides](media/tutorials/game-manager-economy-catalogs-edit-store-segment-overrides.png)  

When a normal **Player** sends a request for the contents of the **Store** called **fruits**, they'll get the normal **Store**.

But any **Player** in the **Adventurers Segment** will get the **"fruits-Adventurers" Store**.

### Pricing magic

Now that you've set the override, let's buy a **pear** on the cheap.

1. In your game, call [GetStoreItems](xref:titleid.playfabapi.com.client.title-widedatamanagement.getstoreitems) and get your **Store**.
    - **CatalogVersion**: **main**
    - **StoreId**: **fruits**

   ![GetStoreItems Results - Override - Store Prices](media/tutorials/getstoreitems-results-override-store-prices.png)  

2. Check out those low low prices!
3. In your game, call [PurchaseItem](xref:titleid.playfabapi.com.client.playeritemmanagement.purchaseitem) and buy a **pear** for the *new* price!
    - **CatalogVersion**: **main**
    - **StoreId**: **fruits**
    - **ItemId**: **pear**
    - **VirtualCurrency**: **GO**
    - **Price**: **1**

   ![PurchaseItem Results - Override - Store Prices](media/tutorials/purchaseitem-results-override-store-prices.png)  

### Pear-ishible Stores

Since **Segments** can be time-based (e.g. last login between **December 1st** and **December 31st**), you can use **Store** overrides to create holiday discounts.

**Store** overrides are *also* great for changing the order of **Items** and even changing the whole selection!

Finally, we're going to look at some other features of **PlayFab**.

[Go to Chapter 4 - Try out Content Management](try-out-content-management.md)
