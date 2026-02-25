---
title: Economy v2 Real Money Prices
author: ernestoc
description: Learn how to use RealMoneyPriceDetails to track real-money pricing for catalog items in PlayFab Economy v2.
ms.author: ernestoc
ms.date: 02/19/2026
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, pricing, real money, marketplace, revenue
ms.localizationpriority: medium
---

# Real money prices

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Real money prices allow you to associate real-world currency values with catalog items on a per-marketplace basis. The `RealMoneyPriceDetails` property on a catalog item contains separate price dictionaries for each supported marketplace. This data is used by PlayFab to track revenue from marketplace transactions.

## Overview

When players purchase items through external marketplaces (Apple App Store, Google Play, Steam, Microsoft Store, Nintendo eShop, PlayStation Store), the transaction involves real-world money. By setting `RealMoneyPriceDetails` on your catalog items, PlayFab can:

- **Track revenue** from marketplace redemptions in the [marketplace_transaction_redeemed](../../../api-references/events/Inventory/marketplace-transaction-redeemed.md) event.

## Format

`RealMoneyPriceDetails` is an object with a separate price dictionary for each supported marketplace:

| Property | Type | Description |
| :--- | :--- | :--- |
| `AppleAppStorePrices` | `Dictionary<string, int>` | The Apple App Store price amount per currency code. |
| `GooglePlayPrices` | `Dictionary<string, int>` | The Google Play price amount per currency code. |
| `MicrosoftStorePrices` | `Dictionary<string, int>` | The Microsoft Store price amount per currency code. |
| `NintendoEShopPrices` | `Dictionary<string, int>` | The Nintendo eShop price amount per currency code. |
| `PlayStationStorePrices` | `Dictionary<string, int>` | The PlayStation Store price amount per currency code. |
| `SteamPrices` | `Dictionary<string, int>` | The Steam price amount per currency code. |

Each dictionary maps a three-letter [ISO 4217](https://www.iso.org/iso-4217-currency-codes.html) currency code to a price in the **smallest currency unit** (for example, cents for USD).

> [!NOTE]
> Only **United States Dollar (USD)** is currently supported as a currency code.

You only need to populate the marketplace properties that are relevant to your title. For example, if your game is only on Google Play and the Apple App Store, you only need to set `GooglePlayPrices` and `AppleAppStorePrices`.

### Price examples

| Real-world price | Dictionary value |
| :--- | :--- |
| $0.99 USD | `{"USD": 99}` |
| $1.39 USD | `{"USD": 139}` |
| $4.99 USD | `{"USD": 499}` |
| $9.99 USD | `{"USD": 999}` |

## Setting real money prices on a catalog item

Real money prices are typically set on **bundles** that are linked to external marketplace products via `AlternateIds`. When a player redeems a marketplace purchase, PlayFab uses the `RealMoneyPriceDetails` value from the matching catalog bundle to record the revenue.

### [API](#tab/setting-prices-api)

You can set `RealMoneyPriceDetails` when creating or updating a catalog item using `CreateDraftItem` or `UpdateDraftItem`:

```json
{
  "Item": {
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
      "SteamPrices": {
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
        "Type": "Steam",
        "Value": "starterpack_001"
      }
    ]
  },
  "Publish": true
}
```

You can also set different prices per marketplace if your pricing varies across stores:

```json
"RealMoneyPriceDetails": {
  "GooglePlayPrices": {
    "USD": 499
  },
  "AppleAppStorePrices": {
    "USD": 529
  },
  "MicrosoftStorePrices": {
    "USD": 499
  }
}
```

### [Game Manager](#tab/setting-prices-game-manager)

1. Navigate to **Economy** > **Catalog (V2)**.
2. Under the **Bundles** tab, select the bundle you want to edit or create a new one.
3. In the **Prices** section, configure the real money price for each marketplace.
4. In the **Marketplace Mapping** section, link the bundle to your external marketplace products.

---

## How real money prices appear in events

When a marketplace transaction is redeemed, the price for the corresponding marketplace is included in the [marketplace_transaction_redeemed](../../../api-references/events/Inventory/marketplace-transaction-redeemed.md) event as `RealMoneyPrices`. For example, a Google Play redemption:

```json
{
  "Marketplace": "GooglePlay",
  "MarketplaceTransctionId": "GPA.1234-5678-9012-34567",
  "MarketplaceAlternateId": "com.mygame.starterpack",
  "Amount": 1,
  "ItemId": "{{BundleID}}",
  "ItemType": "bundle",
  "RealMoneyPrices": {
    "USD": 499
  }
}
```

This event data can then be used for:

- Custom analytics queries via the Insights Explorer

## Best practices

- **Always set `RealMoneyPriceDetails` on marketplace bundles.** This ensures accurate revenue tracking and analytics.
- **Use the smallest currency unit.** For USD, provide the price in cents (for example, `499` for $4.99).
- **Only populate the marketplaces you use.** You don't need to set prices for every marketplace — only the ones your title is published on.
- **Keep prices in sync with your marketplace listings.** When you update prices in an external marketplace, update the corresponding property in `RealMoneyPriceDetails` to maintain accurate reporting.
- **Set per-marketplace prices when they differ.** If your game is priced differently across stores, use the per-marketplace properties to reflect the actual price on each platform.

## See also

- [Economy v2 Bundles](bundles.md)
- [Stores](stores.md)
- [Fraud prevention quickstart](../fraud-prevention/quickstart.md)
- [Marketplace integrations](../marketplace/marketplace-integrations/overview.md)
- [marketplace_transaction_redeemed event](../../../api-references/events/Inventory/marketplace-transaction-redeemed.md)
