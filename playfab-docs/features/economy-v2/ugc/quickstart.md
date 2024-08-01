---
title: User Generated Content (UGC) quickstart
author: joannaleecy
description: Quickstart to using User Generated Content in PlayFab.
ms.author: thomg
ms.date: 01/17/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# User-Generated Content (UGC) quickstart

The purpose of this guide is to explain how to quickly get started with UGC, using direct service-to-service calls. We will show you step by step how to connect to the draft UGC content items, publish those items, and then search and find them.

## Get an Entity Token

UGC is designed to work with PlayFab entities, so the first step is to get an entity token using `LoginWithCustomID`. As a service call, that looks something like this:

```json
{
  "CustomId": "exampleUser",
  "CreateAccount": true,
  "TitleId": "DC7B"
}
```

## Create a draft UGC item

You create "draft" UGC items by calling the `CreateDraftItem` API with the ``"Type":"ugc"`` parameter. Draft items are designed to be reviewed and accessed by their creators before being moved to a published state. To create a draft item you need:

- The `EntityToken` from the previous call in the X-EntityToken header.
- The `Entity.Id` from the previous call in the item's `CreatorEntityKey.Id`.
- The `TitleId` for the title in the item's sourceId.

This call looks something like the following.

```json
{
  "Item": {
   "Type": "ugc",
    "Title": {
      "NEUTRAL": "Neutral Title Test",
      "en-GB": "en-gb Title",
      "en-US": "en-us Title"
    },
    "Description": {
      "NEUTRAL": "Neutral Description Test",
      "en-GB": "en-gb Description",
      "en-US": "en-us Description"
    },
    "startDate": "2018-10-18T20:01:26.1520582Z"
  }
}
```

This will return the created Draft Item with an `Id`. We'll want to keep track of this `Id` for later.

```json
       "Item": {
            "SourceEntity": {
                "Id": "1184A",
                "Type": "title",
                "TypeString": "title"
            },
            "SourceEntityKey": {
                "Id": "1184A",
                "Type": "title",
                "TypeString": "title"
            },
            "Id": "44857e2b-c93b-4054-80be-7890028201ff",
            "Type": "ugc",
            "Title": {
              "NEUTRAL": "Neutral Title Test",
              "en-GB": "en-gb Title",
              "en-US": "en-us Title"
            },
          ...
        }
```

## Get draft item IDs for a player

To get draft item IDs for a particular player, the `GetEntityDraftItems` API can be used. Title entities can call this API with player ID in the `Entity` parameter, and the API will return a list of Draft Items for that particular player. Only Title Entities can pass in an `Entity` parameter. Player entities can call the API without an `Entity` parameter and the API will return a list of draft items created by the calling player.

```json
{
  "Count": 2,
  "Entity": {
    "Id": "C88F55C6A734B1DC",
    "Type": "title_player_account",
    "TypeString": "title_player_account"
  }
}
```


## Publish a UGC item

Once an item is in draft, you can then push it to a published state using `PublishDraftItem`. Once a UGC item is published, it's generally searchable and available publicly. You need to use the item `Id` returned from the `CreateDraftItem` response.

```json
{
"Id": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

## Get the published status of a UGC item

Using the item `Id`, you can get the status of a publish for an item in your UGC catalog using the `GetItemPublishStatus` API.

```json
{
"Id": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

The possible publish `Result` values are as follows:

- `Unknown`
- `Pending`
- `Succeeded`
- `Failed`
- `Canceled`

Republishing an item will update the Published Item to match the current Draft Item.

## Do a simple search

Once the publish call succeeds, the item can be accessed by all players via the Public Catalog. The  [`SearchItems` API](/gaming/playfab/features/economy/ugc/search) executes a search against published catalog (including UGC items) using the provided parameters and returns a set of paginated results. The `Filter`, `OrderBy`, and `Select` fields use OData as the query standard.

```json
{
  "Search": "Test",
  "Count": 2
}
```
