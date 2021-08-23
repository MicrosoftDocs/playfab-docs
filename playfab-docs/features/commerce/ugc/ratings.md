---
title: Adding ratings to your user generated content
author: wesjong
description: Guide to managing ratings and reviews for your game's content.
ms.author: wesjong
ms.date: 08/09/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc, ratings, reviews
ROBOTS: NOINDEX, NOFOLLOW
ms.localizationpriority: medium
---

# Adding ratings to your user generated content

> [!IMPORTANT]
> This feature is currently in **Public Preview**. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.

This guide will go through the API calls that can be used to add a ratings and review system to your game.

## Review an item

A rating or review can be attached to an item by calling the `ReviewItem` API from a client. In order for an item to be reviewed it must be visible in the public catalog for all players. Ratings and reviews are attached to the player calling the API and only a single review per player can be associated with an item. The creator of an item cannot submit a review for their own item. The review is updated every time `ReviewItem` is called. The following data is **required** for the call:

- `Id`: The unique ID of item that is wished to be reviewed.
- `Rating`: A numeric rating the form of a `1` to `5` scale.

In addition, a number of **optional** parameters can be added also be added:

- `Title`: The title for the review.
- `ReviewText`: A free text field for reviews.
- `IsInstalled`: A flag to indicate if the reviewer has the item.
- `ItemVersion`: The version number for the item being reviewed.

As a service call, that looks something like this:

```csharp

{
  "Review": {
    "ItemVersion": "2.4.1",
    "Rating": 5,
    "Title": "Best Game Ever",
    "ReviewText": "I play this game every day. It's my favorite game yet.",
    "IsInstalled": true
  },
  "Id": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9"
}
```

A `Submitted` timestamp is automatically populated and updated when a review is submitted.

## Get a player's review for an item

You can get a player's review for an item by calling the `GetEntityItemReview` API from a client. An item `Id` or `AlernateId` must be provided. A specific `ReviewId` associated with review will be returned.

```csharp
{
    "code": 200,
    "status": "OK",
    "data": {
        "Review": {
            "ReviewId": "730de69c-d6af-f313-4653-09fb14bedeef",
            "ItemId": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9",
            "ReviewerId": "title_player_account!218870DE55036998",
            "ItemVersion": "2.4.1",
            "Title": "Best Game Ever",
            "ReviewText": "I play this game every day. It's my favorite game yet.",
            "Rating": 5,
            "IsInstalled": true,
            "Locale": "NEUTRAL",
            "HelpfulnessVotes": 0,
            "HelpfulPositive": 0,
            "HelpfulNegative": 0,
            "Submitted": "2021-08-09T06:44:22.569Z"
        }
    }
}
```

Calling `GetEntityItemReview` from a player who hasn't made a review returns a Review object with zeroed values:

```csharp
{
    "code": 200,
    "status": "OK",
    "data": {
        "Review": {
            "ReviewId": "00000000-0000-0000-0000-000000000000",
            "Rating": 0,
            "IsInstalled": false,
            "HelpfulnessVotes": 0,
            "HelpfulPositive": 0,
            "HelpfulNegative": 0,
            "Submitted": "0001-01-01T00:00:00Z"
        }
    }
}
```

## Get reviews for an item

You can access all the reviews for an item by calling the `GetItemReviews` API. An item `Id` or `AlernateId` must be provided. Additional **optional** parameters can be added:

- `ContinuationToken`: An opaque token used to retrieve the next page of items, if any are available.
- `Count`: Number of items to retrieve. Maximum page size is 200\. If not specified, defaults to 10.
- `CustomTags`: The optional custom tags associated with the request (e.g. build number, external trace identifiers, etc.).
- `OrderBy`: An OData orderBy used to order the results of the query. Possible values are `Helpfulness`, `Rating`, and `Submitted`.
- `SourceEntity`: The title or namespace the item is in. If null, then calling entity will be used.

```csharp
{
  "Count": 2,
  "Id": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9",
  "OrderBy": "Submitted desc"
}
```

## Submit a helpfulness votes for a review

> [!IMPORTANT]
> This API currently has a bug and a fix is currently in progress

Players can submit a helpfulness vote for a review by calling the `SubmitItemReviewVote` API. Submitting a new helpfulness vote will increment the `HelpfulnessVotes` counter on the review and also increment `HelpfulPositive` or `HelpfulNegative` depending on the boolean value for the `IsHelpful` parameter.

```csharp
{
  "ReviewId": "730de69c-d6af-f313-4653-09fb14bedeef",
  "IsHelpful": true
}
```

## Report a review

Players can report a review by calling the `ReportItemReview` API from a client. A `ReviewId` must be provided. An additional **optional** `ConcernCategory` parameter can be added.

```csharp
{
  "ReviewId": "730de69c-d6af-f313-4653-09fb14bedeef",
  "ConcernCategory": "OffensiveContent"
}
```

If not specified, `ConcernCategory` will default to `None`. The valid `ConcernCategory` values are as follows:

- `None`
- `OffensiveContent`
- `ChildExploitation`
- `MalwareOrVirus`
- `PrivacyConcerns`
- `MisleadingApp`
- `PoorPerformance`
- `ReviewResponse`
- `SpamAdvertising`
- `Profanity`

Calling the `ReportItemReview` will **only** fire a PlayStream event under the Event Name, `item_reported`. This can be queried using the Data Explorer in the Game Manager. Example Kusto queries can be seen below:

The following query returns **The total number of reports by ConcernCategory per ItemId in the last 3 days**

```kusto
['events.all']
| where Timestamp > ago (3d)
| where FullName_Name == "review_reported"
| project ReviewId = tostring(EventData.Payload.ReviewId), ConcernCategory = tostring(EventData.Payload.ConcernCategory)
| summarize TotalReportCount = count() by ReviewId, ConcernCategory
| sort by TotalReportCount desc
| render columnchart kind=stacked
```

## Takedown a review

> [!IMPORTANT]
> This API currently has a bug and a fix is currently in progress

You can submit a request to takedown one or more reviews using the `TakedownItemReviews` API. This API can only be called by the **title entity**. The call takes in a set of reviews that is to be taken down.

```csharp
{
  "Reviews": [
    {
      "ItemId": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9",
      "ReviewId": "730de69c-d6af-f313-4653-09fb14bedeef"
    }
  ]
}
```

> Note: There can be a delay of up to [UNKNOWN TIME] until a review is taken down due to the request processing
