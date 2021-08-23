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

At its most basic, the `Search` parameter is a plain-text fuzzy search against the Title and Description fields. However `Filter`, `OrderBy`, and `Select` are OData Query additions that can be used to alter the search parameters. Search results can be filtered and ordered by any field in the search document (barring Title and Description).

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

Searches, filters and orderings can be also done on specific `DisplayProperties` fields that are configured for custom search.  Titles can configure their custom search and filter properties in the Display Properties Mapping section in Game Manager.

![Display Properties screenshot in Game Manager](media/displayproperties.png)

Once you add a field to `DisplayProperties`, you need to republish all of the public catalog items in order to add that field to the indexed values in each item document. Additionally, only the top-level properties in DisplayProperties are indexed, so anything nested will **NOT** be indexed.

## Filter

The Filter options allows you to filter the collection of items returned by the search request. The  expression specified with filter is evaluated against each Catalog Item in the results, and only items where the expression evaluates to true are included.

"Filter":" ContentType eq 'Sword'",

Filter supports OData logical operators and precedence using parenthesis:

- Equal : ‘eq’
- Not Equal: ‘ne’
- Greater Than: ‘gt’
- Greater than or Equal: ‘ge’
- Less than: ‘lt’
- Less than or Equal: ‘le’
- Logical And: ‘and’
- Logical Or: ‘or’
- Logical Negation ‘not’

Filter also supports `any()` for filtering against arrays. For example: `alternateIds/any(a: a/value eq ‘StoreOfferId’)`

Filter does not support arithmetic operators or string functions.  

## OrderBy

`OrderBy` is a comma separated list. When using order sorting you can pass a secondary property to break sorting ‘ties’

`"OrderBy”: “rating/averageRating desc, rating/totalRatingsCount desc”`

If you don’t pass in a secondary value, catalog items do have an internal ‘score’ attribute that used for breaking ties, however that scoring is arbitrary and inconsistent (it’s based on the storage order in the underlying database and is constantly changing as items are added and removed).  

`OrderBy` supports a handful of Odata properties for ordering:
- top
- skip
- asc
- desc

## Select

By Default, Search returns a rich set of item metadata:

- id
- type
- alternateIds
- title - neutral
- description - neutral
- keywords - neutral
- contentType
- platforms
- tags
- creationDate
- lastModifiedDate
- boostFactor
- CreatorEntityKey (creatorId in earlier APIversions)
- displayProperties

Only the neutral strings used in title and description are returned by default.  

Note: If you are on XboxLive two additional metadata items are included by default: creatorGamertag and sourceId   

Using `Select `additional fields can optionally be returned within the paged search results, including content metadata (contents), images, StartDate, EndDate and the full set of localized strings in title and description. Note that if the select field is left empty, the search results will be a subset of the full document metadata, to facilitate faster load times.

`Select = "contents,images"`
