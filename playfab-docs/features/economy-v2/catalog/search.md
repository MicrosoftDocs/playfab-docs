---
title: Search
author: fprotti96
description: Tutorial outlining using the Search API to query published content.
ms.author: fprotti
ms.date: 11/21/2023
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# SearchItems

[!INCLUDE [notice](../../../includes/_economy-release.md)]

The `SearchItems` API executes a search against the public Catalog using the provided search parameters and returns a paged list of items.

At its most basic, the `Search` parameter is a plain-text fuzzy search against the **Title**, **Description**, **Keywords**, and **Searchable String Display Properties** fields. However `Filter`, `OrderBy`, and `Select` are OData Query additions that can be used to alter the search parameters. Search results can be filtered and ordered by any field in the search document (barring Title and Description).

More information on the OData Query Syntax can be found [here](https://www.odata.org/getting-started/basic-tutorial/#queryData )

An example `SearchItems` request:

```csharp
{
  "Search": "Pirates",
  "Filter": "Tags/any(t:t eq 'desert') and ContentType eq 'map'",
  "OrderBy": "lastModifiedDate asc",
  "ContinuationToken": "abc=",
  "Count": 2,
  "Language": "en-GB"
}
```

A sample response:

```csharp
{
    "code": 200,
    "status": "OK",
    "data": {
        "Items": [
            {
               <item metadata> 
            }
        ],
      "ContinuationToken": "MTA="
    }
}
```

## Continuation Tokens

The `ContinuationToken` field that is returned from a search response can be passed into a search request to paginate through multiple counts of results.

## Display Properties

Searches, filters, and orderings can be also done on specific `DisplayProperties` fields that are configured for custom search.  Titles can configure their custom search and filter properties in the [Display Properties Mappings setting](/gaming/playfab/features/economy-v2/settings#display-properties) in Game Manager.

![Display Properties screenshot in Game Manager](../media/displayproperties.png)

When you add a field to `DisplayProperties`, it creates a new index for you in the database. Only documents added or updated after index creation will be included. If you need the Display Property to apply to all items, you need to republish the entire catalog.

`DateTime`, `Double`, and `Queryable String` display properties are **queryable**, these properties can be used in Filter and OrderBy statements.

`Searchable String` display properties are **searchable**, these properties are queried with fuzzy search against the `Search` field. Searchable properties can't be used in _Filter_ and _OrderBy_ statements.

Titles are limited to five display properties of each type.

> [!WARNING]
> Display property mappings are stored as an indexed list of key-value pairs. Deleting existing display property mappings can shift indexes and break the behavior of all remaining properties. It is suggested to add an additional property rather than deleting or editing an existing one and you should avoid deleting property mappings unless absolutely necessary

## Filter

The Filter parameter allows you to filter the collection of items returned by the search request. The expression specified with filter is evaluated against each Catalog Item in the results, and only items where the expression evaluates to "true" are included.

Filter supports OData logical operators and precedence using parenthesis:

* Equal: ‘eq’
* Not Equal: ‘ne’
* Greater Than: ‘gt’
* Greater than or Equal: ‘ge’
* Less than: ‘lt’
* Less than or Equal: ‘le’
* Logical And: ‘and’
* Logical Or: ‘or’
* Logical Negation ‘not’

Filter doesn't support arithmetic operators or string functions.  

The following are Filter examples:

### Filtering by ContentType

```json
  "Filter": "ContentType eq 'Sword'"
```

### Filtering with Conjunctions

```json
  "Filter": "rating/average gt 1 and rating/average lt 4"
```

### Filtering with null values

OData supports a `null` type for filtering

```json
"Filter": "rating eq null"
```

The above request returns all items with no reviews

### Filtering by Creator ID

To filter by a specific creator, you should use the syntax `title_player_account!<ID>`

```json
  "Filter": "creatorId eq 'title_player_account!C88F55C6A734B1DC'"
```

### Filtering by Array fields

Filter also supports `any()` for filtering against arrays. For example: `alternateIds/any(a: a/value eq ‘StoreOfferId’)`

```json
  "Filter": "tags/any(t: t eq 'featured')"
```

### Filtering with Arrays and null checks

The filter below will check for any items that have a contents field with non-null values

```json
  "Filter": "contents/any(content: content ne null)"
```

> [!NOTE]
> By default, Search will **NOT** return contents for items unless specified with a [Select](/gaming/playfab/features/economy-v2/catalog/search#select) statement. If the above query is run without a `"Select": "contents"`` statement, it will correctly apply the filter but all returned Search results will have empty content fields

### Filtering by Display Properties

Filtering can only be done with **queryable** Display Properties

```json
  "Filter": "DisplayProperties/DifficultyRating ge 5"
```

## OrderBy

`OrderBy` is a comma-separated list used to sort search results.

```json
  "OrderBy": "rating/average asc"
```

You can pass a secondary property to break sorting ‘ties’:

```json
  "OrderBy": "rating/average asc, rating/totalCount desc"
```

Catalog items without a secondary value have an internal ‘score’ attribute that used for breaking ties. That scoring is based on the storage order in the underlying database and is constantly changing as items are added and removed.

`OrderBy` supports a handful of OData properties for ordering:

* `asc`
* `desc`

If you don't specify a direction, the default is ascending. If there are null values in the field, they appear first for `asc` and last for `desc`. If no `OrderBy` value is passed, a default `id asc` value is used.

The following are OrderBy examples:

### Sorting by Title

Use the `title/<LANG>` parameter combined with `asc` or `desc` to indicate order preference.

```json
  "OrderBy": "title/en-GB asc"
```

Use `NEUTRAL` to order by the neutral strings

```json
  "OrderBy": "description/NEUTRAL desc"
```

### Sorting by Display Properties

Sorting can only be done with **queryable** Display Properties

```json
  "OrderBy": "DisplayProperties/DifficultyRating desc"
```

## Select

By Default, Search returns a rich set of item metadata:

* `Id`
* `Type`
* `AlternateIds`
* `Title` **(NEUTRAL or `Language` locale)**
* `Description` **(NEUTRAL or `Language` locale)**
* `Keywords` **(NEUTRAL or `Language` locale)**
* `ContentType`
* `Images` **(Thumbnail only)**
* `Tags`
* `CreationDate`
* `LastModifiedDate`
* `CreatorEntityKey` (`CreatorId` in earlier API versions)
* `DisplayProperties`
* `ItemReferences`

Only the neutral strings used in title and description are returned by default. If a Thumbnail image exists, it's returned by default. Each item is limited to only one image of a "Thumbnail" type.

With `Select` more fields can optionally be returned within the paged search results, including content metadata (contents), images, StartDate, EndDate and the full set of localized strings in title and description. If the select field is left empty, the search results are a subset of the full document metadata, to facilitate faster load times.

This request would return the default item metadata **in addition** to the content and images:

```json
"Select": "contents,images"
```

Selecting `title`, `description`, and/or `keywords` will return the full set of localized string data:

```json
"Select": "title,description,keywords"
```

## Localization

A locale can be passed into the `Language` parameter. Passing a locale causes all `Title`, `Description`, `Keywords` fields to return the locale by default or NEUTRAL if the item doesn't have that localization.

An example `SearchItems` request with a `Language` parameter can be found at the [top of this page](#searchitems).

For more information about localization, see [Localization](../catalog/localization.md).

## Limits

The complexity of search filter queries is limited per request. Expensive queries can be rejected and titles should ensure that they aren't attempting overly complicated queries. The following are examples of queries close to maximum complexity:

```json
contentType eq 'testType' and tags/any(t: t eq 'blue' or t eq 'green' or t eq 'violet') and platforms/any(p: p eq 'square' or p eq 'circle' or p eq 'triangle') and displayProperties/isFavorite eq true
```

```json
contents/any(c: c/minClientVersion gt '1.2.3' and c/maxClientVersion lt '4.5.6' and c/tags/any(t: t eq 'map')) and rating/totalRatingsCount ge 20 and rating/averageRating ge 4.0
```

High complexity filter queries throw a 400 error with a message: `"The filter provided in the request does not meet the complexity requirements for source"`.

## Searching a Store

One of the properties you can pass in is the `Store` parameter. This allows you to search within the context of a store. In addition to being able to check if an item exists in a particular store, it also can be used to display the overridden prices of the store's items/contents. You can also use the `AlternateId` of the store to search for it. Learn more about using stores [here](../stores.md)

```json
{
  "Search": "",
  "Filter": "ContentType eq 'weapons'",
  "Store": {
    "Id": "{{StoreID}}"
  },
}
```
