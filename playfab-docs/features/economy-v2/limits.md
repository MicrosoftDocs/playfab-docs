---
title: Economy V2 Limits
author: fprotti96
description: Document detailing the various limits surrounding Economy V2.
ms.author: fprotti
ms.date: 11/30/2023
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
> - Inventory throttling will be calculated based on the target entity, individually for each API.
> - For example, if a Player or a Title (game service, coudscript, etc.) calls an Inventory API to update the Player entity's inventory, the Limit (Player) throttling will be applied.
> - [Group entity](../../features/entities/index.md#group) inventories are also supported, and Group Entities share the same throttling rate as Player entities. See also [Groups, guilds and clans](../../features/social/groups/index.md).

### Read

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **GetInventoryItems** | 1.67 rps (100 in 60 seconds) | - |
| **GetInventoryCollectionIds** | 1.67 rps (100 in 60 seconds) | - |

### Read Transaction History

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **GetTransactionHistory** | 0.1 rps (30 in 300 seconds) | - |

### Write

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **AddInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **SubtractInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **UpdateInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **PurchaseInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **TransferInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **DeleteInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **ExecuteInventoryOperations** | 0.66 rps (60 in 90 seconds) | - |
| **DeleteInventoryCollection** | 0.16 rps (15 in 90 seconds) | - |

### Redeem

| **API** | **Limit (Player)** | **Limit (Title)** |
|---------|--------------------|-------------------|
| **RedeemAppleAppStoreInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **RedeemGooglePlayInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **RedeemMicrosoftStoreInventorItems** | 0.66 rps (60 in 90 seconds) | - |
| **RedeemNintendoEShopInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **RedeemPlayStationStoreInventoryItems** | 0.66 rps (60 in 90 seconds) | - |
| **RedeemSteamInventoryItems** | 0.66 rps (60 in 90 seconds) | - |

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

The following are the maximum number of items returned for the various APIs. You can use [continuation tokens](/gaming/playfab/features/economy-v2/catalog/search#continuation-tokens) to paginate through results that return more than the limit.

* `SearchItems` - 50 Items per page
* `GetItems` - 50 Items per page
* `GetItemReviews` - 50 Items per page
* `GetItemContainers` - 50 Items per page
* `GetEntityDraftItems` - 50 Items per page

### Catalog Default Page Size

* `SearchItems` - 10 Items per page
* `GetItems` - 10 Items per page
* `GetItemReviews` - 10 Items per page
* `GetItemContainers` - 10 Items per page
* `GetDraftItems` - 10 Items per page
* `GetEntityDraftItems` - 10 Items per page

### Inventory Maximum Page Size

The following are the maximum count of items returned for the various APIs. You can use [continuation tokens](/gaming/playfab/features/economy-v2/catalog/search#continuation-tokens) to paginate through results that return greater than the limit.

| **API** | **Limit with response compression** | **Limit without response compression** |
|---------|--------------------|-------------------|
| **GetInventoryItems** | 250 Items | 50 Items |
| **GetInventoryCollectionIds** | 250 Items | 50 Items |
| **GetTransactionHistory** | 250 Items | 50 Items |

### Inventory Default Page Size

* `GetInventoryItems` - 10 Items per page
* `GetInventoryCollectionIds` - 10 Items per page
* `GetTransactionHistory` - 10 Items per page

### Search Filter Complexity

There are checks enforced to prevent the use of overly complicated `Filter` queries used in `SearchItems` calls. More information can be found [here](/gaming/playfab/features/economy-v2/catalog/search#limits).

## Catalog Item

### Titles

Tiles have a **512 character limit** per country code.

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
(for example, you can add up to five full bundles because 5*50 = 250 that matches the 250 limit)

### Inventory Collections

The max collection size is **10000 items**.

The length limit for the collection list is **unlimited**.

The character limit for a collection's name is **75 characters**.

### Transaction History

The max date range for the transaction history is **unlimited**.

The default date range is of **six months**.

## Inventory Item

### Display Properties

The display properties field has a 1000 byte limit.