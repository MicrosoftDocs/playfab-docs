---
title: Getting a player's Value-to-Date (VTD)
author: v-thopra
description: Demonstrates how to get a player's Value to Date (VTD) from their Player Profile.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, commerce, economy
ms.localizationpriority: medium
---

# Getting a Player's Value-to-Date (VTD)

**Player Profiles** now track the total amount spent by a **Player** as both a total across all currencies converted to USD in the field **totalValueToDateInUSD** and a dictionary field named **valuesToDate** of currency, and total spent in that currency. Both totals are expressed in cents or centesimal.

Along with this, there are two *new* **Segment** predicates:

- **TotalValueToDate** (**Total value to date in USD** in the **UI**)
- **ValueToDate** (**Value to date** in the **UI**).

## Examples

1. Create a **Segment** of all **Players** who have purchased more than 15 USD in any currency.

   ![Create a Segment - Mid Rollers - Filter 1](media/tutorials/create-segment-mid-rollers-filter-1.png)  

2. Create a **Segment** of all **Players** who have spent more more than 15 USD in any currency *or* 15 Chinese Yuan.

   ![Create a Segment - Mid Rollers - Filter 2](media/tutorials/create-segment-mid-rollers-filter-2.png)  

## Player Profile details

The **Player Profile** model now contains the  fields shown below.

```json
// JSON
{
    totalValueToDateInUSD: [nullable uint]
    valuesToDate: [Dictionary string, uint]
}
```

The following **JSON** shows the fields with example values.

```json
// JSON
{
    …
    totalValueToDateInUSD: 1700
    valuesToDate: [{ "USD", 1200 }, { "EUR", 320 }]
    …
}
```
