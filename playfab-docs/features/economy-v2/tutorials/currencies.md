---
title: Economy v2 Virtual Currency Quickstart
author: cybtachyon
description: In this quickstart, you set up your first virtual currencies via the APIs.
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: quickstart
ms.service: playfab
keywords: playfab, commerce, economy, currency, virtual currency
ms.localizationpriority: medium
---

# Set up your first virtual currency

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Get started with PlayFab Economy by using the PlayFab Beta SDK to setup your first virtual currency. After getting an entity token to interact with your title via the APIs, you create and configure a virtual currency.

## Prerequisites

* A [PlayFab developer account](https://developer.playfab.com/sign-up)
* The PlayFab Beta SDK (You can find more information on the [Postman Quickstart](../../../sdks/postman/postman-quickstart.md#adding-playfab-collections))

## Get a title entity token

To make changes to your title config data via the APIs, you first need to obtain a title entity token. You can find more information on the [Postman Quickstart](../../../sdks/postman/postman-quickstart.md#getting-a-title-entity-token)

## Create a new virtual currency

To create a new virtual currency, you will need to call `CreateDraftItem`. In the call, paste the following into the body:

```json
{
  "Item": {
    "CreatorEntity": {
      "Id": "{{TitleID}}",
      "Type": "title"
    },
    "Type": "currency",
    "ContentType": "gameitem",
    "AlternateIds": [
      {
        "Type": "FriendlyId",
        "Value": "AU"
      }
    ],
    "Title": {
      "NEUTRAL": "Gold"
    },
    "StartDate": "2022-09-07T00:00:00.000Z",
  },
  "Publish": true,
  "CustomTags": {
    "user": "{{Email}}"
  }
}
```

* The `FriendlyId` is the currency code, which can contain between one and three alphanumeric values
* The `Title` is the display name that will be shown to the players
* `ContentType` is a categorization of Economy items - this must first be set in the title settings
* `StartDate` is a datetime string representing when the currency will be visible to the players (default is the time of creation)

## Troubleshooting

* Missing/expired entity token
  * If you are attempting to call `CreateDraftItem` and receive a `401: Unauthorized` error, you may have forgotten to get a title entity token, or it might be expired
* The content type '' is not supported
  * If you are attempting to call `CreateDraftItem` and receive a `CatalogBadRequest` with the above message, you need to first create a content type in the catalog settings tab under your title's settings page in Game Manager

## Next steps

Now that you set up your first virtual currency, you can update the currency, you can reward the currency to your players, and catalog items can be assigned prices corresponding to the currency.
