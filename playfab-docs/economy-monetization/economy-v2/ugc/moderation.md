---
title: Moderating your user generated content
author: wesjong
description: Guide to moderating content in your game.
ms.author: wesjong
ms.date: 08/09/2021
ms.topic: article
ms.service: azure-playfab
keywords: playfab, commerce, economy, monetization, ugc, moderation
ms.localizationpriority: medium
---

# Moderating your user generated content

This guide will go through the API calls that can be used to create moderation flows for the content in your game.

## Report an item

Players can report an item by calling the `ReportItem` API from a client. An item `Id` or `AlernateId` must be provided. Additional **optional** parameters can be added. These include:

- `ConcernCategory`: A category of concern for the report
- `Reason`: A free text input for the report

Here is a sample request body:

```json
{
  "Id": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9"
  "ConcernCategory": "Profanity",
  "Reason": "There was swearing in the description."
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

Calling the `ReportItem` API will **only** fire a PlayStream event under the Event Name, `item_reported`. This can be queried using the [Data Explorer](/gaming/playfab/features/insights/data-explorer/) in the Game Manager. Example queries can be seen below:

The following query returns **The total number of reports by ConcernCategory per ItemId in the last 3 days**

```kusto
['events.all']
| where Timestamp > ago (3d)
| where FullName_Name == "item_reported"
| project ItemId = tostring(EventData.Payload.ItemId), ConcernCategory = tostring(EventData.Payload.ConcernCategory)
| summarize TotalReportCount = count() by ItemId, ConcernCategory
| sort by TotalReportCount desc
| render columnchart kind=stacked
```

The following query returns **All submitted reports against a specific ItemId in the last 3 days**

```kusto
['events.all']
| where Timestamp > ago (3d)
| where FullName_Name == "item_reported"
| where EventData.Payload.ItemId == "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9"
| project Timestamp, ItemId = tostring(EventData.Payload.ItemId), ConcernCategory = tostring(EventData.Payload.ConcernCategory), Reason = tostring(EventData.Payload.Reason), ReportingPlayer = Entity_Id
| sort by Timestamp
```

## Change the moderation status of an item

You can change the moderation status of a **published** item using the `SetItemModerationState` API. An item that is any state other than `Approved` will not be accessible on the public catalog for all players. The item creator can still access the item using the `GetItem` and `GetDraftItems` API. **Title entities** and **Admins** will be able to see Non-Approved items through `SearchItems`, `GetDraftItems`, and `GetItem`.

 This API can only be called by the **title entity**. An item `Id` or `AlernateId` and a `Status` must be provided. An **optional** `Reason` free text parameter can also be added. As a service call, that looks something like this:

```json
{
  "Status": "AwaitingModeration",
  "Reason": "User reports over threshold",
  "Id": "3f5dd8d4-4ee1-4748-8855-56a8a0277bf9"
}
```

By default, a published item will not have a moderation status. Republishing the draft item will **not** change the moderation status. The valid `Status` values are as follows:

- `AwaitingModeration`
- `Approved`
- `Rejected`

The following query returns **All items currently in the `AwaitingModeration` status in the last 3 days**

```kusto
let TimeRange = ago(3d);
['events.all']
| where Timestamp > TimeRange
| where FullName_Name == "item_moderation_state_changed"
| project Timestamp, ItemId = tostring(EventData.Payload.ItemId)
| summarize MaxTimestamp = max(Timestamp) by ItemId
| extend TimeAndId = strcat(MaxTimestamp, "|", ItemId)
| join kind = leftouter (
    ['events.all']
    | where Timestamp > TimeRange
    | where FullName_Name == "item_moderation_state_changed"
    | project Timestamp, ItemId = tostring(EventData.Payload.ItemId), TargetStatus = tostring(EventData.Payload.TargetStatus), Reason = tostring(EventData.Payload.Reason)
    | extend TimeAndId = strcat(Timestamp, "|", ItemId)) on TimeAndId
| project Timestamp, ItemId, TargetStatus, Reason
| where TargetStatus == "AwaitingModeration"
```

## Delete an item

An item can be deleted by calling the `DeleteItem` API. This call will remove an item from the draft catalog and corresponding item from the public catalog (if it has been published). An item `Id` or `AlernateId` must be provided.

```json
{
  "Id": "852a2d2b-7754-427e-9ad4-fce2b24a4cef"
}
```
