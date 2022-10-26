---
title: Economy v2 Storage Meter API Description
author: cybtachyon
description: This file details the APIs that cause Economy v2 storage meter to increment.
ms.author: derekreese
ms.date: 09/07/2022
ms.topic: article
ms.service: playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Economy v2 Storage

The storage meter is determined by the total size of all content (both files and images). 5 GB is included in all pricing plans. For more storage, there are three different rates for this meter depending on the plan.

The meter includes content associated with items that haven't been published, and items that aren't visible via the public catalog. For more information on how items can be hidden from the public catalog, see [Catalog Item Status](../../economy-v2/catalog/item-status.md).

## Included Meters

There's a set of included meters for all PlayFab customers, regardless of the selected plan:

Meter | Included Amount
--- | :---:
Up to 1 MB Requests | 150k requests
Storage | 5 GB

> [!NOTE]
> Studios in Development Mode are required to enter payment information before enabling Catalog v2, and overages will be charged based on the rates above.
