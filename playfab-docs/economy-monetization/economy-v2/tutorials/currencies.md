---
title: Economy v2 Virtual Currency Quickstart
author: cybtachyon
description: In this quickstart, you set up your first virtual currencies via the APIs.
ms.author: derekreese
ms.date: 7/27/2023
ms.topic: quickstart
ms.service: azure-playfab
keywords: playfab, commerce, economy, currency, virtual currency
ms.localizationpriority: medium
---

# Set up your first virtual currency

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Get started with PlayFab Economy by using the [PlayFab Services SDK](/gaming/playfab/sdks/playfab-sdk-intro) to set up your first virtual currency. After getting an entity token to interact with your title via the APIs, you create and configure a virtual currency.

## Prerequisites

* A [PlayFab developer account](https://developer.playfab.com/en-us/sign-up)
* The PlayFab Beta SDK (You can find more information on the [Postman Quickstart](../../../sdks/postman/postman-quickstart.md#adding-playfab-collections))

## Get a title entity token

To make changes to your title config data via the APIs, you first need to obtain a title entity token. You can find more information on the [Postman Quickstart](../../../sdks/postman/postman-quickstart.md#getting-a-title-entity-token)

## Create a new virtual currency

To create a new virtual currency, you need to create a Draft Item of type Currency.

### [Game Manager](#tab/create-currency-gm)

1. Navigate to the **Economy** tab in Game Manager and select **Catalog (V2)**.
1. Choose **Currency** and select **New currency**.
1. Edit the **Title** and add a **Description** - for example, `Diamonds`, `Our in-game currency of choice.`.
1. Select **Save and publish** to complete your changes.
1. Observe your currency in the **Currency** list.

### [REST API](#tab/create-currency-api)

Call [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item). Use the following body:

```JSON
{
  "Item": {
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "currency",
    "AlternateIds": [
      {
        "Type": "FriendlyId",
        "Value": "diamonds"
      }
    ],
    "Title": {
      "NEUTRAL": "Diamonds"
    },
    "Description": {
      "NEUTRAL": "Our in-game currency of choice."
    },
    "StartDate": "2023-07-27T00:00:00.000Z",
  },
  "Publish": true,
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

---

* The `FriendlyId` is the currency code, which can contain between one and three alphanumeric values
* The `Title` is the display name that is shown to the players
* `ContentType` is a categorization of Economy items. You must first set the Content Type in ⚙️ > Title Settings > Economy > Catalog (V2) Settings.
* `StartDate` is a datetime string representing when the currency is visible to the players (default is the time of creation)

## Troubleshooting

* Missing/expired entity token
  * If you're attempting to call `CreateDraftItem` and receive a `401: Unauthorized` error, you may have forgotten to get a title entity token, or it might be expired
* The content type `''` isn't supported
  * If you're attempting to call `CreateDraftItem` and receive a `CatalogBadRequest` with the above message, you need to first create a content type in the catalog settings tab under your title's settings page in Game Manager

## Next steps

Now that you set up your first virtual currency, you can:

1. Add the currency to PlayFab Bundles you sell in app stores.
1. Have the game server reward the currency to your players with [AddInventoryItems](/rest/api/playfab/economy/inventory/add-inventory-items).
1. Assign prices to Catalog Items corresponding to the currency.
1. Allow players to purchase Catalog Items with the currency using [PurchaseInventoryItems](/rest/api/playfab/economy/inventory/purchase-inventory-items).
