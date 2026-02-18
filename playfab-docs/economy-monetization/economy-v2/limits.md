---
title: Economy V2 Limits
author: fprotti96
description: Document detailing the various limits surrounding Economy V2.
ms.author: fprotti
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# Limits - Economy (V2)

[!INCLUDE [notice](../../includes/_economy-release.md)]

The purpose of this guide is to detail the limits that are enforced when creating, updating, and reading from your catalog of items and adding, updating, and removing them from player inventories. It now includes the most updated limits as per Economy (V2).

- Limit (Player) refers to when the entity being targeted is a Player.
- Limit (Title) refers to when the entity being targeted is a Title.

> [!NOTE]
> All APIs are counted separately from one another.

## Catalog Throttling

### Read

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **GetItem** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **GetItems** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **SearchItems** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **GetItemReviews** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **GetItemReviewsSummary** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **GetEntityItemReview** | 1.67 rps (100 in 60 seconds) | 1000 rps (10000 in 10 seconds) |
| **GetItemModerationState** | - | 1000 rps (10000 in 10 seconds) |

### Write/Manage

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **CreateDraftItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **CreateUploadUrls** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **DeleteEntityItemReviews** | - | 100 rps (1000 in 10 seconds) |
| **DeleteItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **GetDraftItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **GetDraftItems** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **GetEntityDraftItems** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **GetItemPublishStatus** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **PublishDraftItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **ReportItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **ReportItemReview** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **ReviewItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **SetItemModerationState** | - | 100 rps (1000 in 10 seconds) |
| **SubmitItemReviewVote** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |
| **TakedownItemReviews** | - | 100 rps (1000 in 10 seconds) |
| **UpdateDraftItem** | 0.33 rps (10 in 30 seconds) | 100 rps (1000 in 10 seconds) |

## Inventory Throttling

