---
title: Item Status & Moderation
author: wesjong
description: Article outlining the different visibility and access states an item can be in
ms.author: wesjong
ms.date: 09/16/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# Item Permissions and Visibility

[!INCLUDE [notice](../../../includes/_economy-release.md)]

Catalog Items can be given different parameters and values that change whether the item is visible to different players through the public catalog or other APIs. This document will go over the different states an item can be in and how it can affect who can see or modify them.

## Unpublished Draft Items

Draft items are created using the `CreateDraftItem` and haven't been published. These items are available to only the Item Creator, [Catalog Admins](/gaming/playfab/features/economy-v2/settings/#catalog-admins), and [Title Entities](/gaming/playfab/features/data/entities/#title). Both `GetDraftItem` and `UpdateDraftItem` can be called on these items.

## Published Items

Published Items that have a valid start and end date pair (that is, StartDate < CurrentDate < EndDate), are visible to all players via the Public Catalog. Players can access published items using the `SearchItems` and `GetItem` APIs.

## Scheduled Items

Scheduled Items are Published Items that have future start date (that is, CurrentDate < StartDate). These items are only accessible by the Item Creator, Catalog Admins, Catalog Reviewers, and Title Entities. These items will **not** show up in the Published Catalog and can't be accessed using `GetItem` API for regular players.

## Expired Items

Expired Items are Published Items that have past end date (that is, CurrentDate > EndDate). These items will **not** show up in the Published Catalog via the `SearchItems` API but these items **can** be accessed using `GetItem` API for all players.

## Hidden Items

Expired Items are Published Items that have the `IsHidden` flag set to true. These items will **not** show up in the Published Catalog via the `SearchItems` API but these items **can** be accessed using `GetItem` API for all players.

## Non-Approved Moderated Items

Via the [Moderation APIs](/gaming/playfab/features/economy-v2/ugc/moderation), Published Items can be set with a moderation status. Published Items that have any status that isn't `Approved` (that is, `AwaitingModeration`, `Rejected`, or `Unknown`) are only accessible by the Item Creator, Catalog Admins, and Title Entities. These items will **not** show up in the Published Catalog and can't be accessed using `GetItem` API for regular players.
