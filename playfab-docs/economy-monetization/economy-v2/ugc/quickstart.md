---
title: User Generated Content (UGC) quickstart
author: fprotti96
description: Quickstart to using User Generated Content in PlayFab.
ms.author: thomg
ms.date: 02/20/2025
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# User-Generated Content (UGC) quickstart

The purpose of this guide is to explain how to quickly get started with UGC, using direct service-to-service calls. We show you step by step how to connect to the draft UGC content items, publish those items, and then search and find them.

## Get an Entity Token

UGC is designed to work with PlayFab entities, so the first step is to get an entity token using [LoginWithCustomID](/rest/api/playfab/client/authentication/login-with-custom-id). This example shows a service call.

```json
{
  "CustomId": "exampleUser",
  "CreateAccount": true,
  "TitleId": "DC7B"
}
```

## Create Blob URLs

The UGC system uses [Azure Blob Storage](/azure/storage/blobs/storage-blobs-introduction) to store all content (files and images) associated with your title's UGC. To upload the content, we first need to call the [CreateUploadUrls](/rest/api/playfab/economy/catalog/create-upload-urls) API, passing in the file names and sizes (in bytes) to create the new blobs. For example, if you wanted to upload a text file and PNG image, you would pass in the following to the request body:

```json
{
  "Files": [
    {
      "FileName": "HelloWorld.txt",
      "FileSize": 12
    },
    {
      "FileName": "PlayFabLogo.png",
      "FileSize": 20725
    }
  ]
}
```

The response includes an `Id` and `Url` for each piece of content:

```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "UploadUrls": [
            {
                "Id": "[Content ID]",
                "Url": "[Content Url + '?' + Token]",
                "FileName": "HelloWorld.txt"
            },
            {
                "Id": "[Image ID]",
                "Url": "[Image Url + '?' + Token]",
                "FileName": "PlayFabLogo.png"
            }
        ]
    }
}
```

## Create a draft UGC item

You create "draft" UGC items by calling the [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item) API with the ``"Type":"ugc"`` parameter. Creators can review and access draft items before publishing them. To create a draft item, you need:

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

This returns the created Draft Item with an `Id`. Save the `Id` so you can use it later.

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

To get draft item IDs for a particular player, the [GetEntityDraftItems](/rest/api/playfab/economy/catalog/get-entity-draft-items) API can be used. Title entities can call this API with player ID in the `Entity` parameter, and the API returns a list of Draft Items for that particular player. Only Title Entities can pass in an `Entity` parameter. Player entities can call the API without an `Entity` parameter and the API returns a list of draft items created by the calling player.

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

Once an item is in draft, you can then push it to a published state using [PublishDraftItem](/rest/api/playfab/economy/catalog/publish-draft-item). Once a UGC item is published, it's searchable and available publicly. You need to use the item `Id` returned from the `CreateDraftItem` response.

```json
{
"Id": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

## Get the published status of a UGC item

Using the item `Id`, you can get the status of a publish for an item in your UGC catalog using the [GetItemPublishStatus](/rest/api/playfab/economy/catalog/get-item-publish-status) API.

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

Republishing an item updates the Published Item to match the current Draft Item.

## Do a search

After the publish call succeeds, all players can access the item in the Public Catalog. The  [`SearchItems` API](/rest/api/playfab/economy/catalog/search-items) executes a search against published catalog (including UGC items) using the provided parameters and returns a set of paginated results. The `Filter`, `OrderBy`, and `Select` fields use OData as the query standard.

```json
{
  "Search": "Test",
  "Count": 2
}
```
## See also

[Publish your first user generated content](/gaming/playfab/economy-monetization/economy-v2/tutorials/publish-ugc)