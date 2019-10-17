
---
title: Introduction to Leaderboards v2
author: carocai
description: Introduction to Leaderboards v2.
ms.author: carocai
ms.date: 10/14/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, social, leaderboards
ms.localizationpriority: medium
---

# Introduction to Leaderboards v2

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> This documentation is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles. If you are interested in trying it, please contact us at [helloplayfab@microsoft.com](mailto:helloplayfab@microsoft.com).


## Overview
Leaderboards are such a significant part of game development that we are constantly iterating on customer feedback. To cater to new customer needs, we are currently developing a second version of Leaderboards APIs that would allow many more functionalities that our current Leaderboards APIs don't. Aligned with the new PlayFab entity model, the new APIs sit on top of entity statistics and is backed by Azure.


## Classic Leaderboards Vs. Leaderboards v2

- You can now rank other entity types, in addition to Players that v1 supported.
- V2 added the feature of *child leaderboards*, which allows categorization of leaderboards within the title. 
- You can now *dynamically* add leaderboards on the go
- You can now *delete* leaderboards 
- V2 is based on PlayFab's new entity model
- Updated UX design to support the new features

## Leaderboards Vs. Statistics

Leaderboards are a type, or a subset of Statistics. In other words, it is possible for a Statistic to not be a Leaderboard, but all Leaderboards have to be Statistics. When a Statistic is not a Leaderboard, it just contains a list of *unranked* entries of entities (e.g. players) and values (e.g. scores).   

## Child Leaderboards
Child Leaderboards are a new concept in v2. Now a Statistic can contain "children", or leaderboards that belong to the same category. Adopting Child Leaderboards helps better organize leaderboards. 

An example to help understand this concept is to imagine an array of game streaming rooms. Each room has a list of viewers, who perform some actions to obtain a score. If the goal is to rank the viewers in each room, we can create a Statistic that contains a child leaderboard for each room. 

When you are creating a new Leaderboard, you can specify whether you want child leaderboards. If so, you need to specify whether you want them to be Fixed or Dynamic:
### Fixed Child Leaderboards
 If you choose "Fixed", you can add up to 10 child leaderboards. Note that you won't be able to add more once the parent Statistic is created. Although the maximum number of fixed child leaderboards is 10, you are allowed to have very large child leaderboards under this option. You can visualize the parent leaderboard under this option as fairly *deep*.
### Dynamic  Child Leaderboards
If you choose "Dynamic", you will need to specify the maximum size (number of entities ranked) of your individual child leaderboards. Then you can add child leaderboards "on-the-go" after you create your parant Statistic. While you are limited to having a small number of rankings on each child leaderboard, you are allowed to have a lot of child leaderboards in parallel. You can visualize the parent leaderboard under this option as fairly *wide*.

## Create New Leaderboards on the Game Manager

In the Game Manager:

* Go to **Leaderboards** in the menu to the left.
* Select **NEW LEADERBOARD**.
* Configure your new leaderboard the way you want.
    - **"Statisitc name"** is the name of your new leaderboard. Note that you won't be able to edit the name once the leaderboard is created.
    -** "Reset frequency" **is how often you want your leaderboard to automatically reset. It is currently greyed out because our v2 doesn't support automatic reset yet.
    -** "Agrregation method"** applies to the values in your new leaderboard.
    - Toggle **"Classic statistics"** to make it a v1, or "Classic" leaderboard.
      - If enabled, "Sort direction" and "Child leaderboards" fields will disappear as they are not features supported in v1.
    - **"Sort direction"** allows you to rank your leaderboard in either acsending or descending order.
    - **"Child leaderboards"** allows you to choose between *Dynamic* and *Fixed*, with the differences mentioned under **Child Leaderboards** secion above. Note that you won't be able to change this setting once you create your leaderboard.
* Click **SAVE**.

