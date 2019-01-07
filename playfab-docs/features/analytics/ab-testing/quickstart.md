---
title: A/B testing quickstart
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

This quickstart explains how to create **A/B Tests** with **Player buckets**. **A/B Tests** allow you to use the **Buckets** as [player segments](../segmentation/player-segmentation.md). Unlike [player segments](../segmentation/player-segmentation.md), however, **A/B Buckets** distribute **Players** randomly.

**A/B Test Buckets** may then be used in some of the features, where you would normally use **Player** segments. For an example of this, see our tutorial [A/B Testing with Stores and A/B Test Buckets](ab-testing-with-stores-and-test-buckets.md).

## Creating an A/B Test

**A/B Tests** are created through the **PlayFab Game Manager**:

- Open your **Title** page.
- Navigate to the **Automation** tab **(1)**, then to the **A/B Testing** sub-tab **(2)**.
- Finally, locate the **New A/B Test** button **(3)**, as shown below.

![Game Manager - Automation - A/B Testing - Open New A/B Test](media/tutorials/game-manager-automation-ab-testing-open-new-ab-test.png)  

A new **A/B Test** page will open. Keep in mind, that once created, an **A/B Test** cannot be modified.

- Fill in the **A/B Test** name **(1)**.
- Set the number of **Player** groups (**Buckets**) **(2)**.
- For each **Bucket**, define a **Name** and a **Percentage** of **Players** that belong to the bucket **(3)**.
- Select the **Save A/B Test** button **(4)** to submit the test.

The workflow is illustrated in the picture shown below.

![Game Manager - Automation - A/B Testing - New A/B Test](media/tutorials/game-manager-automation-ab-testing-new-ab-test.png)  

The **A/B Testing** page will open and a newly created **Test** will appear in the list.

![Game Manager - Automation - A/B Testing - List A/B Tests](media/tutorials/game-manager-automation-ab-testing-list-ab-tests.png)  
