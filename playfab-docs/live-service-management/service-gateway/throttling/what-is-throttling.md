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

Each API request made to PlayFab gets translated into a "key." The value of this key is dependent on the contents of the API request header and API request body. Each individual API call increments the count for its corresponding key.

If a specific key makes more API requests than allowed within a set time period (the rate limit), any further requests using that key are throttled.


## How PlayFab determines the key for a specific API request

### Title-Wide API Rate Limits
The **key** is the title ID.

### Namespace-Wide API Rate Limits
The **key** is the namespace ID.

### Per-Entity API Rate Limits

- For non-authenticated/anonymous APIs (for example `LoginWith[Platform]` APIs), the **key** is the client's IP address.
- For authenticated APIs: The key is dependent on the request header and request body (which is what is used to determine the calling entity and target entity of an API).
   - The calling entity of an API is the entity tied to the `X-Authorization` token. 
   - The target entity of an API is defined in the request body and varies by API. To determine which entity is being targeted, review the request body for that specific API. For example, the GetUserData API supports specifying a different entity using PlayFabId in its request body.
  - If there's no target entity specified in the body of the API, the **key** is the entity ID of that calling entity.
  - If there's a target entity specified in the body of the API:
     - If the calling entity is a MasterPlayerAccount, TitlePlayerAccount, or Character entity type (for example the API was authenticated with an `X-Authorization` token associated to one of those entity types), the **key** is the calling entity's ID.
     - If the calling entity is NOT one of the previous entity types, the **key** becomes the target entity's ID.

Here are some examples of the per-entity API rate limit logic:
1. Client with IP address 23.192.228.80 calls `Client/LoginWith[Platform]` API. The key for the API request is 23.192.228.80.
2. Client calls `Client/LinkCustomID` and provides an `X-Authorization` token that corresponds to master player account ID 408C36ADC841C0CD. There's nothing in the request body for the API that mentions another entity ID. The key for the API request is 408C36ADC841C0CD.
3. Client calls `Client/GetUserPublisherData` and provides an `X-Authorization` token that corresponds to master player account ID D5491A06D715E817. In the request body, the client supplies a value of master player account 25254A5AC4AEBA55 (for example, the request body has PlayFabId:25254A5AC4AEBA55). The key for the API request is D5491A06D715E817 because the calling entity here's a master player account.
4. Client calls `Client/GetUserPublisherData` and provides an `X-Authorization` token that corresponds to title ID 123. In the request body, the client supplies a value of master player account 25254A5AC4AEBA55 (for example, the request body has PlayFabId:25254A5AC4AEBA55). The key for the API request is 25254A5AC4AEBA55 because the calling entity here's a title.

### Advantages of target entity throttling

Target entity throttling is a mechanism that enforces limits on certain operations based on the type of entity being targeted. These limits help maintain system stability and prevent abuse, giving users:

* Consistent per player limits: Scaling up the title doesn't affect limits for individual players, enabling titles to scale out their player base without concerns on capacity limits based off the number of players.  
* Uniform Player Throttling: Players experience the same throttling limits regardless of how many users are active on a title, enabling developers to detect throttling issues early - even with a small user base. 
* Service Stability: Throttling prevents a single player's traffic from overwhelming or adversely affecting PlayFab services or a specific data plane partition shared across multiple titles. 

## See also

* [Throttling best practices and recommendations](best-practices.md)
* [Economy v2 Limits](../../../economy-monetization/economy-v2/limits.md)
