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

If the number of API requests for a specific key exceeds the number of allowed request for a specified time bucket (alternatively known as the rate limit) for that API, all subsequent requests for that specific key will be throttled.


## How PlayFab determines the key for a specific API request

### Title-Wide API Rate Limits
The **key** will be the title id.

### Namespace-Wide API Rate Limits
The **key** will be the namespace id.

### Per-Entity API Rate Limits

- For non-authenticated/anonymous APIs (e.g. LoginWith[Platform] APIs), the **key** will be the client's IP address.
- For authenticated APIs: The key will be dependent on the the request header and request body (which is what is used to determine the calling entity and target entity of an API).
   - The calling entity of an API is the entity tied to the `X-Authorization` token. 
   - The target entity of an API is the entity specified in the request body - this might vary per API, and you can check this by looking at the request body for a specific API (if the API does not support targetting a different entity, then the target and the caller would be the same).
  - If there is no target entity specified in the body of this API, the **key** will be the entity ID of that caller.
  - If there is a target entity specified in the body of this API:
     - If the calling entity is a MasterPlayerAccount, TitlePlayerAccount, or Character entity type (e.g. the API was authenticated , the **key** wll be the caller entity's id.
     - If the target entity is NOT one of the above entity types, the **key** becomes the target entity's id.

Here are some more concrete examples:

1. Client with IP address 123 calls Client/LoginWith[Platform] API. The key for this API is 123.
2. Client calls Client/SampleAPI and provides an `X-Authorization` token that corresponds to master player account ID 456. There is nothing in the request body for this API that mentions another entity id. The key for this API is 456.
3. Client calls Client/SampleAPI2 and provides an `X-Authorization` token that corresponds to master player account ID 456. In the request body, the client supplies a value of master player account 789. The key for this API is 456.
4. Client calls Client/SampleAPI3 and provides an `X-Authorization` token that corresponds to title ID 0. In the request body, the client supplies a value of master player account 789. The key for this API is 0. 

### Advantages of target entity throttling

Target entity throttling is a mechanism that enforces limits on certain operations based on the type of entity being targeted. These limits help maintain system stability and prevent abuse, giving users:

* Consistent per player limits: Scaling up the title doesn't affect limits for individual players, enabling titles to scale out their playerbase without concerns on capacity limits based off the number of players.  
* Uniform Player Throttling: Regardless of the number of concurrent users on an individual title, players experience the same throttling limits. This allows developers to identify throttling issues early in development with a small user base.  
* Service Stability: Throttling prevents a single player's traffic from overwhelming or adversely affecting PlayFab services or a specific data plane partition shared across multiple titles. 

## See also

* [Throttling best practices and recommendations](best-practices.md)
* [Economy v2 Limits](../../../economy-monetization/economy-v2/limits.md)
