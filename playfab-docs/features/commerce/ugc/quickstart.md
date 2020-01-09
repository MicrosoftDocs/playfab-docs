---
title: User Generated Content (UGC) quickstart
author: thomasgu
description: Quickstart to using User Generated Content in PlayFab.
ms.author: thomg
ms.date: 01/17/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, monetization, ugc
ms.localizationpriority: medium
---

# User-Generated Content (UGC) quickstart

> [!IMPORTANT]
> This feature is currently in **Private Preview**. We will be making it broadly available to developers as soon as we can.
>
> It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  

The purpose of this guide is to explain how to quickly get started with UGC, using direct service-to-service calls. We will show you step-by-step how to connect to the draft UGC content items, publish those items, and then search and find them.

## Get an Entity Token

UGC is designed to work with PlayFab entities, so the first step is to get an entity token using `LoginWithCustomID`. As a service call, that looks something like this:

```csharp
POST https://YOURTITLEID.playfabapi.com/Client/LoginWithCustomID HTTP/1.1
Host: https://YOURTITLEID.playfabapi.com/
Content-Length: 129
Content-Type: application/json

{
  "CustomId": "exampleUser",
  "CreateAccount": true,
  "TitleId": "DC7B",
  "LoginTitlePlayerAccountEntity": true
}
```

## Create a draft UGC item

You create "draft" UGC items by calling the `CreateDraftUgcItem` API. Draft items are designed to be reviewed and accessed by their creators before being moved to a published state. To create a draft item you need:

- The `EntityToken` from the previous call in the X-EntityToken header.
- The `Entity.Id` from the previous call in the item’s `CreatorEntityKey.Id`.
- The `titleId` for the title in the item’s sourceId.

This call looks something like the following.

```csharp
POST https:// YOURTITLEID.playfabapi.com/UserGeneratedContent/CreateDraftUgcItem HTTP/1.1
Host: YOURTITLEID.playfabapi.com/
Content-Length: 642
Content-Type: application/json
X-EntityToken: eyJJc3N1ZWQiOiIyMDE4LTEyLTE0VDAxOjU1OjMwLjY4MTMwOTJaIiwiRXhwaXJlcyI6IjIwMTgtMTItMTVUMDE6NTU6MzAuNjgxMzA5MloiLCJIaW50IjoiNDVGNUFFQkQ4Njg2Rjg4MiIsIlNpZ25hdHVyZSI6InRWTm5STXN5VlBUR25HenJGSHJ1dHdyNU9QWGpUQ2ZWUlhySlZaYWJKV1U9IiwiRW50aXR5Q2hhaW4iOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCE1NDk1NDhGQkQzNTZEOUUvRDJBQy9BRjdENEJBNENBREZFRjI1LzVDMjAwM0MwOTc5MkFEREUvIiwiRW50aXR5SWQiOiI1QzIwMDNDMDk3OTJBRERFIiwiRW50aXR5VHlwZSI6InRpdGxlX3BsYXllcl9hY2NvdW50In0=

{
"item": {
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
     "id": "5C2003C09792ADDE",
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
  "startDate": "2018-10-18T20:01:26.1520582Z",
  "isTest": true
}
}
```

## Publish a UGC item

Once an item is in draft, you can then push it to a published state using `PublishUgcItem`. Once a UGC item is published, its generally searchable and available publicly. You need to use the `itemId` returned from the `CreateDraftUgcItem` response.

