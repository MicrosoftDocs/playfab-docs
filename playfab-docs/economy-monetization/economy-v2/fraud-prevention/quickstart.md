---
title: Fraud prevention quickstart
author: cybtachyon
description: Get started with receipt validation for PlayFab Economy v2.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: quickstart
ms.service: azure-playfab
keywords: playfab, economy, catalog, receipts, purchases, fraud, piracy
ms.localizationpriority: medium
---

# Fraud prevention quickstart

[!INCLUDE [notice](../../../includes/_economy-release.md)]

This quickstart will get you running with receipt validation on the Microsoft Store ([Windows 10/11](/windows/uwp/publish/), [Xbox](/gaming/xbox/), [Android](https://blogs.windows.com/windows-insider/2021/10/20/announcing-android-apps-on-windows-11-preview-for-windows-insiders-in-the-beta-channel/)).

## Prerequisites

The [PlayFab Economy v2 quickstart](../quickstart.md) will get you set up and ready to perform receipt validation.

## Microsoft Store Marketplace receipt validation

* [GetMicrosoftStoreAccessTokens](/rest/api/playfab/economy/inventory/get-microsoft-store-access-tokens)
* [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)

To use the Redeem API, you start by setting up your Product IDs and Prices in whatever Marketplace (Apple Store, Steam, Google Play, etc.) you're using. Initially, all the products are faceless - digital entries your player can purchase - but have no meaning in PlayFab.

To give those entries meaning, we need to mirror them in the PlayFab Catalog. Mirroring them will turn the faceless entities into Catalog Bundles. When you call `RedeemMicrosoftStoreInventoryItems` in the new service, we look for a Bundle in the Catalog that matches to grant to the Entity Player’s virtual Inventory.

Each Bundle can be linked to one or more Partner Marketplace Products by adding an AlternateId to it. The AlternateId is the link between PlayFab and any external IAP Market. When your title calls Redeem for a given player entity, we pass this ID up to the IAP Market to check. The general flow is:

1. Create 1 (or more) real world offers in the Microsoft Store
1. Populate the Add-ons in PlayFab with IAP Market calling permissions and create corresponding Bundles in Playfab that link to the offers you created
1. Call `RedeemMicrosoftStoreInventoryItems`

> [!NOTE]
> Unlike previous incarnations of Playfab, in the new system you just create one bundle offer, and then you add each market SKU that needs to reference into the AlternateId list. You don’t need to create a new Item for each IAP market.

### Step 1 - Setting up your marketplace integration

You need to set up each IAP Market integration in GameManager under the Add-ons section, to allow PlayFab to call the Market on the Title’s behalf.

### Step 2 - Creating a bundle for receipt validation

You can [create a bundle](../bundles.md) either within GameManager or by calling `CreateDraftItem`. Minimally a Bundle requires a Title, Description, and Items. In GameManager, you can link Marketplace entries using the Marketplace Mapping section.

If you're building the Bundle using the API, you need to add your IAP Marketplace Mappings under the alternateIds section of a bundle. Marketplace Enums are specific and case sensitive; you must use one of the following Add-ons:

[!INCLUDE [add-ons](../../../includes/_add-ons-enum.md)]

### Step 3 - Calling Redeem from your Game

Your game calls the `RedeemMicrosoftStoreInventoryItems` API with entity and receipt details to ‘redeem’ the real world offer and populate the corresponding Entity Inventory. You need to provide a few things in the call it to work correctly:

* Required in the Header of the Request  
  * X-EntityToken - The token uniquely identifying a PlayFab entity
  * Content-Type - Application/Json
* Required in the Body of the Request
  * `CollectionsIdKey`

Each IAP Market has slightly different requirements for making these calls. For instance, Apple and GooglePlay purchases, you need to attach a marketplace receipt.

When your game client launches, first initiate a PlayFab Redeem call for the marketplace. Redeem calls allow PlayFab to sync with any potential purchases that happened offline or outside the game’s purview.  Your game should use these calls whenever an in-game purchase of a Marketplace offer occurs.

Redeem will ensure that the Player Entity’s Inventory Currency is populated after Redeem endpoint is called.  

## Part 4: Purchasing an Item  

### [Game Manager](#tab/purchase-item-game-manager)

You can verify that Items or Currencies exist within the individual Player views. In GameManager, select Players, and navigate to an individual Player Entity. Use the Inventory tabs to view and update what that Entity Player possesses.

### [API](#tab/purchase-item-api)

In your game, sign in as a player that has been given virtual currency.

Call `SearchItems` to use a previously published catalog itemId.

Call `PurchaseInventoryItems` with the catalog Item’s itemId, and the awarded Virtual Currency ID.

Finally, `GetInventoryItems` and view the result of that method.

***

You can learn more about Monetizing on the Microsoft platform [here](/windows/uwp/monetize/).
