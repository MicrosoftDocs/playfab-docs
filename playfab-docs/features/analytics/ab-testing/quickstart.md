---
title: A/B Testing quickstart
author: v-thopra
description: Demonstrates how to create A/B tests with player buckets.
ms.author: v-thopra
ms.date: 10/30/2018
ms.topic: article
ms.prod: playfab
keywords: playfab, analytics, a/b testing
ms.localizationpriority: medium
---

# A/B testing quickstart

This quickstart explains how to create A/B tests with player buckets.

A/B tests allow you to use the buckets as [Player Segments](../segmentation/index.md). Unlike [player segments](../segmentation/index.md), however, A/B buckets distribute players randomly.

A/B tests buckets may then be used in some of the features, where you would normally use player segments.

For an example of this, see our tutorial [A/B Testing with Stores and A/B Test Buckets](ab-testing-with-stores-and-test-buckets.md).

## Creating an A/B test

A/B tests are created through the PlayFab Game Manager. Open your **Title** page:

1. Select **Automation** from the left-hand menu.

2. Move to the **A/B Testing** tab.

3. Select the **NEW A/B TEST** button.

![Game Manager - Automation - A/B Testing - Open New A/B Test](media/tutorials/game-manager-automation-ab-testing-open-new-ab-test.png)  

A new **A/B Test** page will open. Keep in mind that once created, an **A/B Test** *cannot* be modified.

1. Fill in the **A/B Test Name**.

2. Set the number of buckets for your player groups.

3. Name each **Bucket** you define and select a percentage of **Players** that belong to the **Bucket**.

4. Select the **SAVE A/B TEST** button to submit the test.

The workflow is illustrated in the following picture.

![Game Manager - Automation - A/B Testing - New A/B Test](media/tutorials/game-manager-automation-ab-testing-new-ab-test.png)  

The **A/B Testing** page will open and a newly created **Test** will appear in the list (shown below).

![Game Manager - Automation - A/B Testing - List A/B Tests](media/tutorials/game-manager-automation-ab-testing-list-ab-tests.png)

## Links

To dive deeper into A/B testing, read the following tutorials:

- [A/B Testing with Stores and test buckets](ab-testing-with-stores-and-test-buckets.md)

- [A/B Testing with Title data](ab-testing-with-title-data.md)  
