---
title: Leaderboards v2 child leaderboards
author: xmcai2016
description: Tutorials for Child Leaderboards.
ms.author: waralp
ms.date: 10/18/2019
ms.topic: article
ms.prod: playfab
keywords: playfab, social, leaderboards
ms.localizationpriority: medium
---


# Child Leaderboard Tutorial

> [!IMPORTANT]
> This feature is currently in **Private Preview**.  
>
> This documentation is provided to give you an early look at an upcoming feature and to allow you to provide feedback while it is still in development.  
>
> Access to this feature is restricted to select titles that PlayFab actively reaches out to.

### Child Leaderboards
Child Leaderboards are a new concept in v2. Now a Statistic can contain "children", or leaderboards that belong to the same category. Adopting Child Leaderboards helps better organize leaderboards. 

An example to help understand this concept is to imagine an array of game streaming rooms. Each room has a list of viewers, who perform some actions to obtain a score. If the goal is to rank the viewers in each room, we can create a Statistic that contains a child leaderboard for each room. 

When you are creating a new Leaderboard, you can specify whether you want child leaderboards. If so, you need to specify whether you want them to be Fixed or Dynamic:
#### Fixed Child Leaderboards
If you choose "Fixed", you can add up to 10 child leaderboards. Note that you won't be able to add more once the parent Statistic is created. Although the maximum number of fixed child leaderboards is 10, you are allowed to have very large child leaderboards under this option. You can visualize the parent leaderboard under this option as fairly *deep*.

#### Dynamic  Child Leaderboards
If you choose "Dynamic", you will need to specify the maximum size of your individual child leaderboards. You can rank at most 100 items on each child leaderboard. Note that this size limit is maximum size of each individual child leaderboard, not the total number of child leaderboards that you are allowed to have. 

You can add child leaderboards "on-the-go" after you create your parant Statistic. While you are limited to having a small number of rankings on each child leaderboard, you are allowed to have a lot of child leaderboards in parallel. You can visualize the parent leaderboard under this option as fairly *wide*.
