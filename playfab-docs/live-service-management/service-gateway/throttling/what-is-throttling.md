---
title: Throttling in PlayFab
author: antnguyen89
description: PlayFab throttling overview.
ms.author: antnguyen
ms.date: 01/26/2024
ms.topic: article
ms.service: azure-playfab
keywords: playfab, throttling, throttle, api, token
ms.localizationpriority: medium
---

# Throttling in PlayFab

Throttling occurs when a client attempts to exceed the API request rate limit set for a specific API.
PlayFab enforces throttling limits to enforce fair access to resources across all titles.

## Understanding PlayFab throttling

PlayFab uses a fixed window rate limiting algorithm. 

Each API request made to PlayFab gets translated into a "key" (the value of this key is dependent on the contents of the API request header and API request body). Each individual API call increments the count for its corresponding key.

If the number of request for a specific key exceeds the number of allowed request for a specified time bucket (alternatively known as the rate limit) for that API, all subsequent requests for that specific key will be throttled.


### How throttling keys are determined for a specific API request

## Title-Wide Limits
The key will be the title id.

## Namespace-Wide Limits
The key will be the namespace id.

## Per-Entity Limits
The key will be dependent on the contents of the request header and request body (which is what is used to determine the calling entity and target entity).
- If the caller is a MasterPlayerAccount, TitlePlayerAccount, or Character entity type, the key wll be the caller entity's id.
- If the caller is NOT one of the above entity type, the key becomes the target entity's id.


A more concrete example:


### Advantages of target entity throttling

Target entity throttling is a mechanism that enforces limits on certain operations based on the type of entity being targeted. These limits help maintain system stability and prevent abuse, giving users:

* Consistent per player limits: Scaling up the title doesn't affect limits for individual players, enabling titles to scale out their playerbase without concerns on capacity limits based off the number of players.  
* Uniform Player Throttling: Regardless of the number of concurrent users on an individual title, players experience the same throttling limits. This allows developers to identify throttling issues early in development with a small user base.  
* Service Stability: Throttling prevents a single player's traffic from overwhelming or adversely affecting PlayFab services or a specific data plane partition shared across multiple titles. 

## See also

* [Throttling best practices and recommendations](best-practices.md)
* [Economy v2 Limits](../../../economy-monetization/economy-v2/limits.md)
