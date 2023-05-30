---
title: Economy v2 Catalog Content Types, Tags, & Properties
author: cybtachyon
description: Economy Catalog v2 APIs and Game Manager Interface provide item management and tooling.
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: quickstart
ms.service: playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Catalog v2

[!INCLUDE [notice](../../../includes/_economy-release.md)]

## Creator Entity Type & ID

Besides creating Catalog items at the Title level via Game Manager or the API, you can also create them on behalf of a player. You need the Title player account ID (not the Master player account ID, which is cross-title).

```json
{
  "Item": {
    "CreatorEntity": {
      "Type": "title_player_account",
      "Id": "74657374696E6731"
    },
    "Type": "catalogItem",
    "Title": {
      "NEUTRAL": "Fire Sword!"
    },
    "Description": {
      "NEUTRAL": "Fire Sword! (It's really cool)"
    },
    "ContentType": "Game Item",
    "AlternateIds": [
        {
          "Type": "FriendlyId",
          "Value": "fire_sword"
        }
    ]
  },
  "Publish": false
}
```

## Content Types

A preset list of content types for can be set by providing a list of valid string types.

* Content types exist as a performant filter when searching and make it easier to group items
* You can only have one Content Type per item

## Alternate IDs

Alternate IDs make it easier to work with Catalog v2 items in code or with third party APIs.

### Friendly ID

Friendly ID is the "machine name" of the item - the name that makes it easier to reference in code. Friendly IDs are optional for all items and must be unique within the catalog.

```json
{
  "Item": {
    "Type": "catalogItem",
    "Title": {
      "NEUTRAL": "Fire Sword!"
    },
    "Description": {
      "NEUTRAL": "Fire Sword! (It's really cool)"
    },
    "ContentType": "Game Item",
    "AlternateIds": [
        {
          "Type": "FriendlyId",
          "Value": "fire_sword"
        }
    ]
  },
  "Publish": false
}
```

### Marketplace IDs

The alternate ID is how the various marketplaces identify your product. Since each marketplace has its own set of restrictions and policies, you need to set them according to how your store items are configured per platform.

PlayFab comes with several marketplaces. In order to work with the correct Marketplace Add-on, the marketplace must be in the following values:

[!INCLUDE [add-ons](../../../includes/_add-ons-enum.md)]

Here are some examples of how to configure the alternate IDs for each platform:

* Apple App Store: "product_id", example "com.companyname.productname"
* Google Play: "productId", example "com.companyname.productname"
* Microsoft Store: "productId", example "9NBLGGH42CFD"
* Nintendo E-Shop: "item_id", example "nintendo700100"
* PlayStation Store: "id", example "PLAYFAB00000CUSA"
* Steam: "itemdefid", example "100"

```json
{
  "Item": {
    "Type": "catalogItem",
    "Title": {
      "NEUTRAL": "Fire Sword!"
    },
    "Description": {
      "NEUTRAL": "Fire Sword! (It's really cool)"
    },
    "ContentType": "Game Item",
    "AlternateIds": [
        {
          "Type": "FriendlyId",
          "Value": "fire_sword"
        },
        {
          "Type": "MicrosoftStore",
          "Value": "9NBLGGH42CFD"
        },
        {
          "Type": "AppleAppStore",
          "Value": "com.companyname.productname"
        },
        {
          "Type": "GooglePlay",
          "Value": "com.companyname.productname"
        },
        {
          "Type": "NintendoEShop",
          "Value": "nintendo700100"
        },
        {
          "Type": "PlayStationStore",
          "Value": "PLAYFAB00000CUSA"
        },
        {
          "Type": "Steam",
          "Value": "100"
        }
    ]
  },
  "Publish": false
}
```

## Platforms

You can also provide your own custom platforms. These platforms are added and configured in the v2 Catalog Settings under Platform. You can use platforms as configuration data for deep links or other custom properties.

## Tags

A list of tags can be set by providing a list of valid strings. `Tags` are optional for any item and an item can contain any number of the listed tags.

* Items can have Tags
  * Use tags for text metadata that is consistent and applies to multiple items, such as damage types
  * Tags exist as a search filter
  * You can have multiple Tags per item

## DisplayProperties

Display Properties are custom item properties that can be added to all items in your catalog. Certain properties can be set in the _Display property mappings_ section to be used searches, filters, and orderings when using the [SearchItems](/rest/api/playfab/economy/catalog/search-items) API.

* Items can have Display properties with configured field types
  * Use Display properties for metadata that varies between items, such as lore text
  * Display properties are queryable (indexed, fast query) or searchable (slower text query)
  * You can configure up to five of each type of field to be indexed

When you add a field to `DisplayProperties`, it creates a new index for you in the database. Only documents added or updated after index creation are included. If the Display Property should apply to all items, you need to republish the entire catalog.

`DateTime`, `Double`, and `Queryable String` display properties are **queryable**, these properties can be used in Filter and OrderBy statements.

`Searchable String` display properties are **searchable**; these properties are queried with fuzzy search against the `Search` field. Searchable properties can't be used in Filter and OrderBy statements

Titles are limited to five display properties of each type. For more information, see [Limits](limits.md).

> [!WARNING]
> Display property mappings are stored as an indexed list of key-value pairs. Deleting existing display property mappings can shift indexes and break the behavior of all remaining properties. It's suggested to add an additional property rather than deleting or editing an existing one and you should avoid deleting property mappings unless absolutely necessary
