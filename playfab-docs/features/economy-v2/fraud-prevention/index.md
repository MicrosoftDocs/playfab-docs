---
title: Fraud prevention, redemption, receipt validation
author: cybtachyon
description: Learn about fraud prevention, item redemption, receipt validation, and other piracy protection measures.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, economy, catalog, receipts, purchases, fraud, piracy
ms.localizationpriority: medium
---

# Fraud prevention, redemption, receipt validation

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The heart of any game economy is allowing players to purchase game items, currencies, and more with virtual currencies or Real Word (RW) money.

## Fraud Vectors

### Spoofing, proxies, and request duplication

Request techniques that are used to make it appear as if a player is making a purchase from a different location than they actually are. Players spoofing their IP address, using a proxy, or duplicating a request are common scenarios.

You can use [Idempotent Transactions](#idempotent-transactions) to combat these fraud vectors.

### Unverified Store API calls

Unverified Store API calls are calls that are made to the Store API without a valid receipt. These calls can be made by spoofing the receipt or by duplicating a request.

[Receipt Validation](#receipt-validation) is a feature that can be used to combat this fraud vector.

### Post-redemption refunds

A player can make a purchase, redeem the purchase, and then request a refund from the store.

You can check for refunds with PlayFab's [Refund process](#refunds).

### Piracy, cracking, and authentication bypasses

Piracy is the act of copying and distributing software without the permission of the copyright holder. Cracking is the act of modifying software to remove or bypass its copy protection. Authentication bypasses are techniques that are used avoid account registration and sign-in.

You can convert a pirate player to a paying customer via [Anti-Piracy techniques](#anti-piracy).

## Idempotent transactions

PlayFab Economy v2 transactions are idempotent, meaning they can be retried any number of times, and if the transaction has already been completed, the transaction will be ignored. When a player attempts to make a purchase and the request is duplicated, the player won't be charged twice.

Learn more about Idempotency in our [Inventory Overview](../inventory/index.md#idempotency).

## Receipt validation

Economy v2 supports the following add-on API endpoints:

* Microsoft Store ([Windows 10/11](/windows/uwp/publish/), [Xbox](/gaming/xbox/), [Android](https://blogs.windows.com/windows-insider/2021/10/20/announcing-android-apps-on-windows-11-preview-for-windows-insiders-in-the-beta-channel/))
  * [GetMicrosoftStoreAccessTokens](/rest/api/playfab/economy/inventory/get-microsoft-store-access-tokens)
  * [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)
* Google Play Store (Android)
  * [RedeemGooglePlayInventoryItems](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items)
* Apple AppStore (iOS)
  * [RedeemAppleAppStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items)
* Nintendo Switch E-Shop (Switch)
  * [RedeemNintendoEShopInventoryItems](/rest/api/playfab/economy/inventory/redeem-nintendo-e-shop-inventory-items)
* Sony PlayStation Store Next-gen (PS4/PS5)
  * [RedeemPlayStationStoreInventoryitems](/rest/api/playfab/economy/inventory/redeem-play-station-store-inventory-items)
* Steam (Windows 10/11, OSX, Linux)
  * [RedeemSteamInventoryItems](/rest/api/playfab/economy/inventory/redeem-steam-inventory-items)

## Refunds

* Check for refunds
  * To find the player based on the refund, do a search on the `items_redeemed` event and locate the receipt ID.
  
> [!TIP]
> Keep a local copy of older events beyond the limit of your Insights retention period.

You can use [Insights](../../insights/data-explorer/index.md) to detect and prevent this fraud vector.

## Anti-piracy

Techniques to combat piracy and convert pirates to paying customers:

* Correct regional pricing for all items and editions:
    Overpriced items or subscriptions are a common reason for piracy. [See which markets the Microsoft Store supports](/windows/uwp/publish/define-market-selection).
* Ability to play on as many platforms supported by each marketplace as possible:
    Not providing a port to a popular platform can cause users to create unofficial ports. Providing a way to add official paid licenses to unofficial game clients can increase revenue and limit piracy.
* Use PlayFab Anonymous sign-in methods with the ability to register for more features:
    PlayFab [supports authenticating without a PlayFab account](../../authentication/login/login-basics-best-practices.md#anonymous-login-mechanisms), and then linking registering later. Many players will resist registering for an account, but will be willing to play anonymously. Anonymous sign-in is a good way to get players to try your game, and then convert them to paying customers later.
* Incentivize online account registration & linking:
    Features that work best with an online account, such as cloud saves, leaderboards, and cross-platform play, can be used to incentivize players to register for an account.
* Provide a purchase path for pirates:
    Even if a player is using an unofficial game client, provide them with a link to the official store page, so they can purchase a license for the game. Some players are unaware they're using a pirated copy.
* Use PlayFab player segmentation to separate "low-trust" player pools:
    PlayFab [supports player segmentation](../../../features/analytics/segmentation/segment-configuration.md), which can be used to separate players into "high-trust" and "low-trust" pools. Trust segments are used to limit access to features that are more likely to be abused by pirates. Some examples of such features are cross-platform play, cloud saves, and leaderboards.
