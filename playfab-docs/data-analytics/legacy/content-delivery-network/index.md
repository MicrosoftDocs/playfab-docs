---
title: Content Delivery Network
author: joannaleecy
description: Landing page for Content Delivery Network.
ms.author: joanlee
ms.date: 02/05/2019
ms.topic: article
ms.service: azure-playfab
keywords: playfab, data, content delivery network, cdn
ms.localizationpriority: medium
---

# Content Delivery Network (CDN)

> [!IMPORTANT]
> PlayFab CDN is a legacy feature supported for accounts with at least one title that has previously configured CDN. For new PlayFab developers interested in a content management solution, we recommend using Azure CDN. To get started, see the [Azure CDN documentation](/azure/cdn/).

The Content Delivery Network (CDN) is an infrastructure used to deliver assets - such as images, audio, binary content, etc. - to the end user that focuses on speed and availability.

## Pricing
CDN costs are independent of your pricing tier (Essentials, Professional, etc.), and require that you have an active PlayFab payment account. CDN has one key meter, **Egress**, which is billed at $0.10 per GB.

## View cost and usage report

To locate the cost of CDN, navigate to the **Title Overview** page, select **Content** from the left navigation menu, and then select **File Management** from the list of tabs. The cost is located at the top of the **File Management** page. CDN costs are calculated based on the number of downloaded gigabytes per title during the billing period.

To view daily content usage, select the **Usage Report** button in the upper right, which will navigate to the Reports page. Select a specific report to see visualizations of the data or download a CSV.

## Links

* [Content Delivery network quickstart](quickstart.md)
