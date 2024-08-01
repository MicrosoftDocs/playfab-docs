---
title: Economy v2 settings overview
author: cybtachyon
description: Economy v2 settings.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: article
ms.service: azure-playfab
keywords: playfab, economy, settings
ms.localizationpriority: medium
---

# Economy V2 settings

[!INCLUDE [notice](../../includes/_economy-release.md)]

Economy v2 includes the following configuration that can be updated in Game Manager bg selecting **Economy** > **Catalog (V2)** then **⚙️ Settings**.

These settings can also be set and accessed via APIs using the [UpdateCatalogConfig](/rest/api/playfab/economy/catalog/update-catalog-config) and [GetCatalogConfig](/rest/api/playfab/economy/catalog/get-catalog-config) calls respectively. Catalog Config APIs can only be called by [title entities](/gaming/playfab/features/data/entities/#title).

## Economy v2 General Settings

### Catalog admins

Players that you add to **Catalog admins** can administrate your catalog including all read and write operations. Adding these players is useful for providing access to Third Parties who are entering content or localizations for your game.

Catalog Admins are players that are given full title-level access to the published and draft catalog. Players accessing `SearchItems` or `GetItem` APIs have read and write access to all published items including:

* Items with a Non-Approved Moderation State
* Expired Items (Items with past End-Dates)
* Unreleased Items (Items with a future start date)
* Hidden Items

All of the above items wouldn't be accessible to a non-admin player via Search.

Admins also have the ability to edit or delete any item in the draft or public catalog.

### Catalog reviewers

Players that you add to **Catalog reviewers** can administrate and update their reviews and ratings for public (visible and published) items in your catalog. Players with paid accounts or who have been active a certain amount of time are often segments added via [UpdateCatalogConfig](/rest/api/playfab/economy/catalog/update-catalog-config) API call to this list.

* Catalog Admins are players that are given the ability to see unreleased content (any published item with a **future start date**).
* Reviewers are **not** able to edit or delete items (except their own content).

### Display property mappings

Administer deep link formats here. For more information, see [Display Properties](catalog/content-types-tags-and-properties.md) to configure and see [Limits](catalog/limits.md) for limitations.

> [!WARNING]
> Renaming or removing a value will result in broken behavior for existing items. The catalog will need to be refreshed after changes have been made.

### Deep link formats

Administer deep link formats here. For more information, see [Deep Links](catalog/deep-links.md) to configure.

### Platform

Platforms are custom keys for interacting with your game builds and interfaces. You can use any keys you like, and we've provided some suggestions below.

#### Examples

| Platform             |
| -------------------- |
| `mygame-internal`    |
| `mygame-website`     |
| `microsoft`          |
| `microsoft-review`   |
| `microsoft-xbox-pc`  |
| `android-googleplay` |
| `apple-appstore`     |
| `psn-next`           |
| `nintendo-appstore`  |

## Policies

The Policies page allows you to control the client access to the Economy APIs.

Economy v2 uses the [Admin API Policies](/rest/api/playfab/admin/authentication/update-policy) to control API Access. If you make any changes to the JSON, it may break or cause unintentional behavior with the Economy v2 API policies.

Even if APIs are enabled, Players are only able to publish, edit, and delete content they've created. Title Entities are always able to access, delete, and edit any content.

> [!NOTE]
> Although Admin Players are given title-level edit, delete, and access privileges, they are still considered players for the purposes of Policies. For example, if the `DeleteItem` API was disabled for all players, Admins will not be able to delete content (but titles will continue to be able to)

## See also

* [Economy v2 overview](overview.md)
* [Quickstart](quickstart.md)
* [Stores](stores.md)
* [Bundles](bundles.md)