> [!NOTE]
>
> - Inventory throttling will be calculated based on the target entity, individually for each API.
> - For example, if a Player or a Title (game service, CloudScript, etc.) calls an Inventory API to update the Player entity's inventory, the Limit (Player) throttling will be applied.
> - [Group entity](../../live-service-management/game-configuration/entities/index.md#group) inventories are also supported, and Group Entities share the same throttling rate as Player entities. See also [Groups](../../community/associations/groups/index.md).

### Read

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **GetInventoryItems** | 0.67 rps (40 in 60 seconds) | - |
| **GetInventoryCollectionIds** | 0.08 rps (5 in 60 seconds) | - |

### Read Transaction History

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **GetTransactionHistory** | 0.1 rps (30 in 300 seconds) | - |

### Write

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **AddInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **SubtractInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **UpdateInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **PurchaseInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **TransferInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **DeleteInventoryItems** | 0.33 rps (20 in 60 seconds) | - |
| **ExecuteInventoryOperations** | 0.33 rps (20 in 60 seconds) | - |
| **DeleteInventoryCollection** | 0.08 rps (5 in 60 seconds) | - |

### Redeem

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **RedeemAppleAppStoreInventoryItems** | 0.16 rps (10 in 60 seconds) | - |
| **RedeemGooglePlayInventoryItems** | 0.16 rps (10 in 60 seconds) | - |
| **RedeemMicrosoftStoreInventoryItems** | 0.16 rps (10 in 60 seconds) | - |
| **RedeemNintendoEShopInventoryItems** | 0.16 rps (10 in 60 seconds) | - |
| **RedeemPlayStationStoreInventoryItems** | 0.16 rps (10 in 60 seconds) | - |
| **RedeemSteamInventoryItems** | 0.16 rps (10 in 60 seconds) | - |

## API Limits

### Binary Content Size

The maximum file size allowed is **500MB**.

### Binary Content Quantity

Up to **100 images** and **100 files** can be added to an item.   

- Files have no restrictions.
- Images can only be uploaded using **.png**, **.jpg**, **.gif**, or **.bmp** file types.

### CreateUploadsUrls

Content blobs/URLs will be garbage collected after **24 hours** if **not** attached to a draft or published item.

### Catalog Maximum Page Size

The following are the maximum number of items returned for the various APIs. You can use [continuation tokens](catalog/search.md#continuation-tokens) to paginate through results that return more than the limit.

- `SearchItems` - 50 Items per page
- `GetItems` - 50 Items per page
- `GetItemReviews` - 50 Items per page
- `GetItemContainers` - 50 Items per page
- `GetEntityDraftItems` - 50 Items per page

### Catalog Default Page Size

- `SearchItems` - 10 Items per page
- `GetItems` - 10 Items per page
- `GetItemReviews` - 10 Items per page
- `GetItemContainers` - 10 Items per page
- `GetDraftItems` - 10 Items per page
- `GetEntityDraftItems` - 10 Items per page

### Inventory Maximum Page Size

The following are the maximum count of items returned for the various APIs. You can use [continuation tokens](catalog/search.md#continuation-tokens) to paginate through results that return greater than the limit.

| **API** | **Limit with response compression** | **Limit without response compression** |
|---------|--------------------|-------------------|
| **GetInventoryItems** | 250 Items | 50 Items |
| **GetInventoryCollectionIds** | 250 Items | 50 Items |
| **GetTransactionHistory** | 250 Items | 50 Items |

### Inventory Default Page Size

- `GetInventoryItems` - 10 Items per page
- `GetInventoryCollectionIds` - 10 Items per page
- `GetTransactionHistory` - 10 Items per page

### Search Filter Complexity

There are checks enforced to prevent the use of overly complicated `Filter` queries used in `SearchItems` calls. More information can be found [here](catalog/search.md#limits).

## Catalog Item

### Catalog creator entity limit

Up to 20GB of catalog data are allowed per Catalog creator entity. This limit is most likely to be encountered for Catalog Items created by the Title entity.

### Titles

Titles have a **512 character limit** per country code.

### Descriptions

Descriptions have a **10000 character limit** per country code.

### Keywords

Keywords have a **50 character limit** per keyword and up to **32 keywords** can be added per country code.

### Display Properties

The Display Properties field has a **10000 byte limit**.

### Tags

Tags have a **32 character limit** per tag.
Titles can have a maximum of **1024 Tags** and
up to **32 Tags** can be added to an item

### Content Types

Content Types have a **32 character limit** per content type.
Titles can have a maximum of **128 Content Types**.

### PricesOptions

The price options list has a length limit of **15 price options**.

### Amounts

The amounts list has a length limit of **15 amounts**.

### UnitDurationInSeconds

The unit duration has a limit of **100 years** (3,155,695,200 seconds).

### AlternateIds

Each alternate ID has a value length limit of **100 characters**.

The list length of alternate IDs has a limit of **15 alternate IDs**.

### DisplayVersion

The display version field has a value length limit of **50 characters**.

### ClientVersion

The client version has a **3 segment limit**, with each segment allowing a maximum value of **65535**.   
For example: "1.65535.234".

### ItemReferences

The ItemReferences field has a limit of **250 items**.

## Catalog Config

### AdminEntities

The list for admin entities has a **64 entity limit**.

### ReviewerEntities

The list for admin entities has a **128 entity limit**.

### Deep Links

The max number of deep links is of **10 links**.

### DisplayPropertyIndexInfo 

There's a limit of **5 values** per each display property type.

### Content Types

The list of content types has a limit of **128 types**, each with a max length of **40 characters**.

### Platforms

The list of platforms has a limit of **128 platforms**, each with a max length of **40 characters**.

### Tags

The list of tags has a limit of **1024 tags**, each with a max length of **32 characters**.

## Player Inventory

### Batch Operations

The max number of inventory operations to be executed is of **50 operations**.

The max number of items to be modified is **300 items**.   
(for example, you can add one full bundle and up to 50 other items)

### Inventory Collections

The max collection size is **10000 items**.

The length limit for the collection list is **1000 collections** per entity.

The character limit for a collection's name is **75 characters**.

### Transaction History

The max date range for the transaction history is **4 years**.

The default date range is of **six months**.

## Inventory Item

### Display Properties

The display properties field has a 1000 byte limit.
