---
title: Inventory Writes Meter API Description
author: cybtachyon
description: This article details the APIs that cause economy writes meter to increment.
ms.author: derekreese
ms.date: 09/07/2020
ms.topic: article
ms.service: azure-playfab
keywords: playfab, pricing
ms.localizationpriority: medium
---

# Economy v2 Inventory Writes

Inventory writes are more expensive operations as they update all of the indexes and searchable metadata.
The following APIs cause the Economy v2 writes meter to increment.

* [/rest/api/playfab/economy/inventory/add-inventory-items](/rest/api/playfab/economy/inventory/add-inventory-items)
* [/rest/api/playfab/economy/inventory/delete-inventory-collection](/rest/api/playfab/economy/inventory/delete-inventory-collection)
* [/rest/api/playfab/economy/inventory/delete-inventory-items](/rest/api/playfab/economy/inventory/delete-inventory-items)
* [/rest/api/playfab/economy/inventory/execute-inventory-operations](/rest/api/playfab/economy/inventory/execute-inventory-operations)
* [/rest/api/playfab/economy/inventory/purchase-inventory-items](/rest/api/playfab/economy/inventory/purchase-inventory-items)
* [/inventory/subtract-inventory-items](/inventory/subtract-inventory-items)
* [/rest/api/playfab/economy/inventory/transfer-inventory-items](/rest/api/playfab/economy/inventory/transfer-inventory-items)
* [/rest/api/playfab/economy/inventory/update-inventory-items](/rest/api/playfab/economy/inventory/update-inventory-items)

## Resources

* For the most up-to-date view of prices per meter, see [https://playfab.com/pricing/](https://playfab.com/pricing/)
* See [../consumption-best-practices.md](../consumption-best-practices.md) to learn how to maintain the lowest rate of meter usage and cost for your game
