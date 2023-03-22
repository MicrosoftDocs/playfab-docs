---
title: Catalog Limits
author: wesjong
description: Document detailing the various limits surrounding Economy V2.
ms.author: wesjong
ms.date: 03/17/2021
ms.topic: article
ms.service: playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# Limits

[!INCLUDE [notice](../../includes/_economy-release.md)]

The purpose of this guide is to detail the limits that are enforced when creating, updating, and reading from your catalog of items and adding, updating, and removing them from player inventories.

## Item Creation/Updates

### Binary Content Size

Files or images that are **greater than 100MB** in size can't be added to items. It's recommended that larger files are split into several smaller partitions if possible.

> [!NOTE]
> Please contact us if you require storing content larger than 100 MBs.

### Binary Content Quantity

**Up to 100 images and 100 files** can be added to an item. Files have no restrictions while only *.png*, *.jpg*, *.gif*, and *.bmp* file types can be uploaded as images.

> [!NOTE]
  > Each blob should only be used in **one** item. If you wish to have a piece of content repeated in multiple items, you should re-upload the content to different blobs.

### CreateUploadUrls

Content blobs/urls will be **garbage collected after 24hrs** if not attached to a draft or published item.

### Item Updates

These limits affect calls to APIs that create items or modify existing item properties (such as `UpdateDraftItem`,`CreateDraftItem`, and `DeleteItem`)

**[Title entities](/gaming/playfab/features/data/entities/#title)** are limited to **1000 requests over 10 seconds**

**Players** are limited to **10 requests over 30 seconds**

## Item Reads/Searches

### RPS Limits

These limits affect calls to APIs that query items and their properties (such as `SearchItems`,`GetItem`, and `GetDraftItem`)

**[Title entities](/gaming/playfab/features/data/entities/#title)** are limited to **10000 requests over 10 seconds**

**Players** are limited to **100 requests over 60 seconds**

### Maximum Page Size

The following are the maximum count of items returned for the various APIs. You can use [continuation tokens](/gaming/playfab/features/economy-v2/catalog/search#continuation-tokens) to paginate through results that return greater than the limit.

* `SearchItems` - 50 Items
* `GetDraftItems` - 50 Items
* `GetItems` - 50 Items
* `GetItemReviews` - 50 Items

### Filter Complexity

There are checks enforced to prevent the use of overly complicated `Filter` queries used in `SearchItems` calls. More information can be found [here](/gaming/playfab/features/economy-v2/catalog/search#limits)

## Item Metadata

### Titles

Tiles have a **512 character limit** per country code.

### Descriptions

Descriptions have a **10000 character limit** per country code.

### Keywords

Keywords have a **50 character limit** per keyword and up to **32 keywords** can be added per country code.

### Display Properties

The Display Properties field has a **10000 character limit**.

### Tags

Tags have a **32 character limit** per tag.
Titles can have a maximum of **1024 Tags** and
up to **32 Tags** can be added to an item

### Content Types

Content Types have a **32 character limit** per content type.
Titles can have a maximum of **128 Content Types**.
