---
title: Introduction to Leaderboards v2
author: xmcai2016
description: Introduction to Leaderboards v2.
ms.author: joanlee
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
> Access to this feature is restricted to select titles that PlayFab actively reaches out to.




## Overview
Leaderboards are such a significant part of game development that we are constantly iterating on customer feedback. To cater to new customer needs, we are currently developing a second version of Leaderboards APIs that would allow many more functionalities that our current Leaderboards APIs don't. Aligned with the new PlayFab entity model, the new APIs sit on top of entity statistics and is backed by Azure.


### Classic Leaderboards Vs. Leaderboards v2

- You can now rank other entity types, in addition to Players that v1 supported.
- V2 added the feature of *child leaderboards*, which allows categorization of leaderboards within the title. 
- You can now *dynamically* add leaderboards on the go
- You can now *delete* leaderboards 
- V2 is based on PlayFab's new entity model
- Updated UX design to support the new features

### Leaderboards Vs. Statistics

Leaderboards are a type, or a subset of Statistics. In other words, it is possible for a Statistic to not be a Leaderboard, but all Leaderboards have to be Statistics. When a Statistic is not a Leaderboard, it just contains a list of *unranked* entries of entities (e.g. players) and values (e.g. scores).
