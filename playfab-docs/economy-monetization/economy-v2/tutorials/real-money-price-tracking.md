---
title: Real money price tracking in Economy v2
author: ernestoc
description: How to set up real money prices on catalog bundles and track revenue from marketplace redemptions
ms.author: ernestoc
ms.date: 02/23/2026
ms.topic: tutorial
ms.service: azure-playfab
keywords: playfab, commerce, economy, pricing, real money, revenue, marketplace, analytics
ms.localizationpriority: medium
---

# Real money price tracking

[!INCLUDE [notice](../../../includes/_economy-release.md)]

When players purchase items through external marketplaces (Apple App Store, Google Play, Steam, Microsoft Store, Nintendo eShop, PlayStation Store), the transaction involves real-world money. By configuring `RealMoneyPriceDetails` on your catalog bundles, PlayFab records the revenue amount in the [marketplace_transaction_redeemed](../../../api-references/events/Inventory/marketplace-transaction-redeemed.md) event, enabling you to build revenue analytics and reporting.

This tutorial walks you through the end-to-end flow: setting real money prices on a bundle, redeeming a purchase, and viewing the revenue data in events.

## Prerequisites

- A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up).
- A title created in [Game Manager](https://developer.playfab.com/).
- A marketplace integration already configured (for example, [Google](../marketplace/marketplace-integrations/google.md), [Apple](../marketplace/marketplace-integrations/apple.md), or [Microsoft Store](../marketplace/marketplace-integrations/microsoft.md)).
- A published bundle with a [Marketplace Mapping](../catalog/bundles.md) linking it to a marketplace product.

## Step 1: Set real money prices on your bundle

Add `RealMoneyPriceDetails` to the bundle that is linked to your marketplace product. Specify prices in the **smallest currency unit** (for example, cents for USD) per marketplace.

### [API](#tab/set-prices-api)

Use [UpdateDraftItem](/rest/api/playfab/economy/catalog/update-draft-item) to add prices to an existing bundle, and then publish it:

```json
{
  "Item": {
    "Id": "{{StarterPackBundleID}}",
    "Type": "bundle",
    "Title": {
      "NEUTRAL": "Starter Pack"
    },
    "ItemReferences": [
      {
        "Id": "{{LaserSwordID}}",
        "Amount": 1
      },
      {
        "Id": "{{GoldCurrencyID}}",
        "Amount": 500
      }
    ],
    "RealMoneyPriceDetails": {
      "GooglePlayPrices": {
        "USD": 499
      },
      "AppleAppStorePrices": {
        "USD": 499
      },
      "MicrosoftStorePrices": {
        "USD": 499
      }
    },
    "AlternateIds": [
      {
        "Type": "GooglePlay",
        "Value": "com.mygame.starterpack"
      },
      {
        "Type": "AppleAppStore",
        "Value": "com.mygame.starterpack"
      },
      {
        "Type": "MicrosoftStore",
        "Value": "9NBLGGH42CFD"
      }
    ]
  },
  "Publish": true
}
```

### [Game Manager](#tab/set-prices-gm)

1. Go to **Economy** > **Catalog (V2)** > **Bundles**.
2. Select the bundle to edit.
3. In the **Prices** section, set the real money price for each marketplace where the bundle appears.
4. Make sure the **Marketplace Mapping** section has the correct AlternateIds for each marketplace.
5. Select **Save and publish**.

---

### Price format reference

Prices use the smallest currency unit. Only **USD** is currently supported.

| Real-world price | Dictionary value |
|---|---|
| $0.99 | `{"USD": 99}` |
| $1.39 | `{"USD": 139}` |
| $4.99 | `{"USD": 499}` |
| $9.99 | `{"USD": 999}` |
| $19.99 | `{"USD": 1999}` |

Set prices only for the marketplaces your title uses. The supported marketplace properties are:

- `AppleAppStorePrices`
- `GooglePlayPrices`
- `MicrosoftStorePrices`
- `NintendoEShopPrices`
- `PlayStationStorePrices`
- `SteamPrices`

### Different prices per marketplace

If you price your game differently across stores, set each marketplace property individually:

```json
"RealMoneyPriceDetails": {
  "GooglePlayPrices": {
    "USD": 499
  },
  "AppleAppStorePrices": {
    "USD": 529
  },
  "SteamPrices": {
    "USD": 449
  }
}
```

## Step 2: Player makes a purchase and redeems

After a player purchases the item from the external marketplace, your game calls the appropriate redeem API:

| Marketplace | Redeem API |
|---|---|
| Google Play | [RedeemGooglePlayInventoryItems](/rest/api/playfab/economy/inventory/redeem-google-play-inventory-items) |
| Apple App Store | [RedeemAppleAppStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-apple-app-store-inventory-items) |
| Microsoft Store | [RedeemMicrosoftStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-microsoft-store-inventory-items) |
| Steam | [RedeemSteamInventoryItems](/rest/api/playfab/economy/inventory/redeem-steam-inventory-items) |
| Nintendo eShop | [RedeemNintendoEShopInventoryItems](/rest/api/playfab/economy/inventory/redeem-nintendo-e-shop-inventory-items) |
| PlayStation Store | [RedeemPlayStationStoreInventoryItems](/rest/api/playfab/economy/inventory/redeem-play-station-store-inventory-items) |

When PlayFab processes the redemption, it:

1. Matches the marketplace receipt to the bundle's `AlternateId`.
2. Grants the bundle's contents to the player's inventory.
3. Emits a `marketplace_transaction_redeemed` event that includes the `RealMoneyPrices` from the matching bundle.

## Step 3: View revenue in events

After a successful redemption, the `marketplace_transaction_redeemed` event is emitted and includes the real money price data. You can find this event in Game Manager or query it through the data pipeline.

### View in Game Manager

1. Go to **Data** > **Event History** (under the **Analyze** section).
2. Search for the `marketplace_transaction_redeemed` event name.
3. Select an event to view its details, including the `RealMoneyPrices` field.

### Example event payload

A Google Play redemption of the Starter Pack ($4.99 USD) produces an event like this:

```json
{
  "EventName": "marketplace_transaction_redeemed",
  "Marketplace": "GooglePlay",
  "MarketplaceTransctionId": "GPA.1234-5678-9012-34567",
  "MarketplaceAlternateId": "com.mygame.starterpack",
  "Amount": 1,
  "ItemId": "{{StarterPackBundleID}}",
  "ItemType": "bundle",
  "RealMoneyPrices": {
    "USD": 499
  }
}
```

The same bundle redeemed from the Apple App Store (priced at $5.29 USD) produces:

```json
{
  "RealMoneyPrices": {
    "USD": 529
  }
}
```

PlayFab uses the price for the specific marketplace where the redemption occurred.

### Query revenue data

You can use the event data for custom analytics. For example, to calculate total revenue over a period, query for all `marketplace_transaction_redeemed` events and sum the `RealMoneyPrices.USD` values:

```
Total revenue = Sum of (RealMoneyPrices.USD × Amount) across all events
```

> [!NOTE]
> `RealMoneyPrices` reflects what you configured in `RealMoneyPriceDetails`, not the actual amount charged by the marketplace. Keep your prices in sync with your marketplace listings for accurate reporting.

## Best practices

- **Always set `RealMoneyPriceDetails` on marketplace bundles.** Without it, the `RealMoneyPrices` field in redemption events is empty, and you lose revenue visibility.
- **Use the smallest currency unit.** For USD, provide the price in cents (for example, `499` for $4.99).
- **Only populate the marketplaces you use.** You don't need to set prices for every marketplace — only the ones your title is published on.
- **Keep prices in sync with your marketplace listings.** When you update prices in an external marketplace, update the corresponding property in `RealMoneyPriceDetails` to maintain accurate reporting.
- **Set per-marketplace prices when they differ.** If your game is priced differently across stores, use the per-marketplace properties to reflect the actual price on each platform.

## See also

- [Real money prices reference](../catalog/real-money-prices.md)
- [Economy v2 Bundles](../catalog/bundles.md)
- [Fraud prevention quickstart](../fraud-prevention/quickstart.md)
- [Marketplace integrations](../marketplace/marketplace-integrations/overview.md)
- [marketplace_transaction_redeemed event](../../../api-references/events/Inventory/marketplace-transaction-redeemed.md)
