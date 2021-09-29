---
title: Item Visibility
author: wesjong
description: Tutorial outlying the different visibility and access states an item can be in
ms.author: wesjong
ms.date: 09/16/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# Item Permissions and Visibility

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.

Catalog Items can be given different parameters and values that change whether the item is visible to different players through the public catalog or other APIs. This document will go over the different states an item can be in and how it can affect who can see or modify them.

## Draft Items
Draft items are items created using the `CreateDraftItem` and have not been published. These items are available to only the Item Creator, [Catalog Admins](/gaming/playfab/features/commerce/ugc/settings/#catalog-admins), and [Title Entities](/gaming/playfab/features/data/entities/#title). Both `GetDraftItem` and `UpdateDraftItem` can be called on these items.

## Published Items
Published Items that have a valid start and end date pair (ie. StartDate < CurrentDate < EndDate), are visible to all players via the Public Catalog. Players can access published items using the `SearchItems` and `GetItem` APIs.

## Scheduled Items
Scheduled Items are Published Items that have future start date (ie. CurrentDate < StartDate). These items are only accessible by the Item Creator, Catalog Admins, Catalog Reviewers, and Title Entities. These items will **not** show up in the Published Catalog and cannot be accessed using `GetItem` API for regular players.

## Expired Items

Expired Items are Published Items that have past end date (ie. CurrentDate > EndDate). These items will **not** show up in the Published Catalog via the `SearchItems` API but these items **can** be accessed using `GetItem` API for all players.

## Hidden Items

Expired Items are Published Items that have the `IsHidden` flag set to true. These items will **not** show up in the Published Catalog via the `SearchItems` API but these items **can** be accessed using `GetItem` API for all players.

## Non-Approved Moderated Items

Via the [Moderation APIs](/gaming/playfab/features/commerce/ugc/moderation), Published Items can be set with a moderation status. Published Items that have any status that is not `Approved` (ie. `AwaitingModeration`, `Rejected`, or `Unknown`) are only accessible by the Item Creator, Catalog Admins, and Title Entities. These items will **not** show up in the Published Catalog and cannot be accessed using `GetItem` API for regular players.
