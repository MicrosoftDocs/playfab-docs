---
title: Marketplace integration - Microsoft Store
author: mareg
description: How to redeem Microsoft Store in-app purchases through PlayFab Economy v2
ms.author: mareg
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, integration, marketplace, microsoft store, xbox, redeem, consumable, durable
ms.localizationpriority: medium
---

# Marketplace integration: Microsoft Store

This tutorial shows you how to redeem Microsoft Store in-app purchases (including Xbox) through PlayFab Economy v2 using the [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items) API.

By the end of this tutorial, you:

- Created an add-on in Partner Center
- Configured the required Partner Center and PlayFab settings
- Linked your Microsoft Store product to a PlayFab catalog Bundle
- Called the Redeem API and verified items in your player's inventory

## Prerequisites

1. A [Partner Center](https://partner.microsoft.com/) account with access to your app.
2. An app already created in Partner Center.
3. A Title already created in [Game Manager](https://developer.playfab.com/).
4. The player calling the Redeem API must be authenticated to PlayFab using an Xbox Live identity (for example, via `LoginWithXbox`). Players authenticated with other identity types (such as CustomID or email) do not have the Xbox context required for this flow.

## Supported product types

The `RedeemMicrosoftStoreInventoryItems` API supports the following Microsoft Store product types:

- **Developer-managed consumable** — Products that can be purchased, used, and purchased again (for example, in-game currency packs). The game service is responsible for tracking fulfillment.
- **Durable** — Products that are purchased once and owned permanently (for example, DLC, expansion packs, season passes, or cosmetic items).

> [!IMPORTANT]
> **Store-managed consumables are not supported.** PlayFab Economy v2 cannot redeem Store-managed consumables. If your add-on is configured as a Store-managed consumable, the Redeem API returns an HTTP 200 response with empty results and no error, making the issue difficult to diagnose.

## Step 1: Create your add-on in Partner Center

1. Sign in to [Partner Center](https://partner.microsoft.com/) and navigate to your app.
2. Under **Add-ons**, select **Create a new add-on**.
3. Select the appropriate product type:
   - **Developer-managed consumable** for items that can be repurchased (currency, consumable packs).
   - **Durable** for one-time purchases (DLC, season passes, cosmetic unlocks).
4. Complete the add-on configuration (pricing, descriptions, and so on) and submit it.

> [!IMPORTANT]
> When creating a Developer-managed consumable, Partner Center displays a warning that reads: *"Xbox requires consumables to be managed, so do not use this option and create a 'managed consumable' add-on instead. If you have any questions, contact your Microsoft representative."**
>
> This warning reflects general Xbox platform guidance and **does not apply to the PlayFab redemption flow**. Developer-managed consumables work correctly on Xbox when used with PlayFab's `RedeemMicrosoftStoreInventoryItems` API. You can safely proceed with this product type.

5. After creating your add-on, note the **Store ID**—the alphanumeric string (for example, `9NBLGGH42CFD`) shown in Partner Center. Use this value for PlayFab, **not** the developer-defined Product ID, or the add-on name.

For more information on product types, see [Choosing the right product type](/gaming/gdk/docs/store/commerce/getting-started/xstore-choosing-the-right-product-type).

## Step 2: Configure Product Group, Dev Studio, and Business Partner ID

This step configures the delegated Xbox Security Token Service (XSTS) token flow that PlayFab uses to query the Microsoft Store Collections API on behalf of the player.

> [!WARNING]
> The Product Group, Dev Studio, and Business Partner ID configuration is the most commonly missed step. Without it, the Redeem API call succeeds (HTTP 200) but the Collections API returns zero items—resulting in empty `Succeeded`, `Failed`, and `TransactionIds` arrays with no error message.

1. In [Partner Center](https://partner.microsoft.com/), navigate to **Developer Settings** > **Xbox Live** > **Web Services** and generate a Business Partner Certificate if you have not already.
2. Navigate to **Developer Settings** > **Xbox Live** > **Business Partner** and note the **Business Partner ID** that matches the web service your relying party is tied to.
3. Create a **Dev Studio** (or use an existing one) and set its **Dev Studio ID** to match the **Business Partner ID** from step 2. If the Dev Studio already has a different ID, create a new Dev Studio rather than changing the existing value. Changing it can break existing services.
4. Create a **Product Group** and assign it to the Dev Studio from step 3.
5. Add your game product **and** all of your add-ons to the **Included in this product group** list. Items must be explicitly moved from the "available" side to the "included" side.
6. Select **Save**.
7. Navigate to your game's **Xbox Settings** page and confirm the linked **Business Partner** matches the one from step 2.
8. **Republish** your game product and all add-ons to the Microsoft Store in your target sandbox or RETAIL environment.

For the full configuration walkthrough, see [Configure products with delegated authentication (XSTS tokens)](/gaming/gdk/docs/store/commerce/service-to-service/xstore-authenticating-your-service#additional-configuration-required-to-view-and-manage-products-with-delegated-authentication-xsts-tokens).

## Step 3: Enable the Xbox Network add-on in Game Manager

The Xbox Network add-on links your Partner Center product to your PlayFab title and enables Xbox token validation for Microsoft Store redemption.

1. Open [Game Manager](https://developer.playfab.com/) and select your **Title**.
2. Select **Add-ons** from the left navigation menu.
3. Locate and select the **Xbox Network** add-on (labeled **Distribute for Xbox**).
4. Select the correct **Seller ID** from the dropdown. If you do not see the correct Seller ID, select **Sign in with a different partner center account**.
5. Select your **Partner Center Product ID** from the dropdown and confirm the **Xbox Live Title ID** (decimal) matches what you see in Partner Center under **Xbox services** > **Xbox Settings**.
6. Select **Install Xbox Network** to save the configuration.

For more details, see [Xbox Live add-on configuration](/gaming/playfab/identity/player-identity/platform-specific-authentication/xbox-live-add-on).

> [!NOTE]
> Game Manager also has a separate **Microsoft Store** add-on page (also under **Add-ons**). While it does not require configuration, it contains useful guidance including confirmation of supported product types and details on the Dev Studio ID and Business Partner ID setup.

## Step 4: Create a PlayFab Bundle with Marketplace Mapping

To link your Microsoft Store product to your PlayFab catalog, create a **Bundle** with a **Marketplace Mapping** (AlternateId).

1. In [Game Manager](https://developer.playfab.com/), navigate to **Economy** > **Catalog (V2)** > **Bundles**.
2. Select **New bundle** (or edit an existing one).
3. Under the **Marketplace Mapping** section, add a new mapping:
   - Set the **Marketplace type** to `MicrosoftStore` (case-sensitive, must be exactly `MicrosoftStore`).
   - Set the **value** to the exact **Store ID** from Partner Center (for example, `9NBLGGH42CFD`). Do not use the developer-defined Product ID or the add-on name.
4. Add the items you want the player to receive when this Bundle is redeemed (for example, in-game currency, virtual items).
5. **Publish** the Bundle. Unpublished (draft) Bundles are not matched during redemption.

For more information on alternate IDs, see [Alternate IDs](/gaming/playfab/economy-monetization/economy-v2/catalog/content-types-tags-and-properties#alternate-ids).

## Step 5: Acquire and provide the Xbox token

When calling the [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items) API, you must provide a valid Xbox token in the `XboxToken` parameter.


- If you are using the **GDK C API**, use:

  ```cpp
  XUserGetTokenAndSignatureAsync  // with method "POST", URL "https://playfabapi.com/", and empty body ""
  ```

All three parameters (method, URL, and body) must be provided exactly as shown. An incorrectly obtained token causes the Collections API query to fail silently, returning empty results with no error.

## Step 6: Test the integration

Before considering your integration complete, verify the full end-to-end flow:

1. Ensure your add-on is published to the sandbox or environment you are testing in.
2. Sign in as a test player using an Xbox Live identity and make a test purchase of the add-on through the Microsoft Store. The player must have an unredeemed purchase on their account before the Redeem API has anything to detect.
3. Call `RedeemMicrosoftStoreInventoryItems` with the player's `XboxToken`.
4. Verify the response contains entries in the `Succeeded` array and that the corresponding items appear in the player's PlayFab inventory.

> [!NOTE]
> **Developer-managed consumable fulfillment:** After a Developer-managed consumable is redeemed, PlayFab automatically reports it as **fulfilled** (consumed) with the Microsoft Store on your behalf. The fulfillment step is necessary before the player can purchase the consumable again. If the consumable does not appear as fulfilled after a successful redemption, retry the `RedeemMicrosoftStoreInventoryItems` call. If the issue persists, escalate to the PlayFab team through your support channel. For details, see [Managing consumables and refunds](/gaming/gdk/docs/store/commerce/service-to-service/xstore-managing-consumables-and-refunds).

## Troubleshooting

If the `RedeemMicrosoftStoreInventoryItems` call returns successfully (HTTP 200) but the `Succeeded`, `Failed`, and `TransactionIds` arrays in the response are all empty, the Microsoft Store Collections API is not finding any matching items to redeem. A configuration issue typically causes this behavior. Check the following items:

| Issue | Resolution |
|---|---|
| **Wrong product type** | Ensure the add-on is a **Developer-managed consumable** or **Durable**, not a Store-managed consumable. PlayFab does not support Store-managed consumables. |
| **Incorrect Store ID in PlayFab** | Confirm the Marketplace Mapping value matches the **Store ID** (alphanumeric string like `9NBLGGH42CFD`), not the developer-defined Product ID or add-on name. |
| **Bundle not published** | Publish the Bundle in your PlayFab catalog. Draft Bundles are not matched during redemption. |
| **Missing Product Group configuration** | Confirm your game and add-ons are included in a Product Group tied to the correct Dev Studio and Business Partner ID. The Product Group configuration is the most commonly missed step. See [Step 2](#step-2-configure-product-group-dev-studio-and-business-partner-id). |
| **Xbox Network add-on not configured** | Install and configure the Xbox Network add-on in Game Manager. See [Step 3](#step-3-enable-the-xbox-network-add-on-in-game-manager). |
| **No unredeemed purchase** | The player must have an unredeemed purchase of the product before the API can detect and redeem it. Make a test purchase first. |
| **Consumable not fulfilled** | PlayFab automatically fulfills Developer-managed consumables after redemption. If a consumable was redeemed once but does not redeem again, retry the `RedeemMicrosoftStoreInventoryItems` call. If the issue persists, escalate to the PlayFab team through your support channel. See [Managing consumables and refunds](/gaming/gdk/docs/store/commerce/service-to-service/xstore-managing-consumables-and-refunds). |
| **Sandbox mismatch** | Ensure the add-on is published to the same sandbox you are testing in. The Xbox token carries sandbox context, so both must match. |
| **Invalid Xbox token** | Verify the token is obtained with the correct parameters: method `POST`, URL `https://playfabapi.com/`, and an empty body string `""`. |
| **Player not authenticated with Xbox identity** | The player must be signed in to PlayFab using an Xbox Live identity (for example, via `LoginWithXbox`). Other identity types do not have the Xbox context required for redemption. |

If the API returns an HTTP error (such as 400), check the error response for the following codes:

| Error code | Description |
|---|---|
| `InvalidCatalogItemConfiguration` | The Bundle or Marketplace Mapping is misconfigured in the PlayFab catalog. |
| `InvalidXboxLiveToken` | The Xbox token is invalid, expired, or obtained with incorrect parameters. |
| `AccountNotLinked` | The player's PlayFab account is not linked to an Xbox Live identity. |
| `XboxInaccessible` | PlayFab cannot reach Xbox services. The error may be transient. |
| `XboxXASSExchangeFailure` | The XSTS token exchange failed. Verify your Business Partner and relying party configuration. |

> [!TIP]
> If the call succeeds (HTTP 200) but returns empty results and all other configuration looks correct, check the Product Group configuration first. The Product Group step is the most commonly missed step.

## Note on PC / Windows titles

This tutorial covers the Xbox flow, which uses delegated XSTS tokens (passed via the `XboxToken` parameter). For **PC / Windows titles**, Microsoft recommends using User Store IDs with Microsoft Entra ID for service-to-service authentication instead. For more information, see [Requesting a User Store ID for service-to-service authentication](/gaming/gdk/docs/store/commerce/service-to-service/xstore-requesting-a-userstoreid) and [Authenticating your service — User Store IDs](/gaming/gdk/docs/store/commerce/service-to-service/xstore-authenticating-your-service#authenticating-through-microsoft-entra-id-and-user-store-ids).

## See also

- [RedeemMicrosoftStoreInventoryItems API reference](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items)
- [Fraud prevention quickstart](/gaming/playfab/economy-monetization/economy-v2/fraud-prevention/quickstart)
- [Xbox Live add-on configuration](/gaming/playfab/identity/player-identity/platform-specific-authentication/xbox-live-add-on)
- [Authenticating your service (XSTS tokens)](/gaming/gdk/docs/store/commerce/service-to-service/xstore-authenticating-your-service)
- [Choosing the right product type](/gaming/gdk/docs/store/commerce/getting-started/xstore-choosing-the-right-product-type)
- [Consumable-based ecosystems](/gaming/gdk/docs/store/commerce/fundamentals/xstore-consumable-based-ecosystems)
- [Managing consumables and refunds](/gaming/gdk/docs/store/commerce/service-to-service/xstore-managing-consumables-and-refunds)
- [Alternate IDs (Marketplace Mapping)](/gaming/playfab/economy-monetization/economy-v2/catalog/content-types-tags-and-properties#alternate-ids)
- [How to successfully integrate an Apple app into Game Manager](apple.md)
- [How to successfully integrate a Google app into Game Manager](google.md)
