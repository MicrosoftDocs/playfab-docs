---
title: A/B Testing quickstart
author: v-thopra
description: Demonstrates how to create A/B tests with player buckets.
ms.author: v-thopra
ms.date: 30/10/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, a/b testing
ms.localizationpriority: medium
---

# A/B Testing quickstart

This quickstart explains how to create **A/B Tests** with **Player Buckets**.

**A/B Tests** allow you to use the buckets as [Player Segments](../segmentation/player-segmentation.md). Unlike [player segments](../segmentation/player-segmentation.md), however, **A/B Buckets** distribute **Players** randomly.

**A/B Tests Buckets** may then be used in some of the features, where you would normally use **Player Segments**. For an example of this, see our tutorial [A/B Testing with Stores and A/B Test Buckets](ab-testing-with-stores-and-test-buckets.md).

## Creating an A/B Test

**A/B Tests** are created through the **PlayFab Game Manager**. Open your **Title** page:

- Select **Automation (1)** from the left-hand menu.
- Move to the **A/B Testing** tab **(2)**.
- Locate the **New A/B Test** button **(3)**.

![Game Manager - Automation - A/B Testing - Open New A/B Test](media/tutorials/game-manager-automation-ab-testing-open-new-ab-test.png)  

A new **A/B Test** page will open. Keep in mind that once created, an **A/B Test** *cannot* be modified.

- Fill in the **A/B Test Name (1)**.
- Set the number of **Player Groups** (**Buckets**) **(2)**.
- For each **Bucket** you define a **Name** and a percentage of **Players** that belong to the **Bucket (3)**.
- Select the **Save A/B Test** button **(4)** to submit the test.

![Game Manager - Automation - A/B Testing - New A/B Test](media/tutorials/game-manager-automation-ab-testing-new-ab-test.png)  

The **A/B Testing** page will open and a newly created **Test** will appear in the list.


![Game Manager - Automation - A/B Testing - List A/B Tests](media/tutorials/game-manager-automation-ab-testing-list-ab-tests.png)  