```csharp
POST  https://YOURTITLEID.playfabapi.com/UserGeneratedContent/PublishUgcItem HTTP/1.1
Host: YOURTITLEID.playfabapi.com/
Content-Length: 54
Content-Type: application/json
X-EntityToken: eyJJc3N1ZWQiOiIyMDE4LTEyLTE0VDAxOjU1OjMwLjY4MTMwOTJaIiwiRXhwaXJlcyI6IjIwMTgtMTItMTVUMDE6NTU6MzAuNjgxMzA5MloiLCJIaW50IjoiNDVGNUFFQkQ4Njg2Rjg4MiIsIlNpZ25hdHVyZSI6InRWTm5STXN5VlBUR25HenJGSHJ1dHdyNU9QWGpUQ2ZWUlhySlZaYWJKV1U9IiwiRW50aXR5Q2hhaW4iOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCE1NDk1NDhGQkQzNTZEOUUvRDJBQy9BRjdENEJBNENBREZFRjI1LzVDMjAwM0MwOTc5MkFEREUvIiwiRW50aXR5SWQiOiI1QzIwMDNDMDk3OTJBRERFIiwiRW50aXR5VHlwZSI6InRpdGxlX3BsYXllcl9hY2NvdW50In0=

{
"itemId": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

## Get the published status of a UGC item

Using the `itemId`, you can always get the state of an item in your UGC catalog.

```csharp
POST  https://YOURTITLEID.playfabapi.com/UserGeneratedContent/GetUgcPublishStatus HTTP/1.1
Host: YOURTITLEID.playfabapi.com/
Content-Length: 54
Content-Type: application/json
X-EntityToken: eyJJc3N1ZWQiOiIyMDE4LTEyLTE0VDAxOjU1OjMwLjY4MTMwOTJaIiwiRXhwaXJlcyI6IjIwMTgtMTItMTVUMDE6NTU6MzAuNjgxMzA5MloiLCJIaW50IjoiNDVGNUFFQkQ4Njg2Rjg4MiIsIlNpZ25hdHVyZSI6InRWTm5STXN5VlBUR25HenJGSHJ1dHdyNU9QWGpUQ2ZWUlhySlZaYWJKV1U9IiwiRW50aXR5Q2hhaW4iOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCE1NDk1NDhGQkQzNTZEOUUvRDJBQy9BRjdENEJBNENBREZFRjI1LzVDMjAwM0MwOTc5MkFEREUvIiwiRW50aXR5SWQiOiI1QzIwMDNDMDk3OTJBRERFIiwiRW50aXR5VHlwZSI6InRpdGxlX3BsYXllcl9hY2NvdW50In0=

{
"itemId": "44857e2b-c93b-4054-80be-7890028201ff"
}
```

## Do a simple search

Once the publish call succeeds, it can be searched for using the previously published itemId. The Catalog/Search API executes a search against published catalog (including UGC items) using the provided parameters and returns a set of paginated results. Note that the filter, orderBy and select fields use OData as the query standard.

```csharp
POST  https://YOURTITLEID.playfabapi.com/Catalog/Search HTTP/1.1
Host: YOURTITLEID.playfabapi.com/
Content-Length: 66
Content-Type: application/json
X-EntityToken: eyJJc3N1ZWQiOiIyMDE4LTEyLTE0VDAxOjU1OjMwLjY4MTMwOTJaIiwiRXhwaXJlcyI6IjIwMTgtMTItMTVUMDE6NTU6MzAuNjgxMzA5MloiLCJIaW50IjoiNDVGNUFFQkQ4Njg2Rjg4MiIsIlNpZ25hdHVyZSI6InRWTm5STXN5VlBUR25HenJGSHJ1dHdyNU9QWGpUQ2ZWUlhySlZaYWJKV1U9IiwiRW50aXR5Q2hhaW4iOiJ0aXRsZV9wbGF5ZXJfYWNjb3VudCE1NDk1NDhGQkQzNTZEOUUvRDJBQy9BRjdENEJBNENBREZFRjI1LzVDMjAwM0MwOTc5MkFEREUvIiwiRW50aXR5SWQiOiI1QzIwMDNDMDk3OTJBRERFIiwiRW50aXR5VHlwZSI6InRpdGxlX3BsYXllcl9hY2NvdW50In0=

{"search":"title","filter":"","orderBy":null,"select":"","top": 5}
```
