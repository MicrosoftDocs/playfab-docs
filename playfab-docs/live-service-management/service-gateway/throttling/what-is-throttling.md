---
title: Throttling in PlayFab
author: antnguyen89
description: PlayFab throttling overview.
ms.author: antnguyen
ms.date: 09/30/2026
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

### Title-wide API rate limits

The **key** is the title ID.

### Namespace-wide API rate limits

The **key** is the namespace ID, which Game Manager and older APIs call the Publisher ID. A namespace is the cross-title player identity and shared-data scope, not the administrative studio. For more information, see [PlayFab concepts](../../../get-started/concepts.md#studios-namespaces-and-titles).

### Per-entity API rate limits

- For non-authenticated/anonymous APIs (for example `LoginWith[Platform]` APIs), the **key** is the client's IP address.
- For authenticated APIs: The key is dependent on the request header and request body (which is what is used to determine the calling entity and target entity of an API).
   - The calling entity of an API is the entity tied to the `X-Authorization` token. 
   - The target entity of an API is defined in the request body and varies by API. To determine which entity is being targeted, review the request body for that specific API. For example, the GetUserData API supports specifying a different entity using PlayFabId in its request body.
  - If there's no target entity specified in the body of the API, the **key** is the entity ID of that calling entity.
  - If there's a target entity specified in the body of the API:
     - If the calling entity is a MasterPlayerAccount, TitlePlayerAccount, or Character entity type (for example the API was authenticated with an `X-Authorization` token associated to one of those entity types), the **key** is the calling entity's ID.
     - If the calling entity isn't one of the previous entity types, the **key** becomes the target entity's ID.

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

## View your title's API rate limits

You can see the API rate limits that apply to your title in Game Manager:

1. Sign in to [Game Manager](https://developer.playfab.com/) and select your title.
1. Select **Settings** from the left menu, and then select **Limits**.
1. Select the **API Rate Limits** tab.

The tab shows the limits for your title, including any limits that PlayFab adjusted for your title or namespace. APIs are grouped by product, such as **Identity**, **Economy and UGC**, and **Multiplayer**. To find an API, select its product or enter its name in the search box, for example `LoginWithCustomID`.

Each API's name is followed by the type of its limit:

* **(title limits)**: A title-wide limit. All calls to the API from your title count toward one limit.
* **(namespace limits)**: A namespace-wide limit. All calls to the API from the titles in your namespace count toward one limit.
* **(per-entity limits)**: A per-entity limit. Each key counts toward its own limit.

The **Entity type** column shows which entities a limit applies to:

* For title-wide and namespace-wide limits, it shows **All**.
* For per-entity limits, it shows the type of the entity that the key belongs to, for example `title` or `title_player_account`. PlayFab checks the rows from top to bottom, and **Default** applies to any entity type that doesn't have its own row.

The **Limits** column shows how many calls are allowed in each time window, for example *100 calls per 10 seconds*.

For example, suppose that an API has a per-entity limit with a `title` row and a **Default** row. If your game server calls the API with your title's secret key and the request doesn't target another entity, the key is your title ID, so the `title` row applies. Because all of these calls from your backend share one key, they can reach the limit much sooner than calls from individual players. If a player calls the API, the key is the player's ID, so the **Default** row applies. For more information, see [How PlayFab determines the key for a specific API request](#how-playfab-determines-the-key-for-a-specific-api-request).

## See also

* [Throttling best practices and recommendations](best-practices.md)
* [Economy v2 Limits](../../../economy-monetization/economy-v2/limits.md)
