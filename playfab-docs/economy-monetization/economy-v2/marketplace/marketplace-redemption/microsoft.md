---
title: Redemption with the Microsoft Store Marketplace
author: mareg
description: Set up PlayFab and the Microsoft Store to enable purchases and redemption on Xbox and Windows
ms.author: mareg
ms.date: 02/22/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, integration, marketplace, microsoft store, xbox, purchase, redemption
ms.localizationpriority: medium
---

# Set up PlayFab and the Microsoft Store to enable purchases

This tutorial shows you how to:

- Create a purchasable product in the Microsoft Store
- Map it to a PlayFab bundle
- Redeem purchased items into a player's inventory using the [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items) API

## Prerequisites

1. A Title in PlayFab's [Game Manager](https://developer.playfab.com/).
2. An existing [integration between the selected Title and the Microsoft Store](../marketplace-integrations/microsoft.md), including:
    - The **Xbox Network** add-on installed and configured in Game Manager.
    - The **Product Group**, **Dev Studio**, and **Business Partner ID** configured in Partner Center.
3. A [Partner Center](https://partner.microsoft.com/) account with access to your app.
4. An app already created in Partner Center.
5. The player calling the Redeem API must be authenticated to PlayFab using an Xbox Live identity (for example, via `LoginWithXbox`). Players authenticated with other identity types (such as CustomID or email) do not have the Xbox context required for this flow.

## Step 1: Create your add-on in Partner Center

If you did not create an add-on in Partner Center as part of the [marketplace integration setup](../marketplace-integrations/microsoft.md#step-1-create-your-add-on-in-partner-center), follow these steps:

1. Sign in to [Partner Center](https://partner.microsoft.com/) and navigate to your app.
2. Under **Add-ons**, select **Create a new add-on**.
3. Select the appropriate product type:
   - **Developer-managed consumable** for items that can be repurchased (currency, consumable packs).
   - **Durable** for one-time purchases (DLC, season passes, cosmetic unlocks).
4. Complete the add-on configuration (pricing, descriptions, and so on) and submit it.
5. After creating your add-on, note the **Store ID**—the alphanumeric string (for example, `9NBLGGH42CFD`) shown in Partner Center. Use this value for the marketplace mapping in PlayFab, **not** the developer-defined Product ID, or the add-on name.

> [!IMPORTANT]
> **Store-managed consumables are not supported.** Only Developer-managed consumables and Durables work with the `RedeemMicrosoftStoreInventoryItems` API. Partner Center may display a warning suggesting that Developer-managed consumables are not supported on Xbox. This warning does not apply when using the PlayFab redemption flow. For more information, see [Choosing the right product type](/gaming/gdk/docs/store/commerce/getting-started/xstore-choosing-the-right-product-type).

6. Publish the add-on to the sandbox or environment you intend to test in.

## Step 2: Create a Bundle in Game Manager

> [!NOTE]
> Before creating a bundle in **Game Manager**, create and publish the items you want to add to the bundle in your Catalog. If you need guidance on how to create an item, refer to [this step](../../tutorials/craftingGame/crafting-game-game-manager.md#step-4---create-your-first-item).

To enable a marketplace mapping between **Game Manager** and the **Microsoft Store**, you need to create a **Bundle** in Game Manager. A bundle can contain multiple items with different quantities, and PlayFab adds them to the player's inventory once redeemed. Follow these steps:

1. Go to [Game Manager](https://developer.playfab.com/) and navigate to your **Title**.
2. From the left navigation menu, choose **Engage** > **Economy**.
3. Select the **Bundles** tab.
4. Select **New bundle**.
5. Add any information you want to the **Bundle**, such as items and prices.
6. Scroll down to the end of the page and select **Save and publish** if you want it to be redeemable by players right away. Select **Save as draft** if you want to publish it at a later date.

### Add items to your Bundle

A bundle by itself does not grant any items to a player. You must first link items to it. Once redeemed, the bundle grants those items to the specific player.

To add items to your bundle:

1. Go to the **Items** section in edit mode.
2. Select **Add**. A window appears showing all your catalog items.
3. Find your desired item and select **Add** next to it.
4. Select the **Add** button at the bottom.

## Step 3: Enable marketplace mapping

To ensure that when a player purchases a product from the Microsoft Store it gets properly matched and assigned in Game Manager, you must configure the **Marketplace Mapping** on your Bundle.

1. Navigate to your bundle in edit mode.
2. Scroll down to the **Marketplace Mapping** section.
3. From the **Marketplace** dropdown, select **MicrosoftStore** (case-sensitive, must be exactly `MicrosoftStore`).
4. For your **Marketplace ID**, use the exact **Store ID** from Partner Center (for example, `9NBLGGH42CFD`). Do **not** use the developer-defined Product ID.
5. Select the **+** at the right side of that row and **Save** your changes.

> [!IMPORTANT]
> The Bundle must be **published** (not left as a draft) for it to be matched during redemption. The redemption API does not detect unpublished catalog items.

For more information on alternate IDs, see [Alternate IDs](/gaming/playfab/economy-monetization/economy-v2/catalog/content-types-tags-and-properties#alternate-ids).

## Step 4: Authenticate your player

Before making a redemption call, you must ensure that the player is properly authenticated. For Xbox and Microsoft Store scenarios, use [LoginWithXbox](/rest/api/playfab/client/authentication/login-with-xbox) to authenticate the player with PlayFab.

After a successful call to `LoginWithXbox`, PlayFab returns an `EntityToken` that you must use in the headers of your redemption call with the `X-EntityToken` key.

## Step 5: Acquire the Xbox token

The `RedeemMicrosoftStoreInventoryItems` API requires a valid Xbox token in the `XboxToken` parameter. This token is separate from the `EntityToken` used for authentication.

- If you are using the **GDK C API**, use:

  ```cpp
  XUserGetTokenAndSignatureAsync  // with method "POST", URL "https://playfabapi.com/", and empty body ""
  ```

All three parameters (method, URL, and body) must be provided exactly as shown. An incorrectly obtained token causes the Microsoft Store Collections API query to fail silently, returning no items.

## Step 6: Make a purchase

The player must purchase the add-on from the Microsoft Store before you can redeem it through PlayFab. This purchase can be made through the Xbox or Windows Store interface.

> [!NOTE]
> If you are testing in a sandbox environment, ensure the player account and the add-on are both published to the same sandbox. The player must have an **unredeemed purchase** on their account for the redemption API to find items to redeem.

## Step 7: Redeem the purchase

With your player authenticated, the Xbox token acquired, and a purchase completed, you are ready to call the [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items) API.

Include the `EntityToken` as the `X-EntityToken` header, and provide the Xbox token in the request body:

```json
{
    "XboxToken": "{Your Xbox token from GetTokenAndSignatureAsync}"
}
```

### How redemption works

When the `RedeemMicrosoftStoreInventoryItems` call is made, PlayFab uses the Xbox token to query the Microsoft Store Collections API for any unredeemed purchases associated with the player's account. It then matches those purchases against the **Store IDs** configured in your PlayFab Bundle Marketplace Mappings and grants the corresponding items.

A successful response includes a `200` status code alongside the [RedeemMicrosoftStoreInventoryItemsResponse](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items), which contains:

- **Succeeded**—A list of successfully redeemed items.
- **Failed**—A list of items that failed to redeem.
- **TransactionIds**—IDs for each redemption transaction.

Each redemption action triggers a corresponding event in the player's transaction history, which can be retrieved from the **Transaction History (V2)** tab under the player's overview page in [Game Manager](https://developer.playfab.com/).

Alongside the record in the player's transaction history, an `items_redeemed` **PlayStream** event is also triggered and logged. You can access these logs for your Title by going to the **Data** page under the **Analyze** section of the left navigation bar in [Game Manager](https://developer.playfab.com/).

### Fulfillment for Developer-managed consumables

If the redeemed product is a **Developer-managed consumable**, PlayFab automatically reports it as **fulfilled** (consumed) with the Microsoft Store on your behalf after a successful redemption. The fulfillment step is necessary before the player can repurchase the same consumable. If the consumable does not appear as fulfilled after a successful redemption, retry the `RedeemMicrosoftStoreInventoryItems` call. If the issue persists, escalate to the PlayFab team through your support channel. Durables do not require fulfillment because they are one-time purchases. For more information, see [Managing consumables and refunds](/gaming/gdk/docs/store/commerce/service-to-service/xstore-managing-consumables-and-refunds).

## Troubleshooting

If the redemption call returns `200` but all three arrays (`Succeeded`, `Failed`, `TransactionIds`) are empty, the Microsoft Store Collections API is not finding any matching items. This result typically indicates a configuration issue. See the [troubleshooting section](../marketplace-integrations/microsoft.md#troubleshooting) in the Microsoft Store integration guide for a full list of common causes and resolutions.

If the API returns an HTTP error (such as 400), check the error response for codes like `InvalidCatalogItemConfiguration`, `InvalidXboxLiveToken`, or `AccountNotLinked`.

## See also

- [Microsoft Store marketplace integration](../marketplace-integrations/microsoft.md)
- [RedeemMicrosoftStoreInventoryItems API reference](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)
- [Fraud prevention quickstart](/gaming/playfab/economy-monetization/economy-v2/fraud-prevention/quickstart)
- [Xbox Live add-on configuration](/gaming/playfab/identity/player-identity/platform-specific-authentication/xbox-live-add-on)
- [How to successfully integrate an Apple app into Game Manager](../marketplace-integrations/apple.md)
- [How to successfully integrate a Google app into Game Manager](../marketplace-integrations/google.md)
