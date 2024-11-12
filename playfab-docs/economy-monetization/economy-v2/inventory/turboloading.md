---
title: Economy V2 TurboLoading
author: fprotti96
description: Introduction to Economy V2 TurboLoading
ms.author: fprotti
ms.date: 3/18/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, economy, turboloading, inventory, getinventoryitems
ms.localizationpriority: medium
---

# Economy V2 TurboLoading

With TurboLoading, you can load your entire inventory with a single request to the `GetInventoryItems` API. This improves your startup latency and performance, as you don't have to make multiple calls to load all the items from your inventory collection. For billing purposes, every 250 items is treated as a single page, so your costs should not change.

## How does TurboLoading work?

TurboLoading is currently available for all titles using the Economy V2 REST API. The PlayFab Services C# and Unity SDKs have further support for compression, including transparently handling decompression for you. To activate TurboLoading, you need to:

- Set the `Count` parameter of the `GetInventoryItems` API to more than 250 items. You can set it up to the maximum size of an inventory collection, which is 10,000 items.
- Include the `Accept-Encoding: gzip` header in your request.
- Decompress the response using `gzip` before you can use the inventory data.

For example, if you want to load your entire inventory of 700 items, you can make a single call to the `GetInventoryItems` API with a count of 700 and the `Accept-Encoding: gzip` header. You get a compressed response with all your inventory items. You need to decompress the response using gzip before you can use the data.

### Using TurboLoading with PlayFab Services C# and Unity SDK

You can set compression (and automatic decompression) of all API responses using the PlayFab Services C# and Unity SDKs, as follows:

```csharp
PlayFabSettings.staticSettings.CompressResponses = true;
```

Or you can set compression (and automatic decompression) only for your Economy API instance, as follows:

```csharp
var economyApi = new PlayFabEconomyInstanceAPI(new PlayFabApiSettings { CompressResponses = true }, authContext);
```

## Billing

TurboLoading is billed per returned page, meaning the total number of items being returned divided by 250 (rounded up). You pay the same as if you're loading 250 items per page. For example, if you load 700 items, with TurboLoading, you get billed for 3 requests (700 / 250 = 2.8, rounded up to 3).

## Benefits

TurboLoading offers several benefits, such as:

- Improved game performance and reduced startup latency, as you don't have to make multiple calls to load your inventory items.
- Reduced complexity and code maintenance, as you don't have to handle pagination and looping logic.

## See also

* [Economy V2 overview](../../economy-v2/overview.md)
* [GetInventoryItems](/rest/api/playfab/economy/inventory/get-inventory-items)
* [Limits](../../economy-v2/limits.md)