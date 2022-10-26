---
title: Economy Writes Meter API Description
author: cybtachyon
description: This article details the APIs that cause economy writes meter to increment.
ms.author: derekreese
ms.date: 09/07/2020
ms.topic: article
ms.service: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Economy v2 Catalog Writes

Catalog writes are more expensive operations as they update all of the indexes and searchable metadata.
The following APIs cause the Economy v2 writes meter to increment.

- [CreateDraftItem](/rest/api/playfab/economy/catalog/create-draft-item)
- [CreateUploadUrls](/rest/api/playfab/economy/catalog/create-upload-urls)
- [DeleteEntityItemReviews](/rest/api/playfab/economy/catalog/delete-entity-item-reviews)
- [DeleteItem](/rest/api/playfab/economy/catalog/delete-item)
- [PublishDraftItem](/rest/api/playfab/economy/catalog/publish-draft-item)
- [ReportItem](/rest/api/playfab/economy/catalog/report-item)
- [ReportItemReview](/rest/api/playfab/economy/catalog/report-item-review)
- [ReviewItem](/rest/api/playfab/economy/catalog/review-item)
- [SetItemModerationState](/rest/api/playfab/economy/catalog/set-item-moderation-state)
- [SubmitItemReviewVote](/rest/api/playfab/economy/catalog/submit-item-review-vote)
- [TakedownItemReviews](/rest/api/playfab/economy/catalog/takedown-item-reviews)
- [UpdateCatalogConfig](/rest/api/playfab/economy/catalog/update-catalog-config)
- [UpdateDraftItem](/rest/api/playfab/economy/catalog/update-draft-item)
