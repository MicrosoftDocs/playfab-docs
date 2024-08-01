---
title: Subscription Redemption with the Google Marketplace
author: fprotti96
description: Set up a PlayFab subscription that can be purchased from Google Play Store
ms.author: fprotti
ms.date: 11/06/2023
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, integration, marketplace
ms.localizationpriority: medium
---

# Set up a PlayFab subscription that can be purchased from Google Play Store

> [!NOTE]
> Google Subscription Redemption is currently in **Private Preview**. For access to this feature, send an email to **PFEconomyPreviews@microsoft.com** with the subject **PlayFab Mobile Subscriptions** along with your PlayFab Title ID and we will enable the feature in your environment.

This tutorial shows you how to successfully create a PlayFab subscription, add it to your game in the Google Marketplace for players to purchase, and how to redeem the items contained in it.

## Prerequisites

1. A Title in PlayFab's [Game Manager](https://developer.playfab.com/).
2. An existing integration between the selected Title and your desired marketplace.
3. An app already created and available in [Google Play](https://play.google.com/console/developers).

## Step 1: Create a subscription

Before starting the redemption of any subscription, you first need to have it available in both [Game Manager](https://developer.playfab.com/) and in your app in the [Google Play Console](https://play.google.com/console/developers).

In this tutorial, we start by creating the **Subscription** in the **Google Play Console**.

### Google Play Console

To create a **Subscription** using the **Google Play Console**, you must follow the next steps:

1. Open your desired **App** in the [Google Play Console](https://play.google.com/console/developers).
2. From the left navigation menu, scroll down to the **Monetize** section and select **Subscriptions**.
3. Select **Create subscription** on the top right.
4. Enter your desired **Product ID** and **Name** for the subscription. In this tutorial, use **up_basic_sub** as the **Product ID**. Remember the **Product ID** because it will be used for linking **Game Manager**.
5. Scroll down to **Base plans and offers** and select **Add base plan**.
6. Add whatever configurations you want to your base plan and select **Save** on the bottom right.
7. Select **Save** to save all the changes you just made to the subscription. Note that saving will not activate it as a product. Once saved, the activation option appears. To make the subscription active in your app in the **Google Play Console**, select the **Activate** button on the lower right.

### Create a subscription using Game Manager

To create a new **Subscription** in **Game Manager** follow the next steps:

1. Go to [Game Manager](https://developer.playfab.com/) and navigate to you **Title**.
2. From the left navigation menu, choose **Engage** > **Economy**.
3. Select the **Subscriptions** tab.
4. Select **New subscription**.
5. Add any information you want to your **Subscription**, such as items and prices In this tutorial, use **Swords Subscription** as the name.
6. Scroll down to the end of the page and select **Save and publish** if you want it to be published right away, or **Save as draft** if you want it saved but don't want it available yet.

### Add items to your subscription

A subscription by itself doesn't give any items to a player, we must first link items to it and once redeemed, it grants those items to that specific player.

Before adding items to a subscription, make sure you have the items already created and published in your Catalog. We already have a sword item called **Oath Keeper** and another one called **Frostmourne**. If you don't know how to create an item, refer to [this step](../craftingGame/crafting-game-game-manager.md#step-4---create-your-first-item).

Now to add them to your subscription! To do so, you can either add them while creating your subscription the first time, assuming that the items are already created. Or you can add them later by editing the subscription item.

While in edit mode, scroll down to the **Items** section of your subscription and select the **Add** button, this displays a window in which all your items available in your catalog are shown, from here you can either filter by type (Items or User Generated Content (UGC) Items), or search for a specific item. In our case, we only have two items published, so we select the **Add** button next to each of them and finally the blue **Add** button at the bottom of the window.

#### Enable Marketplace Mapping

To ensure that when a player purchases a subscription from your app, it gets properly purchased and assigned in Game Manager, you must configure your **Marketplace Mapping**. This can be done while creating your subscription in Game Manager or after the subscription was created by going back to the subscription in **Edit mode**.

1. Navigate to your subscription in edit mode.
2. Scroll down to the **Markeplace Mapping** section.
3. From the **Marketplace** dropdown, select your desired marketplace. (For this tutorial, it will be **GooglePlay**).
4. For your **Marketplace ID** make sure to use the same as your **Product ID** in the Google Play Console. In this tutorial, we used **up_basic_sub**.
5. To finish, select the **+** at the right side of that row.

## Step 2: Generate a Purchase Token

> [!NOTE]
> Make sure you have **Prerequisite #3** completed before continuing, if not, there is no practical way of generating a **Purchase Token**.

A **Purchase Token** is a token generated by Google Play's APIs on each purchase, similar to a receipt ID. According to Google's documentation, "a **Purchase Token** is a string that represents a buyer's entitlement to a product on Google Play. It indicates that a Google user has paid for a specific product."

In your implementation, you should save that token as it should be sent to PlayFab's API in order to validate the purchase with the Google Marketplace. It allows PlayFab to redeem the player's purchased items and grant them in the player's inventory.

To generate the token, you must already have an app running with an active integration with Google Play. Your app registration in Google Play must also have items (or in this case, a subscription) available for purchase. Your code implementation must use Google Play's billing system for you to get a token returned once you make a purchase.

In summary, the billing system should be used when coding your app, through that billing system you can purchase the subscription from Google's end, which will return the **Purchase Token**. The token should then be used with PlayFab's [Economy API](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items) to redeem the purchase and add the subscription items to the player's inventory.

> [!TIP]
> For implementation examples of a similar project using Google's systems, see this [CodeLab](https://codelabs.developers.google.com/play-billing-codelab#0).
>
> For more information about billing, see [Google's Billing System documentation](https://developer.android.com/google/play/billing).

## Step 3: Redeem a subscription

Now that you have your subscription created in both **Game Manager** and in the **Google Play Console**, you can redeem your subscription for one of your players. In this example, we focus on doing so using PlayFab's API, specifically, the **RedeemGooglePlayInventoryItems** method part of PlayFab's **Economy API**.

### Check AlternateIDs

Before making the redeem call, make sure you have the correct **AlternateId** in **Game Manager**, it should be the same as in the **Google Play Console**.

The following screenshot is from within your subscription in **Game Manager**, the **Marketplace ID** is what we call the **AlternateId**, basically it's another way of identifying your subscription.

From the **Google Play Console**, go into your subscription inside your app, and under **Subscription details**, from here, you'll see all your created products, including your subscription. The **Product ID** can be seen in the second column, you should make sure it's the same as your **AlternateId** in **Game Manager**, if it isn't, then update **Game Manager**.

### Get the player authenticated

To redeem an item, use [RedeemGooglePlayInventoryItems](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items). But before that, we must ensure that the player looking to redeem the item(s) gets properly authenticated in your app, for which you'll likely use the [LoginWithGoogleAccount](/rest/api/playfab/client/authentication/login-with-google-account).

>[!NOTE]
> For a more detailes example, see [Setting up PlayFab authentication using Google Play games sign-in in Unity](/gaming/playfab/features/authentication/platform-specific-authentication/google-sign-in-unity).

After a successful **LoginWithGoogleAccount** call, PlayFab's API returns an **EntityToken** that you have to use as part of your **RedeemGooglePlayInventoryItems** headers with a `X-EntityToken` key.

### Make the redemption call

With your player authenticated, both subscription instances created and their **Alternate IDs** checked, and your **Purchase Token**. You're ready to make the redemption call. For this, we use the **RedeemGooglePlayInventoryItems** API call.

```json
{
    "Purchases": [
        {
            "ProductId": "up_basic_sub",
            "Token": "{Your purchase token}"
        }
    ]
}
```

The call is quite straightforward, you have a `Purchases` array, containing the `Product ID` (which should match the one in the **Google Play Console**), and a `Token` field that corresponds to the **Purchase Token** returned when calling the **Google Play Billing System**.

A successful response will include a `200 status code` alongside data such as a **timestamp** and a **MarketplaceTransactionId**.

After a successful redemption has been made, if you go into your player's inventory, you should now be able to see the subscription and both of items linked to the subscription.

Each redemption action will also trigger a corresponding log in the player's transaction history which can be retrived from the **Transaction History (V2)** tab under a specified player's overview page.

Alongside the record in the player's transaction history, a PlayStream event is also triggered and logged. You can access these logs for your Title by going to the **Data** page under the **Analyze** section of the left navigation bar in **Game Manager**. Here you can edit queries to search for specific records or run it with the default settings to get everything. There should be a record under the **Event name** of **items_redeemed**, there you should see one new event specific for the subscription that was just redeemed.

## See also

- [Getting Started with Economy v2, Unity, and Android](/gaming/playfab/features/economy-v2/tutorials/getting-started-with-unity-and-android)
- [Fraud prevention quickstart](/gaming/playfab/features/economy-v2/fraud-prevention/quickstart)
