---
title: User Generated Content (UGC) quickstart
author: joannaleecy
description: Quickstart to using User Generated Content in PlayFab.
ms.author: thomg
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# User-Generated Content (UGC) quickstart

> [!IMPORTANT]
> This feature is currently in **Public Preview**. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.

The purpose of this guide is to explain how to quickly get started with UGC, using direct service-to-service calls. We will show you step-by-step how to connect to the draft UGC content items, publish those items, and then search and find them.

## Get an Entity Token

UGC is designed to work with PlayFab entities, so the first step is to get an entity token using `LoginWithCustomID`. As a service call, that looks something like this:

```csharp
{
  "CustomId": "exampleUser",
  "CreateAccount": true,
  "TitleId": "DC7B"
}
```

## Create a draft UGC item

You create "draft" UGC items by calling the `CreateDraftItem` API with the ``"type":"ugc"`` parameter. Draft items are designed to be reviewed and accessed by their creators before being moved to a published state. To create a draft item you need:

- The `EntityToken` from the previous call in the X-EntityToken header.
- The `Entity.Id` from the previous call in the item's `CreatorEntityKey.Id`.
- The `TitleId` for the title in the item's sourceId.

This call looks something like the following.

```csharp
{
  "item": {
   "type": "ugc",
    "title": {
      "Neutral": "Neutral Title Test",
      "en-gb": "en-gb Title",
      "en-us": "en-us Title"
    },
    "description": {
      "Neutral": "Neutral Description Test",
      "en-gb": "en-gb Description",
      "en-us": "en-us Description"
    },
    "creatorEntityKey": {
       "id": "C88F55C6A734B1DC",
       "type": "title_player_account"
    },
    "contentType": "pack",
    "sourceId": " YOURTITLEID ",
    "sourceType": "pf",
    "platforms": [
      "android",
      "appletv",
      "oculus"
    ],
    "tags": [
      "featured",
      "GeneratedContent"
    ],
    "startDate": "2018-10-18T20:01:26.1520582Z"
  }
}
```

## Publish a UGC item

Once an item is in draft, you can then push it to a published state using `PublishDraftItem`. Once a UGC item is published, its generally searchable and available publicly. You need to use the item `Id` returned from the `CreateDraftItem` response.

```csharp
{
"Id": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

## Get the published status of a UGC item

Using the item `Id`, you can get the status of a publish for an item in your UGC catalog using the `GetItemPublishStatus` API.

```csharp
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


## Do a simple search

Once the publish call succeeds, it can be searched for using the previously published item `Id`. The `SearchItems` API executes a search against published catalog (including UGC items) using the provided parameters and returns a set of paginated results. Note that the `Filter`, `OrderBy` and `Select` fields use OData as the query standard.

```csharp
{
  "Search": "",
  "Filter": "",
  "OrderBy": "",
  "Count": 2
}
```
