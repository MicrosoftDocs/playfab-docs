---
title: Economy v2 Catalog Content Types, Tags, & Properties
author: cybtachyon
description: Economy Catalog v2 APIs and Game Manager Interface provide item management and tooling.
ms.author: derekreese
ms.date: 9/07/2022
ms.topic: quickstart
ms.prod: playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Catalog v2

[!INCLUDE [notice](../../../includes/_economy-release.md)]

## Content Types

A pre-set list of content types for can be set by providing a list of valid string types.

* Items _must_ have a Content Type
  * Content types exist as a default performant filter when searching and make it easier to group items
  * You can only have one Content Type per item

## Tags

A pre-set list of tags can be set by providing a list of valid strings. `Tags` are optional for any item and an item can contain any number of the pre-listed tags.

* Items can have Tags
  * Use tags for text metadata that is consistent and applies to multiple items, such as damage types
  * Tags exist as a search filter
  * You can have multiple Tags per item

## DisplayProperties

Display Properties are custom item properties that can be added to all items in your catalog. Certain properties can be set in the _Display property mappings_ section to be used searches, filters, and orderings when using the [SearchItems](/rest/api/playfab/economy/catalog/search-items) API.

* Items can have Display properties with pre-configured field types
  * Use Display properties for metadata that varies between items, such as lore text
  * Display properties are queryable (indexed, fast query) or searchable (slower text query)
  * You can configure up to five of each type of field to be indexed

When you add a field to `DisplayProperties`, it will create a new index for you in the database. Only documents added or updated after index creation will be included. If the Display Property should apply to all items, you'll need to republish the entire catalog.

`DateTime`, `Double`, and `Queryable String` display properties are **queryable**, these properties can be used in Filter and OrderBy statements.

`Searchable String` display properties are **searchable**, these properties will be queried with fuzzy search against the `Search` field. Searchable properties can't be used in Filter and OrderBy statements

Titles are limited to five display properties of each type. For more information, see [Limits](limits.md).

> [!WARNING]
> Display property mappings are stored as an indexed list of key-value pairs. Deleting existing display property mappings can shift indexes and break the behavior of all remaining properties. It's suggested to add an additional property rather than deleting or editing an existing one and you should avoid deleting property mappings unless absolutely necessary
