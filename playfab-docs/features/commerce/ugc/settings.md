---
title: SearchItems
author: wesjong
description: Tutorial outlining the settings options for Catalog/UGC
ms.author: wesjong
ms.date: 09/16/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# Settings and Policy Page

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  

The Economy Settings page contains various options to configure UGC and Economy features for your game. These settings can be found under the *Economy* tab under *Title Settings*. These settings can also be set and accessed via APIs using the `UpdateCatalogConfig` and `GetCatalogConfig` calls respectively. Note that these APIs can only be called by title entities.

## Catalog Admins and Reviewers

Both admins and reviewers are a comma-separated list of user IDs.

#### Catalog Admins
Catalog Admins are players that are given full title-level access to the published and draft catalog. When accessing items through the `SearchItems` or `GetItem` APIs, these players will have access to all published items including:

- Items with a Non-Approved Moderation State
- Expired Items (ie. Items with past End-Dates)
- Unreleased Items (ie. Items with a future start date)
- Hidden Items

All of the above items would not be accessible to a non-admin player via Search.

Admins also have the ability to edit or delete any item in the draft or public catalog.

#### Catalog Reviewers
Catalog Admins are players that are given the ability to see unreleased content (ie. any published item with a **future start date**)

Reviewers are **not** able to edit or delete items (except their own content).

## Display Properties

Display Properties are custom item properties that can be added to all items in your catalog. Certain properties can be set in the *Display Property Mappings* section to be used searches, filters, and orderings when using the [`SearchItems` API](/gaming/playfab/features/commerce/ugc/search)

Once you add a field to `DisplayProperties`, you need to republish all of the public catalog items in order to add that field to the indexed values in each item document. Additionally, only the top-level Display Properties are indexed, so anything nested will **NOT** be indexed. Display Property names must be unique for all properties.

`DateTime`, `Double`, and `Queryable String` display properties are **queryable**, these properties can be used in Filter and OrderBy statements.

`Searchable String` display properties are **searchable**, these properties will be queried with fuzzy search against the `Search` field. Searchable properties cannot be used in Filter and OrderBy statements

Titles are limited to 5 display properties of each type.

> [!WARNING]
> Display property mappings are stored as an indexed list of key-value pairs. Deleting existing display property mappings can shift indexes and break the behavior of all remaining properties. It is suggested to add an additional property rather than deleting or editing an existing one and you should avoid deleting property mappings unless absolutely necessary

## Content Types

A pre-set list of content types for UGC can be set by providing a list of valid string types. If none are provided, `ContentType` becomes a free-text, **optional** property when creating and updating items. Otherwise, an item must contain one of the pre-listed types.

## Tags

A pre-set list of tags for UGC can be set by providing a list of valid strings. If none are provided, any number of free-text tags can be added to an item. Otherwise, an item can contain any number of the pre-listed tags.

## Policies

The Policies pages allows you to control the client access to the Economy APIs.

These policies work by adding hidden modifiers to the *Entity Global Title Policy* JSON. Please note that if you have or will make any changes to the JSON, it may break or cause unintentional behavior with the Economy API policies.

Even if it the APIs are enabled, Players are only able to publish, edit, and delete content they have created. Title Entities are always able to access, delete, and edit any content.

> [!NOTE]
> Although Admin Players are given title-level edit, delete, and access privledges, they are still considered players for the purposes of Policies. For example, if the `DeleteItem` API was disabled for all players, Admins will not be able to delete content (but titles will continue to be able to)
