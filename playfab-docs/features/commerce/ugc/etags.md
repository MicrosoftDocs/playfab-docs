---
title: UGC ETags
author: wesjong
description: Tutorial outlining using the ETags to manage content updates
ms.author: wesjong
ms.date: 03/17/2021
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy, monetization, ugc
ms.localizationpriority: medium
---

# ETags

> [!IMPORTANT]
> This feature is currently in public preview. It is provided to give you an early look at an upcoming feature, and to allow you to provide feedback while it is still in development.  

This guide will go through using ETags to manage item updates.

## What are ETags?
ETags are a concurrency management option for managing items and their updates.

When creating or updating a Draft item, an `ETag` will be returned with the success response.

#### `UpdateDraftItem` Request
```json
{
  "Item": {
    "Id": "e08acd29-f28a-4cbb-b8d6-7df74c7f0e4a",
    "Type": "ugc",
    "AlternateIds": [],
    "Title": {
        "NEUTRAL": "ETag Test"
    }
  }
}
```

#### `UpdateDraftItem` Response
```json
{
    "code": 200,
    "status": "OK",
    "data": {
        "Item": {
            "Id": "e08acd29-f28a-4cbb-b8d6-7df74c7f0e4a",
            "Type": "ugc",
            "Title": {
                "NEUTRAL": "ETag Test"
            },
            ...
            "ETag": "\"7800e585-0000-0300-0000-623364bf0000\""
        }
    }
}
```

This `ETag` will be returned from any of the APIs that return the **draft item** (such as `GetDraftItem`, `GetEntityDraftItems`, and `GetDraftItems`). This `ETag` will also be updated every time an update is made with `UpdateDraftItem`

## Using ETags
ETags can be passed in as an **optional** parameter to `UpdateDraftItem` and `PublishDraftItem` calls. If passed in, a check will be done between the draft item's `ETag` and the passed in parameter. If the two ETags don't match, the request will be rejected.

#### `Publish Item` Request
```json
{
  "Id": "e08acd29-f28a-4cbb-b8d6-7df74c7f0e4a",
  "ETag": "\"7800e585-0000-0300-0000-623364bf0000\""
}
```
The above request would publish the item successfully. While providing any other `ETag` value would throw an error and reject the request.

ETags are useful in situations where you're expecting multiple sources to be simultaneously modifying an item and you want to ensure that no data is overridden by another update.
