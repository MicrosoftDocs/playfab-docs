---
title: Throttling in PlayFab
author: antnguyen
description: PlayFab throttling overview.
ms.author: antnguyen
ms.date: 01/26/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, throttling, throttle, api, token
ms.localizationpriority: medium
---

# Throttling in PlayFab

Throttling occurs when a client attempts to exceed the API call rate limit set for a specific API or APIs. These limits are in place to prevent any single game from disrupting PlayFab services for others. 

## Understand PlayFab throttling

PlayFab applies the throttling limit based on the target of the request or what the request affects, in most cases. When you use an API that targets or changes one player with a token that is specific to that player, PlayFab chooses rates that are suitable for one player. When requests use a Title specific token and don't target a player, a different set of limits are chosen that is appropriate for a title. These limits are higher than a single player specific token because calling with a title token can affect more players, entities, or take more PlayFab actions faster compared to a single player would. PlayFab also limits the number of requests you can make in a certain timeframes using buckets of allowed requests. Most limits have two buckets: one that lets you make more requests in a short time for burst scenarios and another that lets you make fewer requests in a longer time for normal scenarios.

### Throttling algorithm summary

1. Identify the entity targeted by the API call by first looking in the body (for example title player, title entity, master player, or character).
2. If the body lacks a clear target entity, use the token type (title player, master player, or title) to determine the limit. 
3. If any limit buckets are expired remove them and create new empty buckets. Increment the limit buckets (both burst and sustained) count and check if the call surpasses any of the limits buckets. 
4. If over the limit, return a 429 error with the remaining seconds until a new empty bucket is available. 

### Advantages of target entity throttling

Target entity throttling is a mechanism that enforces limits on certain operations based on the type of entity being targeted. These limits help maintain system stability and prevent abuse, giving users:

* Consistent per player limits: Scaling up the title doesn't affect limits for individual players, enabling titles to expand their user base without concerns about arbitrary capacity limits.  
* Uniform Player Throttling: Regardless of concurrent users, players experience the same throttling. This allows developers to identify throttling issues early in development with a small user base.  
* Service Stability: Throttling prevents a single player's traffic from overwhelming or adversely affecting PlayFab services or a specific data plane partition shared across multiple titles. 

## See also

* [Throttling best practices and recommendations](best-practices.md)
* [Economy v2 Limits](../economy-v2/limits.md)
