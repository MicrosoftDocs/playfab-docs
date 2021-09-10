---
title: SearchItems
author: tcrawf23
description: Tutorial outlining using the Search API to query published content
ms.author: thomg
ms.date: 06/13/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# SearchItems

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  

The `SearchItems` API executes a search against the public Catalog using the provided search parameters and returns a paged list of items.

At its most basic, the `Search` parameter is a plain-text fuzzy search against the **Title**, **Description**, **Keywords**, and **Searchable String Display Properties** fields. However `Filter`, `OrderBy`, and `Select` are OData Query additions that can be used to alter the search parameters. Search results can be filtered and ordered by any field in the search document (barring Title and Description).

More information on the OData Query Syntax can be found [here](https://www.odata.org/getting-started/basic-tutorial/#queryData )

An example `SearchItems` request:
```csharp
{
  "Search": "Pirates",
  "Filter": "tags/any(t:t eq 'desert') and contentType eq 'map'",
  "OrderBy": "lastModifiedDate asc",
  "ContinuationToken": "abc=",
  "Count": 2,
  "ConfigurationName": "SearchConfigurationA",
  "ExpandReferencedItems": false
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
        "ConfigurationName": "DEFAULT",
        "PartialExpandedResults": false,
        "TotalCount": 10,
        "ContinuationToken": "MTA="
    }
}
```

## Display Properties

Searches, filters, and orderings can be also done on specific `DisplayProperties` fields that are configured for custom search.  Titles can configure their custom search and filter properties in the "Display properties mappings" section in Game Manager.

![Display Properties screenshot in Game Manager](media/displayproperties.png)

Once you add a field to `DisplayProperties`, you need to republish all of the public catalog items in order to add that field to the indexed values in each item document. Additionally, only the top-level Display Properties are indexed, so anything nested will **NOT** be indexed. Display Property names must be unique for all properties.

`DateTime`, `Double`, and `Queryable String` display properties are **queryable**, these properties can be used in Filter and OrderBy statements.

`Searchable String` display properties are **searchable**, these properties will be queried with fuzzy search against the `Search` field. Searchable properties cannot be used in Filter and OrderBy statements

## Filter

The Filter parameter allows you to filter the collection of items returned by the search request. The expression specified with filter is evaluated against each Catalog Item in the results, and only items where the expression evaluates to true are included.

Filter supports OData logical operators and precedence using parenthesis:

- Equal: ‘eq’
- Not Equal: ‘ne’
- Greater Than: ‘gt’
- Greater than or Equal: ‘ge’
- Less than: ‘lt’
- Less than or Equal: ‘le’
- Logical And: ‘and’
- Logical Or: ‘or’
- Logical Negation ‘not’

Filter does not support arithmetic operators or string functions.  

The following are a number of Filter examples:

#### Filtering by ContentType
```json
  "Filter": "ContentType eq 'Sword'"
```

#### Filtering with Conjunctions
```json
  "Filter": "rating/average gt 1 and rating/average lt 4"
```

#### Filtering with null values
OData supports a `null` type for filtering
```json
"Filter": "rating eq null"
```
The above request returns all items with no reviews

#### Filtering by Creator ID
To filter by a specific creator, you should use the syntax `title_player_account!<ID>`
```json
  "Filter": "creatorId eq 'title_player_account!C88F55C6A734B1DC'"
```

#### Filtering by Array fields
Filter also supports `any()` for filtering against arrays. For example: `alternateIds/any(a: a/value eq ‘StoreOfferId’)`
```json
  "Filter": "tags/any(t: t eq 'featured')"
```

#### Filtering by Display Properties
Filtering can only be done with **queryable** Display Properties
```json
  "Filter": "DisplayProperties/DifficultyRating ge 5"
```

## OrderBy

`OrderBy` is a comma-separated list used to sort search results.

```json
  "OrderBy": "rating/average asc"
```
When using order sorting you can pass a secondary property to break sorting ‘ties’

```json
  "OrderBy": "rating/average asc, rating/totalCount desc"
```

If you don’t pass in a secondary value, catalog items do have an internal ‘score’ attribute that used for breaking ties, however that scoring is arbitrary and inconsistent (it’s based on the storage order in the underlying database and is constantly changing as items are added and removed).  

`OrderBy` supports a handful of OData properties for ordering:
- top
- skip
- asc
- desc

If you don't specify a direction, the default is ascending. If there are null values in the field, null values appear first if the sort is `asc` and last if the sort is `desc`.

The following are a number of OrderBy examples:

#### Sorting by Title
Use the `title/<LANG>` parameter combined with `asc` or `desc` to indicate order preference.
```json
  "OrderBy": "title/en-GB asc"
```
Use `NEUTRAL` to order by the neutral strings
```json
  "OrderBy": "description/NEUTRAL desc"
```

#### Sorting by Display Properties
Sorting can only be done with **queryable** Display Properties
```json
  "OrderBy": "DisplayProperties/DifficultyRating desc"
```

## Select

By Default, Search returns a rich set of item metadata:

- `id`
- `type`
- `alternateIds`
- `title` **(NEUTRAL)**
- `description` **(NEUTRAL)**
- `keywords` **(NEUTRAL)**
- `contentType`
- `platforms`
- `tags`
- `creationDate`
- `lastModifiedDate`
- `boostFactor`
- `CreatorEntityKey` (`creatorId` in earlier API versions)
- `displayProperties`

Only the neutral strings used in title and description are returned by default.  

Note: If you are on Xbox Live, two additional metadata items are included by default: `creatorGamertag` and `sourceId`   

Using `Select `additional fields can optionally be returned within the paged search results, including content metadata (contents), images, StartDate, EndDate and the full set of localized strings in title and description. Note that if the select field is left empty, the search results will be a subset of the full document metadata, to facilitate faster load times.

This request would return the default item metadata **in addition** to the content and images:
```json
"Select": "contents,images"
```

Selecting `title`, `description`, and/or `keywords` will return the full set of localized string data:
```json
"Select": "title,description,keywords"
```
